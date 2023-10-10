import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/utils/AppString.dart';
import '../../../core/global/theme/ColorManager.dart';
import '../../data/models/ButtomNavigationBarModel.dart';
import '../controllers/HomeController.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<CustomBottomNavigationBarItem> bottomNavBarItems = [
      CustomBottomNavigationBarItem(
        icon: Icons.home_filled,
        title: AppString.home,
      ),
      CustomBottomNavigationBarItem(
        icon: Icons.local_fire_department_outlined,
        title: AppString.trending,
      ),
      CustomBottomNavigationBarItem(
        icon: Icons.search,
        title: AppString.search,
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItems.asMap().entries.map((entry) {
          int index = entry.key;
          CustomBottomNavigationBarItem item = entry.value;
          return GetBuilder<HomeController>(
            builder: (context) {
              bool isSelected = index == controller.selectedIndex.value;
              return InkWell(
                onTap: () => {controller.updateIndex(index)},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),
                    Icon(
                      item.icon,
                      color: isSelected
                          ? ColorManager.primary
                          : ColorManager.grayColor,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 60,
                      height: 3,
                      color: index == controller.selectedIndex.value
                          ? ColorManager.primary
                          : Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
