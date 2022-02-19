import 'package:flutter/cupertino.dart';

abstract class SplashScreenEvent {}

class DraggableItemAccepted extends SplashScreenEvent {
  final BuildContext buildContext;

  DraggableItemAccepted({required this.buildContext});
}