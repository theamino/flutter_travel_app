import 'package:flutter/material.dart';


class TourInfoItem extends StatelessWidget {
  const TourInfoItem({Key? key, required this.title, required this.info}) : super(key: key);

  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 0.5, color: Colors.grey)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.subtitle1,) ,
          const SizedBox(height: 10,),
          Text(info, style: Theme.of(context).textTheme.subtitle2,)
        ],
      ),
    );
  }
}
