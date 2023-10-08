
import 'package:flutter/material.dart';
import 'package:news_app/core/global/theme/ColorManager.dart';
import 'package:news_app/core/global/theme/FontManager.dart';
import 'package:news_app/core/global/theme/StylesManager.dart';

class GrayBodyText extends StatelessWidget {
  final String text;

  const GrayBodyText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        textAlign: TextAlign.center,
        text,
        style: getRegularTextStyle(
            fontSize: FontSize.s16, color: ColorManager.lightTextColor,line:false),
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class GrayBodyTitle extends StatelessWidget {
  final String text;

  const GrayBodyTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getBoldTextStyle(
            fontSize: FontSize.s20, color: ColorManager.lightTextColor),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class GrayBodyTextMedium extends StatelessWidget {
  final String text;

  const GrayBodyTextMedium({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s20, color: ColorManager.lightTextColor),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}
class GrayStepTexts extends StatelessWidget {
  final String text;

  const GrayStepTexts({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s20, color: ColorManager.lightTextColor),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}
class TextFeildLabel extends StatelessWidget {
  final String text;

  const TextFeildLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getRegularTextStyle(
            fontSize: FontSize.s14, color: ColorManager.lightTextColor,line:false),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class PanierText extends StatelessWidget {
  final String text;
  final Color color;
  const PanierText({
    Key? key,
    required this.text, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s14, color: color),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class CustomTextMedium extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTextMedium({
    Key? key,
    required this.text, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s16, color: color),
        textAlign: TextAlign.center,
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class AppBodyText extends StatelessWidget {
  final String text;
  final Color color;
  const AppBodyText({
    Key? key,
    required this.text, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s16, color: color),
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class PromotionText extends StatelessWidget {
  final String text;

  const PromotionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getBoldTextStyle(
            fontSize: FontSize.s40, color: Colors.white),
      );
    } catch (e) {
      return const Text("");
    }
  }
}
class PromotionBody extends StatelessWidget {
  final String text;

  const PromotionBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s18, color: Colors.white),
      );
    } catch (e) {
      return const Text("");
    }
  }
}

class AppTitle extends StatelessWidget {
  final String text;

  const AppTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getTitleSemiBoldStyle(
            fontSize: FontSize.s20, color: ColorManager.lightIconColor),
      );
    } catch (e) {
      return const Text("");
    }
  }
}
class CardText extends StatelessWidget {
  final String text;
  final Color color;

  const CardText({
    Key? key,
    required this.text, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: getRegularTextStyle(
            fontSize: FontSize.s12, color: color,line:false),
      );
    } catch (e) {
      return const Text("");
    }
  }


  
}

class SemiCardText extends StatelessWidget {
  final String text;
  final Color color;

  const SemiCardText({
    Key? key,
    required this.text, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: getRegularTextStyle(
            fontSize: 9, color: color,line:false),
      );
    } catch (e) {
      return const Text("");
    }
  }


  
}


class CardGrayText extends StatelessWidget {
  final String text;
  final bool line;

  const CardGrayText({
    Key? key,
    required this.text, required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getRegularTextStyle(
            fontSize: FontSize.s12, color: ColorManager.grayColor, line: line),
      );
    } catch (e) {
      return const Text("");
    }
  }


  
}


class TextButtonRegular extends StatelessWidget {
  final String text;

  const TextButtonRegular({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getRegularTextStyle(
            fontSize: FontSize.s16, color: ColorManager.primary,line:false),
      );
    } catch (e) {
      return const Text("");
    }
  }


  
}


class TextButtonSmall extends StatelessWidget {
  final String text;

  const TextButtonSmall({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Text(
        text,
        style: getBoldTextStyle(
            fontSize: FontSize.s14, color: ColorManager.primary),
      );
    } catch (e) {
      return const Text("");
    }
  }


  
}

