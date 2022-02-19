import 'package:flutter_app_ex1/model/tour.dart';

abstract class TourListPageState {}

class InitialState extends TourListPageState {
  final List<Tour> tourList;

  InitialState({required this.tourList});
}