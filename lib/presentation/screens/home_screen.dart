import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostello_task/core/utils/app_decorations.dart';
import 'package:ostello_task/core/utils/image_constants.dart';
import 'package:ostello_task/core/utils/theme_helper.dart';
import 'package:ostello_task/presentation/common_widgets/custom_image_view.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/presentation/models/explore_universities_item_model.dart';
import 'package:ostello_task/presentation/models/stack_item_model.dart';
import 'package:ostello_task/presentation/screens/home_screen/widgets/explore_universities_item_widget.dart';
import 'package:ostello_task/presentation/screens/home_screen/widgets/stack_item_widget.dart';
import 'package:ostello_task/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/img_iconsax_linear_location.svg',
                              width: 19,
                              height: 19,
                              clipBehavior: Clip.antiAlias,
                              color: const Color(0xFF161B1F),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              'Gandhinagar',
                              style: TextStyle(
                                color: Color(0xFF161B1F),
                                fontSize: 14,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/images/dropdown.svg",
                                width: 5,
                                height: 9,
                                color: const Color(0xFF161B1F),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Near SKM College, Gandhinagar, Ahmedabad',
                          style: TextStyle(
                            color: Color(0xFF161B1F),
                            fontSize: 12,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 20,
                        child: SvgPicture.asset(
                          "assets/images/profile.svg",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 0,
              //     margin: EdgeInsets.only(top: 14),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(9)),
              //     child: Container(
              //       height: 212,
              //       width: double.maxFinite,
              //       decoration:
              //           AppDecoration.gradientDeepPurpleAToPurple.copyWith(
              //         borderRadius: BorderRadius.circular(9),
              //       ),
              //       child: Stack(
              //         alignment: Alignment.centerLeft,
              //         children: [
              //           // ShaderMask(
              //           //   shaderCallback: (Rect bounds) {
              //           //     return const LinearGradient(colors: [
              //           //       Color(0XFF7D24E0),
              //           //       Color(0XFF20136E),
              //           //       Color(0XFF8D2292),
              //           //     ]).createShader(bounds);
              //           //   },
              //           //   child: Container(
              //           //     decoration: BoxDecoration(
              //           //       borderRadius: BorderRadius.circular(9),
              //           //     ),
              //           //   ),
              //           // ),
              //           // CustomImageView(
              //           //   imagePath: "assets/images/img_image_15.png",
              //           //   height: 211,
              //           //   width: 360,
              //           //   alignment: Alignment.center,
              //           // ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 10.0, top: 54),
              //             child: Column(
              //               children: [
              //                 const Text(
              //                   'Discover Your Ideal Program',
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 16,
              //                     fontFamily: 'Avenir',
              //                     fontWeight: FontWeight.w800,
              //                     height: 0,
              //                   ),
              //                 ),
              //                 const SizedBox(
              //                   height: 7,
              //                 ),
              //                 const Text(
              //                   'Join the ideal program that matches\n your goals in your dream location.',
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontFamily: 'Avenir',
              //                     fontWeight: FontWeight.w400,
              //                     //height: 0.10,
              //                     //letterSpacing: 0.12,
              //                   ),
              //                 ),
              //                 const SizedBox(
              //                   height: 15,
              //                 ),
              //                 ElevatedButton(
              //                   style: ElevatedButton.styleFrom(
              //                     fixedSize: Size(170, 28),
              //                     backgroundColor: Colors.white,
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(14),
              //                     ),
              //                   ),
              //                   onPressed: () {},
              //                   child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceEvenly,
              //                       children: [
              //                         Container(
              //                           //margin: const EdgeInsets.only(right: 3),
              //                           child: CustomImageView(
              //                               imagePath:
              //                                   "assets/images/img_image_27.png",
              //                               width: 22,
              //                               height: 22),
              //                         ),
              //                         const Text(
              //                           'Start Your Journey',
              //                           style: TextStyle(
              //                             color: Color(0xFF161B1F),
              //                             fontSize: 11.11,
              //                             fontFamily: 'Avenir',
              //                             fontWeight: FontWeight.w400,
              //                             height: 0.11,
              //                             letterSpacing: 0.01,
              //                           ),
              //                         )
              //                       ]),
              //                 )
              //               ],
              //             ),
              //           ),
              //           CustomImageView(
              //             imagePath: "assets/images/img_group_1410101637.png",
              //             height: 255,
              //             width: 144,
              //             alignment: Alignment.centerRight,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              CustomImageView(
                imagePath: ImageConstant.start,
                radius: const BorderRadius.all(Radius.circular(15)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 33,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const BoxShadow(
                              color: Color(0XFFF6EFFE),
                              spreadRadius: -1,
                              blurRadius: 1.0,
                            ),
                          ],
                        ).copyWith(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgImage20,
                          height: 17,
                          width: 89,
                          alignment: Alignment.center,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 33,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          //color: Color(0XFFF6EFFE),
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const BoxShadow(
                              color: Color(0XFFF6EFFE),
                              spreadRadius: -1,
                              blurRadius: 1.0,
                            ),
                          ],
                        ).copyWith(borderRadius: BorderRadius.circular(6)),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgImage18,
                          height: 17,
                          width: 46,
                          alignment: Alignment.center,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 33,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          //color: Color(0XFFF6EFFE),
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const BoxShadow(
                              color: Color(0XFFF6EFFE),
                              spreadRadius: -1,
                              blurRadius: 1.0,
                            ),
                          ],
                        ).copyWith(borderRadius: BorderRadius.circular(6)),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgImage23,
                          height: 17,
                          width: 58,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 33,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          //color: Color(0XFFF6EFFE),
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const BoxShadow(
                              color: Color(0XFFF6EFFE),
                              spreadRadius: -1,
                              blurRadius: 1.0,
                            ),
                          ],
                        ).copyWith(borderRadius: BorderRadius.circular(6)),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgImage22,
                          height: 17,
                          width: 72,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Navigating your global classroom',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF151A1F),
                  fontSize: 18,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.02,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: CustomRow(),
              ),
              // CustomImageView(
              //   imagePath: ImageConstant.imgGroup1000003556,
              //   height: 13,
              //   width: 350,
              //   color: Colors.black,
              // ),
              const SizedBox(
                height: 25,
              ),
              _buildExploreUniversities(context),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'What Makes Us Shine?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF151A1F),
                  fontSize: 18,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.02,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              _buildStack(context),
              const SizedBox(height: 24),
              _buildOstelloTheUltimate(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreUniversities(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return const SizedBox(height: 28);
            },
            itemCount: provider.homePageModelObj.exploreuniversitiesItemList.length,
            itemBuilder: (context, index) {
              ExploreuniversitiesItemModel model = provider.homePageModelObj.exploreuniversitiesItemList[index];
              return ExploreuniversitiesItemWidget(model);
            },
          );
        },
      ),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 126,
        child: Consumer<HomePageProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return const SizedBox(
                  width: 22,
                );
              },
              itemCount: provider.homePageModelObj.stackItemList.length,
              itemBuilder: (context, index) {
                StackItemModel model =
                    provider.homePageModelObj.stackItemList[index];
                return StackItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildOstelloTheUltimate(BuildContext context) {
    return SizedBox(
      height: 225,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.fillGray10001,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: 197,
                    margin: const EdgeInsets.only(left: 19),
                    child: Text(
                      "Ostello, the ultimate companion for every student.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        height: 1.10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Row(
                      children: [
                        Container(
                          height: 26,
                          width: 150,
                          margin: const EdgeInsets.only(
                            top: 1,
                            bottom: 2,
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgSettings,
                                height: 25,
                                width: 16,
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.only(right: 54),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: OverflowBox(
                                  maxWidth: double.infinity,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Made with ",
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                            height: 1.10,
                                            color: appTheme.deepPurpleA40001,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '❤️',
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                            height: 1.10,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " in India ",
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                            height: 1.10,
                                            color: appTheme.deepPurpleA40001,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '🇮🇳',
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                            height: 1.10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgSettings,
                          height: 30,
                          width: 19,
                          margin: const EdgeInsets.only(left: 5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 11),
                  Container(
                    width: double.infinity,
                    height: 35,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 155,
                      vertical: 2,
                    ),
                    decoration: AppDecoration.fillBlue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          "version 2.0",
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.gray500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgSaly43,
            height: 181,
            width: 164,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 15),
          ),
        ],
      ),
    );
  }
}
