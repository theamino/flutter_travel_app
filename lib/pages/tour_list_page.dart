import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/model/tour.dart';
import 'package:flutter_app_ex1/utils/assets_constants.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:flutter_app_ex1/utils/textStyles.dart';


class TourListPage extends StatelessWidget {
  TourListPage({Key? key}) : super(key: key);

  int _selectedIndex = 0;

  final List<Tour> tours = [
    Tour(name: 'La Celva', location: 'Peru, South America',
      tourInfo: <String, String>{'Distance' : '7Km', 'Temp' : '28° C', 'Rating' : '4.8'},
      description: 'Anyone who has taken a group tour knows just how important the guide is '
          'to the success or failure of the trip.  A good guide can elevate and enhance the experience,'
          ' creating cherished memories that will last a lifetime and make guests want to return.'
          '  A bad guide can do the opposite,  leaving guests feeling neglected and unimportant.\n\nWhat are the qualities of a good guide?  Based on my own experience, both as a guest on several tours and as a guide for over 20 years who has taken hundreds of guests around Italy, I’ve put together a list of the must-have traits of a good guide.'
      ,
      totalPrice: '1270\$', images: [image.lacelva2, image.lacelva3, image.lacelva4, image.lacelva5]),
  Tour(name: 'La Costa', location: 'Peru, South America',
      tourInfo: <String, String>{'Distance' : '7Km', 'Temp' : '28° C', 'Rating' : '4.8'},
      description: 'Anyone who has taken a group tour knows just how important the guide is '
          'to the success or failure of the trip.  A good guide can elevate and enhance the experience,'
          ' creating cherished memories that will last a lifetime and make guests want to return.'
          '  A bad guide can do the opposite,  leaving guests feeling neglected and unimportant.\n\nWhat are the qualities of a good guide?  Based on my own experience, both as a guest on several tours and as a guide for over 20 years who has taken hundreds of guests around Italy, I’ve put together a list of the must-have traits of a good guide.'
      ,
      totalPrice: '1270\$', images: [image.lacelva3, image.lacelva4, image.lacelva5]),
  Tour(name: 'Rio De Janero', location: 'Brazil, South America',
      tourInfo: <String, String>{'Distance' : '7Km', 'Temp' : '28° C', 'Rating' : '4.8'},
      description: 'Anyone who has taken a group tour knows just how important the guide is '
          'to the success or failure of the trip.  A good guide can elevate and enhance the experience,'
          ' creating cherished memories that will last a lifetime and make guests want to return.'
          '  A bad guide can do the opposite,  leaving guests feeling neglected and unimportant.\n\nWhat are the qualities of a good guide?  Based on my own experience, both as a guest on several tours and as a guide for over 20 years who has taken hundreds of guests around Italy, I’ve put together a list of the must-have traits of a good guide.'
      ,
      totalPrice: '1270\$', images: [image.lacelva4, image.lacelva5]),
  Tour(name: 'Anja', location: 'Argentina, South America',
      tourInfo: <String, String>{'Distance' : '7Km', 'Temp' : '28° C', 'Rating' : '4.8'},
      description: 'Anyone who has taken a group tour knows just how important the guide is '
          'to the success or failure of the trip.  A good guide can elevate and enhance the experience,'
          ' creating cherished memories that will last a lifetime and make guests want to return.'
          '  A bad guide can do the opposite,  leaving guests feeling neglected and unimportant.\n\nWhat are the qualities of a good guide?  Based on my own experience, both as a guest on several tours and as a guide for over 20 years who has taken hundreds of guests around Italy, I’ve put together a list of the must-have traits of a good guide.'
      ,
      totalPrice: '1270\$', images: [image.lacelva5]),
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 41,),
          // title and actions
          Row(
            children: [
              const SizedBox(width: 20,),
              const Text(discover, style: w900s24b,),
              Expanded(child: Container()),
              const CircleAvatar(backgroundColor: Color.fromARGB(255, 0xf2, 0xf2, 0xf2),child: Icon(Icons.search, color: Colors.black,),),
              const SizedBox(width: 6,),
              const CircleAvatar(backgroundColor: Color.fromARGB(255, 0xf2, 0xf2, 0xf2), child: Icon(CupertinoIcons.bell, color: Colors.black,),),
              const SizedBox(width: 21,)
            ],
          ),

          //margin
          const SizedBox(height: 38.5,),

          // different types of tours
          SizedBox(
            width: size.width,
            height: 40,
            child: ListView.builder(itemBuilder: (context, index) =>
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Opacity(
                        opacity: _selectedIndex == index ? 1 : 0.5,
                        child: Opacity(
                          opacity: _selectedIndex == index ? 1 : 0,
                          child: Container(
                            height: 2,
                            width: 28.58,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(1000)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.5,),
                      Text(groups[index], style: w600s15b,)
                    ],
                  ),
                )
              , itemCount: groups.length, scrollDirection: Axis.horizontal,),
          ),

          //margin
          const SizedBox(height: 26,),

          // tour list
          SizedBox(
            height: 350,
            width: size.width,
            child: ListView.builder(itemCount: tours.length ,itemBuilder: (context, index) =>
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(routeTour, arguments: tours[index]),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(child: Image.asset(tours[index].images[0], fit: BoxFit.cover,),
                      borderRadius: BorderRadius.circular(32),),
                      Container(
                        width: 194,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        margin: const EdgeInsets.only(bottom: 18),
                        padding: const EdgeInsets.only(left: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 7,),
                            Text(tours[index].name, style: w500s11b,),
                            const SizedBox(height: 3,),
                            Opacity( opacity: 0.5,
                                child: Text(tours[index].location, style: w500s11b,))
                          ],
                        ),),
                      Container(
                        width: 41,
                        height: 20,
                        margin: const EdgeInsets.only(bottom: 60, left: 51),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 9,),
                            Text(tours[index].tourInfo['Rating'] ?? '?' , style: w600s10b,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            scrollDirection: Axis.horizontal,),
          ),
          const SizedBox(height: 45,),
          Row(
            children: [
              const SizedBox(width: 20,),
              const Text(topDestinations, style: w600s19b,),
              Expanded(child: Container()),
              const CircleAvatar(backgroundColor: Color.fromARGB(255, 0xf2, 0xf2, 0xf2),child: Icon(Icons.more_horiz, color: Colors.black,),),
              const SizedBox(width: 21,),
            ],
          ),
          SizedBox(
            width: size.width,
            height: 78,
            child: ListView.builder(
              itemCount: tours.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 200,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 0xf2, 0xf2, 0xf2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 0xf2, 0xf2, 0xf2),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(tours[index].images[0] , fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tours[index].name, style: w600s12b,),
                        Opacity( opacity: 0.5,
                          child: Text(tours[index].location.substring(
                              tours[index].location.indexOf(',') + 1), style: w600s12b,),
                        )

                      ],
                    )
                  ],
                ),
              ),),
          )
          /**/
        ],
      ),
    );
  }
}
