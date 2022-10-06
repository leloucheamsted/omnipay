import 'package:flutter/material.dart';
import 'package:omnipay/modules/common/constants/constants.dart';

class Title1 extends StatelessWidget {
  final String content;
  final Color color;
  const Title1({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontBold,
        fontWeight: FontWeight.w700,
        fontSize: FontsSizeConstants.title1,
      ),
    );
  }
}

class Title2 extends StatelessWidget {
  final String content;
  final Color color;
  const Title2({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontBold,
        fontWeight: FontWeight.w700,
        fontSize: FontsSizeConstants.title2,
      ),
    );
  }
}

class Title3 extends StatelessWidget {
  final String content;
  final Color color;
  const Title3({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontMedium,
        fontWeight: FontWeight.w500,
        fontSize: FontsSizeConstants.title3,
      ),
    );
  }
}

class SubTitle1 extends StatelessWidget {
  final String content;
  final Color color;
  const SubTitle1({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.subtitle1,
      ),
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String content;
  final Color color;
  const SubTitle2({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.title3,
      ),
    );
  }
}

class SubTitle4 extends StatelessWidget {
  final String content;
  final Color color;
  const SubTitle4({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.subtitle1,
      ),
    );
  }
}

class BodyText1 extends StatelessWidget {
  final String content;
  final Color color;
  final TextAlign? textAlign;
  const BodyText1(
      {super.key, required this.content, required this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.title3,
      ),
    );
  }
}

class BodyText2 extends StatelessWidget {
  final String content;
  final Color color;
  const BodyText2({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.bodytext1,
      ),
    );
  }
}

class BodyText3 extends StatelessWidget {
  final String content;
  final Color color;
  const BodyText3({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w400,
        fontSize: FontsSizeConstants.bodytext2,
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  final String content;
  final Color color;
  const ErrorText({super.key, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontFamily: FontsFamilyConstants.fontRegular,
        fontWeight: FontWeight.w500,
        fontSize: FontsSizeConstants.bodytext1,
      ),
    );
  }
}
