import 'package:flutter/material.dart';

import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({
    super.key,
    required this.titles,
    required this.onSelected,
  });
  final List<String> titles;
  final void Function(int index) onSelected;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  double _left = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTapDown: (TapDownDetails details) {
            final localPosition = details.localPosition;

            final renderBox = context.findRenderObject() as RenderBox;
            final size = renderBox.size;

            if (localPosition.dx < (0.9 * size.width) / 3) {
              _onSelected(0, 0);
            } else if (localPosition.dx < (1.65 * size.width) / 3) {
              _onSelected(1, size.width / 3);
            } else {
              _onSelected(2, (1.95 * size.width) / 3);
            }
          },
          child: Container(
            width: screenWidth(context) * 0.8,
            height: screenHeight(context) * 0.07,
            decoration: BoxDecoration(
              color: ColorPallete.grayColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  widget.titles.map((title) {
                    return Text(
                      title,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    );
                  }).toList(),
            ),
          ),
        ),
        AnimatedPositioned(
          left: _left,
          duration: Duration(milliseconds: 200),

          child: Container(
            width: screenWidth(context) * 0.28,
            height: screenHeight(context) * 0.07,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.titles[_currentIndex],
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  void _onSelected(int index, double left) {
    setState(() {
      _currentIndex = index;
      _left = left;
      widget.onSelected(index);
    });
  }
}
