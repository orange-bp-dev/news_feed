import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged onCategorySelected;
  CategoryChips({this.onCategorySelected});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 4,
        children: List<Widget>.generate(categories.length, (int index) {
          return ChoiceChip(
              label: Text(categories[index].nameJp),
              pressElevation: 10,
              autofocus: true,
              selectedColor: Colors.white,
              selected: value == index,
              onSelected: (bool isSelected) {
                setState(() {
                  value = isSelected ? index : 0;
                  widget.onCategorySelected(categories[index]);
                });
              });
        }));
  }
}
