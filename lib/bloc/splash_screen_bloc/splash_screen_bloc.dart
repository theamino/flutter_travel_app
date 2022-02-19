


import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ex1/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:flutter_app_ex1/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {

  SplashScreenBloc() : super(SplashScreenState()) {
    on<DraggableItemAccepted>((event, emit) => Navigator.of(event.buildContext).pushReplacementNamed(routeTourList));
  }
}