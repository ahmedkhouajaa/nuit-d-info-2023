import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:planet/login_screen.dart';
import 'package:planet/switchscree.dart';

import 'Roles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Let's Save Our Earth ",
          body:
              "Protecting the environment is important for our future. We need to reduce waste, conserve resources, and use renewable energy to be environmentally friendly.",
          image: _buildImage('photo1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: '',
          body:
              "Climate change is a pressing issue caused by greenhouse gases in the atmosphere. We can reduce our carbon footprint to help mitigate its effects.",
          image: _buildImage('photo2.png'),
          decoration: pageDecoration,
        ),
        
        PageViewModel(
          
          title: "",
          body:
              " Let's go ",
          image: Container(
            padding:  EdgeInsets.only(top: 40.0),
            child: _buildImage('photo3.png'),
            
          ),
          
          footer   : Padding(
            padding: const EdgeInsets.only(top:30,left: 15.0, right: 15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => RoleSelectionScreen())));
                print("Clicked Get Started Button");
              },
              child: const Text(
                'GET STARTED',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55), // NEW
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Text('Back',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      next: const Text('Next',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 5.0),
        activeColor: Colors.black,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
