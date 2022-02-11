import 'package:flutter/material.dart';
import 'package:kycbscore/presentation/themes/pallete.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  bool isLogin;

  RoundedButton({
    Key? key,
    required this.buttonName,
    required this.isLogin,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () {
          
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}