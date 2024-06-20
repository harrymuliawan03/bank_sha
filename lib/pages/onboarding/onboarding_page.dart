import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/text_button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> title = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];
  List<String> subTitle = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: currentIndex == 2 ? 22 : defaultMargin,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    title[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subTitle[currentIndex],
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  if (currentIndex == 2)
                    GetStarted(
                      onSignIn: () {
                        context.goNamed(RouteNames.signIn);
                      },
                      onGetStarted: () {
                        context.goNamed(RouteNames.signUp);
                      },
                    )
                  else
                    Row(
                      children: [
                        IndicatorCarousel(
                          isCurrentIndex: currentIndex == 0,
                          onPress: () {
                            setState(() {
                              carouselController.jumpToPage(0);
                              currentIndex = 0;
                            });
                          },
                        ),
                        IndicatorCarousel(
                          isCurrentIndex: currentIndex == 1,
                          onPress: () {
                            carouselController.jumpToPage(1);
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                        ),
                        IndicatorCarousel(
                          isCurrentIndex: currentIndex == 2,
                          onPress: () {
                            setState(() {
                              carouselController.jumpToPage(2);
                              currentIndex = 2;
                            });
                          },
                        ),
                        const Spacer(),
                        ButtonWidget(
                          onPress: () => carouselController.nextPage(),
                          title: 'Continue',
                          width: 150,
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorCarousel extends StatelessWidget {
  const IndicatorCarousel(
      {super.key, this.isCurrentIndex = false, this.onPress});

  final bool isCurrentIndex;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 12,
        width: 12,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCurrentIndex ? kBlueColor : kLightGreyColor,
        ),
      ),
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted(
      {super.key, required this.onSignIn, required this.onGetStarted});

  final void Function() onSignIn;
  final void Function() onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(onPress: onGetStarted, title: 'Get Started'),
        TextButtonWidget(title: 'Sign In', onPress: onSignIn)
      ],
    );
  }
}
