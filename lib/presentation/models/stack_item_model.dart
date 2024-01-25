

import 'package:ostello_task/core/utils/image_constants.dart';

class StackItemModel {
  StackItemModel({
    this.scholarshipsText,
    this.scholarshipsImage,
    this.id,
  }) {
    scholarshipsText = scholarshipsText ?? "Scholarships";
    scholarshipsImage = scholarshipsImage ?? ImageConstant.imgImage24;
    id = id ?? "";
  }

  String? scholarshipsText;

  String? scholarshipsImage;

  String? id;
}
