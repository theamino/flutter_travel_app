


import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_event.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TourPageBloc extends Bloc<TourPageEvent, TourPageState> {


  TourPageBloc()
      : super(TourPageState(selected_image: 0, readMoreOpen: false)) {
    on<readMoreChange>((event, emit) => emit(TourPageState(selected_image: state.selected_image
        , readMoreOpen: event.newReadMoreState)));
    on<selectedImageChange>((event, emit) => emit(TourPageState(selected_image: event.newImageIndex
        , readMoreOpen: state.readMoreOpen)));
  }
}