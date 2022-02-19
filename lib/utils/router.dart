
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex1/model/tour.dart';
import 'package:flutter_app_ex1/pages/splash_screen.dart';
import 'package:flutter_app_ex1/pages/tour_list_page.dart';
import 'package:flutter_app_ex1/pages/tour_page.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {

  static const _pageTransitionFadeDuration = Duration(milliseconds: 1000);

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeTour:
        return PageTransition(child: TourPage(tour: routeSettings.arguments as Tour,)
            , type: PageTransitionType.fade, duration: _pageTransitionFadeDuration);
      case routeSplash:
        return PageTransition(child: const SplashScreen(), type: PageTransitionType.fade, duration: _pageTransitionFadeDuration);
      case routeTourList:
        return PageTransition(child: TourListPage(), type: PageTransitionType.fade, duration: _pageTransitionFadeDuration);
      default:
        return null;
    }
  }

    }