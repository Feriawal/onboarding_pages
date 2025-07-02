import 'package:flutter/material.dart';
import 'package:onboardingpage2/pages/homepage.dart';
import 'package:onboardingpage2/widgets/containerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static const routeName = '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

//last page
//color
Color blue = Color.fromRGBO(30, 46, 166, 1);
Color pink = Color.fromRGBO(249, 61, 133, 1);

class _OnboardingPageState extends State<OnboardingPage> {
  bool isLastPage = false;

  // controller
  final PageController control = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    control.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: control,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 3);
            });
          },
          children: [
            //page 1
            containerPage(
              "Lorem Ipsum is not",
              "assets/images/1.png",
              "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took  ",
            ),

            //page 2
            containerPage(
              "The standard chunk",
              "assets/images/2.png",
              "make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            ),

            //page 3
            containerPage(
              "from a Lorem Ipsum",
              "assets/images/3.png",
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum ",
            ),

            //page 4
            containerPage(
              "1914 translation",
              "assets/images/4.png",
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,. ",
            ),
          ],
        ),
      ),
      bottomSheet:
          isLastPage
              ? Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Homepage.routeName);
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: pink,

                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
              : BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //skip button
                    TextButton(
                      onPressed: () {
                        control.jumpToPage(3);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),

                    // indicator
                    SmoothPageIndicator(
                      controller: control,
                      count: 4,
                      effect: WormEffect(dotColor: blue, activeDotColor: pink),
                      onDotClicked: (index) {
                        control.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),

                    // next button
                    TextButton(
                      onPressed: () {
                        control.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
