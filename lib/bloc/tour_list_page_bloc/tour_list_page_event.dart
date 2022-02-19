import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex1/model/tour.dart';

abstract class TourListPageEvent {}

class TourClicked extends TourListPageEvent {
  final Tour tour;
  final BuildContext context;

  TourClicked({required this.context, required this.tour});
}

