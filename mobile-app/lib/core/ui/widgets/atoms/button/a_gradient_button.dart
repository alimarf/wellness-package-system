import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../colors/colors.dart';
import '../loading/a_loading.dart';

// ignore: must_be_immutable
class AGradientButton extends StatefulWidget {
  final String text;
  final Function onClick;
  bool? isLoading;

  AGradientButton({Key? key, required this.text, required this.onClick, this.isLoading})
      : super(key: key);

  @override
  State<AGradientButton> createState() => _AGradientButtonState();
}

class _AGradientButtonState extends State<AGradientButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onClick(),
      child: Container(
        width: context.width - 80,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    0,
                    4,
                  ),
                  blurRadius: 4)
            ],
            gradient: const LinearGradient(
                colors: [Color(0xFF3D1EFF), Color(0xFF30B4FF)])),
        child: Center(
          child: Container(
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(widget.isLoading == true)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ALoading(),
                  ),
                Text(widget.text,
                    style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[Color(0xFF3D1EFF), Color(0xFF30B4FF)],
                          ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 250.0, 100.0)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
