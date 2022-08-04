import 'package:flutter/material.dart';

class CastWidjet extends StatelessWidget {
  final List<String>? casts;

  CastWidjet({this.casts});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 22,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Text(
                '${casts![index]}' + (index != casts!.length - 1 ? ', ' : ''),
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: casts!.length,
      ),
    );
  }
}
