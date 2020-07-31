import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';

class BubbledNavigationBarWidget extends StatefulWidget {
  final titles = ["Completed", "Not Completed"];
  final icons = [Icons.done, Icons.not_interested];

  @override
  _BubbledNavigationBarWidgetState createState() =>
      _BubbledNavigationBarWidgetState();
}

class _BubbledNavigationBarWidgetState
    extends State<BubbledNavigationBarWidget> {
  MenuPositionController _menuPostionController;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BubbledNavigationBar(
      controller: _menuPostionController,
      initialIndex: 0,
      itemMargin: EdgeInsets.symmetric(horizontal: 8),
      onTap: (index) {
        _pageController.animateToPage(
          index,
          duration: Duration(microseconds: 500),
          curve: Curves.easeInOutQuad,
        );
      },
      items: widget.titles.map((title) {
        var index = widget.titles.indexOf(title);
        return BubbledNavigationBarItem(
          icon: getIcon(index),
          activeIcon: getIcon(index),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }).toList(),
    );
  }

  Padding getIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30),
    );
  }
}
