import 'package:flutter/material.dart';

class DashedLines extends StatelessWidget {
  const DashedLines({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(150~/3, (index) => 
        Expanded(
          child: Container(
            color: index%2==0 ? Colors.transparent :Colors.grey.withOpacity(0.4),
            height: 2,
          ),
        )
      ),
    );
  }
}