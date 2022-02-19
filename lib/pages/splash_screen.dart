import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:flutter_app_ex1/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:flutter_app_ex1/utils/assets_constants.dart';
import 'package:flutter_app_ex1/utils/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    Widget goButton = SizedBox(width: 75, height: 75
        , child: CircleAvatar(child: Text(go, style: Theme
            .of(context)
            .textTheme
            .bodyText2,)
          , backgroundColor: Colors.white,));

    SplashScreenBloc _bloc = SplashScreenBloc();

    return Scaffold(

      body: SizedBox(
        width: size.width,
        height: size.height,

        child: Stack(
          children: [
            //background image
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(image.splash, fit: BoxFit.cover,),
            ),

            //column for texts
            Column(
              children: [
                //margin top
                const SizedBox(height: 148,),

                //title
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(splash_title, style: Theme
                      .of(context)
                      .textTheme
                      .headline1, textAlign: TextAlign.center,),
                ),

                //margin
                const SizedBox(height: 6,),

                //subtitle
                Text(splash_subtitle, style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1, textAlign: TextAlign.center,),

                //fill white space
                Expanded(child: Container()),

                // application main page start button and graphics
                Container(
                  padding: const EdgeInsets.only(bottom: 3
                  ),
                  height: 180,
                  width: 84,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.white10,
                        Colors.white70,
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(1000)
                  ),
                  child: Column(
                    children: [
                      DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return Container(color: Colors.transparent,
                            height: 25,
                            width: 10,);
                        },
                      ),
                      const SizedBox(height: 20,),
                      const RotatedBox(quarterTurns: 3,
                        child: Icon(
                          Icons.double_arrow, color: Colors.white, size: 50,),),
                      Expanded(child: Container()),
                      BlocBuilder(builder: (context, state) =>
                          Draggable(
                            data: 'do',
                            axis: Axis.vertical,
                            childWhenDragging: Container(),
                            feedback: goButton,
                            child: goButton,
                            onDragEnd: (details) {
                              if (details.offset.dy < 580) {
                                _bloc.add(DraggableItemAccepted(
                                    buildContext: context));
                              }
                            },
                          ), bloc: _bloc,),
                    ],
                  ),
                ),
                const SizedBox(height: 85,),


              ],
            )
          ],
        ),
      ),
    );
  }
}
