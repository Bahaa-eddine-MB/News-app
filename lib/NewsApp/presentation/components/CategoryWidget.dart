import 'package:flutter/material.dart';
import 'package:news_app/core/global/theme/ColorManager.dart';

class CategoryCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.text,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.isSelected ? ColorManager.primary : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))
          ),
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.isSelected
                    ? Colors.white
                    : ColorManager.lightTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
