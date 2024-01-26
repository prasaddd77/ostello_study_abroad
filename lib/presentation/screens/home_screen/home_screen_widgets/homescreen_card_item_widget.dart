
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/core/utils/app_decorations.dart';
import 'package:ostello_task/core/constants/image_constants.dart';
import 'package:ostello_task/core/utils/theme_helper.dart';
import 'package:ostello_task/presentation/common_widgets/custom_icon_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_image_view.dart';
import 'package:ostello_task/presentation/models/home_screen_models/homescren_card_item_model.dart';
import 'package:ostello_task/presentation/screens/home_screen/home_screen_card_funtions/card_on_taps.dart';

class HomeScreenCardItemWidget extends StatelessWidget {
  int index = 0;
  HomeScreenCardItemModel homeScreenCardItemModelObj;

  HomeScreenCardItemWidget({
    required this.homeScreenCardItemModelObj,
    required this.index,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: const Color(0XFFF6EFFE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Container(
        height: 127,
        width: 311,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder15,
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
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  height: 72,
                  width: 87,
                  child: CustomImageView(imagePath: ImageConstant.ellipsis214)),
            ),
            CustomImageView(
              imagePath: homeScreenCardItemModelObj.image,
              height: 123,
              width: 128,
              alignment: Alignment.centerLeft,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeScreenCardItemModelObj.exploreText!,
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          width: 147,
                          child: Text(
                            homeScreenCardItemModelObj.descriptionText!,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall!.copyWith(
                              height: 1.37,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 105,
                    width: 135,
                    margin: const EdgeInsets.only(left: 4),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        CustomImageView(
                          imagePath:
                              homeScreenCardItemModelObj.exploreImage,
                          height: homeScreenCardItemModelObj.height,
                          width: homeScreenCardItemModelObj.width,
                          alignment: Alignment.topLeft,
                        ),
                        CustomIconButton(
                          onTap: () {
                            OnTapFunctions().onTaps[index](context);
                          },
                          height: 28,
                          width: 28,
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.bottomRight,
                          child: CustomImageView(
                            imagePath: ImageConstant.arrowRight,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
