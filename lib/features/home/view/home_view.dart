import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/home/data/product_model.dart';
import 'package:hungry/features/home/view/widget/product_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedCategory = 0;

  List<ProductModel> products = [
    ProductModel(
      name: 'Cheese Burger',
      description: 'Juicy grilled beef patty with cheese, lettuce, and tomato.',
      rating: 4.5,
      category: "Combos",
      imagePath: 'assets/burger/image 1.png',
    ),
    ProductModel(
      name: 'Chicken Slider',
      description:
          'Crispy chicken slider with mayo, pickles, and lettuce on a soft bun.',
      rating: 4.2,
      category: "Sliders",
      imagePath: 'assets/burger/image 1.png',
    ),
    ProductModel(
      name: 'Classic Burger',
      description:
          'Traditional beef burger with lettuce, tomato, onion, and special sauce.',
      rating: 4.0,
      category: "Classic",
      imagePath: 'assets/burger/image 1.png',
    ),
    ProductModel(
      name: 'Veggie Burger',
      description:
          'Delicious veggie patty with avocado, sprouts, and vegan mayo on a whole wheat bun.',
      rating: 4.3,
      category: "Combos",
      imagePath: 'assets/burger/image 1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/logo/Hungry_.svg",
                          width: 70.w,
                          height: 35.h,
                          color: AppColor.primryColor,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Hello, Ahmed',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage(
                      'assets/burger/image 1.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
                child: Row(
                  children: [
                    Icon(Icons.search, size: 24.r, color: Colors.grey.shade600),
                    SizedBox(width: 12.w),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 46.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedCategory;
                    return GestureDetector(
                      onTap: () => setState(() => selectedCategory = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItem(product: products[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
