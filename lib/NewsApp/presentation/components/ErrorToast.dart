import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

import '../../../core/global/theme/ColorManager.dart';

class ErrorToast extends StatefulWidget {
  final Callback callback;
  const ErrorToast({super.key, required this.callback});

  @override
  State<ErrorToast> createState() => _ErrorToastState();
}

class _ErrorToastState extends State<ErrorToast> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
       Center(child: Lottie.asset('assets/lottie/wrong.json',)),
        Positioned(
          bottom:  50,
          left: Get.width*0.41,
          child: TextButton(onPressed: widget.callback,style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                  side:  BorderSide(color: ColorManager.primary), // Border color
                ),
              ), child: const Text("Try again")),
        )
      ],
    );
  }
}