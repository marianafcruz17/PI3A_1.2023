import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/onboarding/components/size_config.dart';

class SplashContent extends StatelessWidget {
    const SplashContent({
        Key? key,
        this.text,
        this.sub_text,
        this.image,
    }) : super(key: key);

    final String? text, sub_text, image;

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Spacer(),
                Image.asset(
                    image!,
                    height: getProportionateScreenHeight(300),
                    width: getProportionateScreenWidth(235),
                ),
                Spacer(flex: 2),
                Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        color: Color.fromARGB(255, 0, 0, 0),
                    ),
                ),
                Spacer(flex: 3),
                Text(
                    sub_text!,
                    textAlign: TextAlign.center,
                )
            ],
        );
    }
}