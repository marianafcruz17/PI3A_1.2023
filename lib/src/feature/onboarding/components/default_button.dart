import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/onboarding/components/size_config.dart';

class DefaultButton extends StatelessWidget {
    const DefaultButton({
        Key? key,
        this.text,
        this.press,
    }) : super(key: key);

    final String? text;
    final Function? press;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: getProportionateScreenHeight(170),
            height: getProportionateScreenHeight(56),
            child: TextButton(
                style: TextButton.styleFrom(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: press as void Function()?,
                child: Text(
                    text!,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white,
                    ),
                ),
            ),
        );
    }
}