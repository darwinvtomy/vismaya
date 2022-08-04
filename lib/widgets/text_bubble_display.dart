import 'package:flutter/material.dart';

class BubblesText extends StatelessWidget {
  final List<String>? arrayString;

  BubblesText({this.arrayString});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 22,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white30, width: 0.3),
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
                color: Colors.grey.shade900),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                arrayString![index],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: arrayString?.length,
      ),
    );
  }
}
