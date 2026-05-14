import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_color.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final List<_CartItem> _items = [
    const _CartItem(
      name: 'Hamburger',
      description: 'Veggie Burger',
      imagePath: 'assets/burger/image 1.png',
      quantity: 2,
    ),
    _CartItem(
      name: 'Hamburger',
      description: 'Veggie Burger',
      imagePath: 'assets/burger/image 1.png',
      quantity: 2,
    ),
    _CartItem(
      name: 'Hamburger',
      description: 'Veggie Burger',
      imagePath: 'assets/burger/image 1.png',
      quantity: 2,
    ),
  ];

  void _updateQuantity(int index, int delta) {
    setState(() {
      final item = _items[index];
      final newQuantity = item.quantity + delta;
      if (newQuantity > 0) {
        _items[index] = item.copyWith(quantity: newQuantity);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  double get _totalPrice =>
      _items.fold(0, (sum, item) => sum + item.quantity * item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return _buildItemCard(item, index);
                  },
                ),
              ),
              SizedBox(height: 18.h),
              _buildTotalCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(_CartItem item, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              item.imagePath,
              width: 96.w,
              height: 96.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    _buildQuantityButton('-', () => _updateQuantity(index, -1)),
                    SizedBox(width: 10.w),
                    Text(
                      item.quantity.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    _buildQuantityButton('+', () => _updateQuantity(index, 1)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          ElevatedButton(
            onPressed: () => _removeItem(index),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            ),
            child: Text(
              'Remove',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 38.w,
      height: 38.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$${_totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor.primryColor,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            ),
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItem {
  const _CartItem({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.quantity,
    this.price = 33.06,
  });

  final String name;
  final String description;
  final String imagePath;
  final int quantity;
  final double price;

  _CartItem copyWith({int? quantity}) {
    return _CartItem(
      name: name,
      description: description,
      imagePath: imagePath,
      quantity: quantity ?? this.quantity,
      price: price,
    );
  }
}
