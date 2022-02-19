import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_bloc.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_event.dart';
import 'package:flutter_app_ex1/bloc/tour_page_bloc/tour_page_state.dart';
import 'package:flutter_app_ex1/components/tour_info_item.dart';
import 'package:flutter_app_ex1/model/tour.dart';
import 'package:flutter_app_ex1/utils/assets_constants.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:flutter_app_ex1/utils/textStyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';






class TourPage extends StatelessWidget {
  TourPage({Key? key, required this.tour}) : super(key: key);

  final Tour tour;

  final EdgeInsets paddingNotSelected = const EdgeInsets.only(bottom: 16, right: 11.5, left: 11.5);
  final EdgeInsets paddingSelected = const EdgeInsets.only(bottom: 16);

  static const double height_not_selected = 75;
  static const double height_selected = 98;

  final GlobalKey _textKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    const mainImageRadius = Radius.circular(80);

    TourPageBloc _tourPageBloc = TourPageBloc();

    return Scaffold(

        body: BlocBuilder<TourPageBloc, TourPageState>(
          bloc: _tourPageBloc,
          builder: (context, state) {

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [

                      // main image on page

                      Container(
                        width: size.width,
                        height: 420,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: mainImageRadius,
                                bottomRight: mainImageRadius)
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: FadeInImage(placeholder: MemoryImage(kTransparentImage), image:
                          AssetImage(tour.images[state.selected_image]), fit: BoxFit.cover
                          ),
                      ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 40,),
                          // actions
                          Row(
                            children: [
                              const SizedBox(width: 25,),
                              InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: const CircleAvatar(

                                  radius: 22.5,
                                  backgroundColor: Colors.white54,
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              const CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.white54,
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 24,)
                            ],
                          ),

                          //listview of images
                          Padding(
                            padding: const EdgeInsets.only(right: 25.0, top: 16),
                            child: SizedBox(
                              width: 98,
                              height: 361,
                              child: ListView.builder(
                                itemCount: tour.images.length ,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    Container(
                                      padding: state.selected_image == index ? paddingSelected : paddingNotSelected,
                                      child: GestureDetector(
                                        onTap: () => _tourPageBloc.add(selectedImageChange(newImageIndex: index)),

                                        child: Container(
                                          height: state.selected_image == index ? height_selected : height_not_selected,

                                          decoration: BoxDecoration(
                                              boxShadow:  [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.8),
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),)
                                              ],
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              color: Colors.white,
                                              border: Border.all(color: Colors.white, width: 4)
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: ClipRRect(

                                              borderRadius: BorderRadius.circular(24),
                                              child: Image.asset(
                                                tour.images[index], fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),),
                            ),
                          )
                        ],
                      ),

                      //tour name and location
                      Padding(
                        padding: const EdgeInsets.only(top: 311.7, left: 49.4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tour.name, style: w500s26w,),
                            Row(
                              children: [
                                const Icon(CupertinoIcons.location_solid, color: Colors.white, size: 12,),
                                const SizedBox(width: 10,),
                                Text(tour.location, style: w500s13w,)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  //margin
                  const SizedBox(height: 15,),

                  //tour info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: tour.tourInfo.entries.map((e) =>
                        TourInfoItem(title: e.key, info: e.value)).toList(),
                  ),

                  // description title
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 19),
                    child: Text(description, style: Theme
                        .of(context)
                        .textTheme
                        .headline2),
                  ),

                  //description
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 7, right: 43),
                    child: RichText(
                      textAlign: TextAlign.left,
                      key: _textKey,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: state.readMoreOpen ? tour.description : '${tour.description.substring(0, 200)}...',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline3,
                            ),
                            const TextSpan(text: '  '),
                            TextSpan(
                                text: state.readMoreOpen ? readLess : readMore,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  print(!state.readMoreOpen);
                                    _tourPageBloc.add(readMoreChange(newReadMoreState: !state.readMoreOpen));
                                  }
                            )
                          ]
                      ),
                    ),
                  ),

                  //margin
                  const SizedBox(height: 38,),

                  // prince and submit action
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 38, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Opacity(
                                opacity: 0.5,
                                child: Text(totalPrice, style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline5)
                            ),
                            const SizedBox(height: 2,),
                            Text(tour.totalPrice, style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)
                          ],
                        ),
                        const CircleAvatar(child: Icon(
                          Icons.chevron_right_outlined, size: 43,
                          color: Colors.white,)
                          , radius: 43, backgroundColor: Colors.black,)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }
}
