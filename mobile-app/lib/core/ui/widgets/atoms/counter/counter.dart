import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ACounter extends StatelessWidget {
  int value;

  ACounter({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            value.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ));
  }
}
