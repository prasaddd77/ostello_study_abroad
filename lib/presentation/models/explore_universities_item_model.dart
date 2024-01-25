import 'package:ostello_task/core/utils/image_constants.dart';
class ExploreuniversitiesItemModel {
  ExploreuniversitiesItemModel(
      {this.image,
      this.exploreText,
      this.descriptionText,
      this.exploreImage,
      this.id,
      required this.height,
      required this.width}) {
    image = image ?? ImageConstant.imgEllipse215;
    exploreText = exploreText ?? "Explore Universities";
    descriptionText = descriptionText ??
        "Explore 2000+ foreign universities effortlessly with convenient filtering and sorting.";
    exploreImage = exploreImage ?? ImageConstant.imgImage13;
    id = id ?? "";
  }

  String? image;

  String? exploreText;

  String? descriptionText;

  String? exploreImage;

  String? id;

  double height;

  double width;
}
