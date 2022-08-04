import 'package:flutter/material.dart';

class GenereWidjet extends StatelessWidget {
  final List<String>? generes;

  GenereWidjet({this.generes});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 22,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Text(
                generes![index] + (index != generes!.length - 1 ? ' | ' : ''),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: generes?.length,
      ),
    );
  }
}
