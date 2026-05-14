import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/views/profile_view.dart';
import 'package:hungry/features/card/view/card_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderDeteils/view/order_deteils.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> screens;
  late PageController controller;
  int currentScreen = 0;
  @override
  void initState() {
    super.initState();
    screens = [HomeView(), CardView(), OrderDeteils(), ProfileView()];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        children: screens,
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.primryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColor.primryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: 'Order Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
          currentIndex: currentScreen,
          onTap: (value) {
            setState(() {
              currentScreen = value;
            });
            controller.jumpToPage(currentScreen);
          },
        ),
      ),
    );
  }
}
