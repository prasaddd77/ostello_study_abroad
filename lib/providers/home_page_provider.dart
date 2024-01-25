import 'package:flutter/material.dart';
import 'package:ostello_task/presentation/models/home_page_model.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageModel homePageModelObj = HomePageModel();

  @override
  void dispose() {
    super.dispose();
  }

}
