import 'package:flutter/material.dart';
import 'package:marmita_social/src/features/auth/presentation/view/page/home_page.dart';
import 'package:marmita_social/src/features/onboarding/components/default_button.dart.dart';
import 'package:marmita_social/src/features/onboarding/components/splash_content.dart';

class Body extends StatefulWidget {
    const Body({Key? key}) : super(key: key);

    @override
    _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
    int currentPage = 0;
    List<Map<String, String>> splashData = [
        {
            "text": ('text_ondoard.1'.i18n()),
            "sub_text":('sub_text.1'.i18n()),
            "image": "lib/assets/images/onboard1.png"
        },
        {
            "text": "Chatbot",
            "sub_text": ('sub_text.2'.i18n()),
            "image": "lib/assets/images/onboard2.png"
        },
        {
            "text": ('text_ondoard.3'.i18n()),
            "sub_text": ('sub_text.3'.i18n()),
            "image": "lib/assets/images/onboard3.png"
        }
    ];

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                    children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: PageView.builder(
                                onPageChanged: (value) {
                                    setState(() {
                                    currentPage = value;
                                    });
                                },
                                itemCount: splashData.length,
                                itemBuilder: (context, index) => SplashContent(
                                    text: splashData[index]['text'],
                                    sub_text: splashData[index]['text2'],
                                    image: splashData[index]["image"],
                                ),
                            ),
                        ),

                        Expanded(
                            flex: 1,
                            child: Column(children: <Widget>[
                                Spacer(),
                                if (currentPage == 2)
                                DefaultButton(
                                    text: 'onboars_button'.i18n(),
                                    press: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => HomePage()));
                                    },
                                ),
                                Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        splashData.length, (index) => buildDot(index: index)),
                                ),
                                Spacer(),
                            ]),
                        )
                    ],
                ),
            ),
        );
    }

    AnimatedContainer buildDot({int? index}) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.only(right: 7),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: currentPage == index
                    ? Color.fromARGB(225, 65, 62, 62)
                    : Color(0xFFD8D8D8),
                borderRadius: BorderRadius.circular(6),
            ),
        );
    }
}