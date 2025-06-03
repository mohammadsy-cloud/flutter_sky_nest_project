import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 5),
          child: IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: ColorPallete.grayColor2,
            ),
            icon: Icon(Icons.remove, size: 15),
          ),
        ),
        Text('0', style: TextStyle(fontSize: 18)),
        Padding(
          padding: const EdgeInsets.only(right: 3.0, left: 5),
          child: IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
            icon: Icon(Icons.add, size: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
