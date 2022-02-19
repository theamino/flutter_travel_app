



import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex1/bloc/tour_list_page_bloc/tour_list_page_event.dart';
import 'package:flutter_app_ex1/bloc/tour_list_page_bloc/tour_list_page_state.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_event.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_state.dart';
import 'package:flutter_app_ex1/model/tour.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourListPageBloc extends Bloc<TourListPageEvent, TourListPageState> {


  TourListPageBloc({required List<Tour> tourList}) : super(InitialState(tourList: tourList)) {
    on<TourClicked>((event, emit) => Navigator.of(event.context).pushNamed(routeTour, arguments: event.tour));
  }
}