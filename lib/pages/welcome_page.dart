import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

import '../models/welcome_model.dart';
import '../nav_pages.dart/main_wrapper.dart';
import '../widget/reuseable_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: welcomeComponents.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              WelcomeModel current = welcomeComponents[index];
              return SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.4,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            top: size.height * 0.04,
                            right: size.width * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInRight(
                                  child: AppText(
                                    text: current.title,
                                    size: 50,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                FadeInLeft(
                                  child: AppText(
                                    text: current.subTitle,
                                    size: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 400),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: SizedBox(
                                      width: size.width * 0.8,
                                      child: AppText(
                                        text: current.description,
                                        size: 15,
                                        color: Color.fromARGB(255, 129, 129, 129),
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                                FadeInUpBig(
                                  duration: const Duration(milliseconds: 900),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      minWidth: size.width * 0.3,
                                      height: size.height * 0.055,
                                      color: Color.fromARGB(255, 0, 67, 252),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const MainWrapper()),
                                        );
                                      },
                                      child: const AppText(
                                        text: "Let's Go",
                                        size: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                3,
                                (indexDots) => GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(
                                      indexDots,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        right: size.width * 0.01,
                                        bottom: size.height * 0.008),
                                    width: 15,
                                    height: index == indexDots ? 65 : 15,
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? Color.fromARGB(255, 1, 18, 255)
                                          : Color.fromARGB(255, 0, 162, 255),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    /// Bottom Images
                    FadeInUpBig(
                      duration: const Duration(milliseconds: 1200),
                      child: ShapeOfView(
                        width: size.width,
                        elevation: 4,
                        height: size.height * 0.55,
                        shape: DiagonalShape(
                          position: DiagonalPosition.Top,
                          direction: DiagonalDirection.Right,
                          angle: DiagonalAngle.deg(angle: 8),
                        ),
                        child: Image(
                          image: AssetImage(
                            current.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
