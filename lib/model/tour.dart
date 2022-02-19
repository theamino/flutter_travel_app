class Tour {


  final String name;
  final String location;
  final Map<String, String> tourInfo;
  final String description;
  final String totalPrice;
  final List<String> images;

   Tour({required this.name, required this.location, required this.tourInfo, required this.description,
    required this.totalPrice, required this.images});
}