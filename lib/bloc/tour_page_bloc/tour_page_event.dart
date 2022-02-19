abstract class TourPageEvent {}

class readMoreChange extends TourPageEvent {
  final bool newReadMoreState;

  readMoreChange({required this.newReadMoreState});
}

class selectedImageChange extends TourPageEvent {
  final int newImageIndex;

  selectedImageChange({required this.newImageIndex});
}