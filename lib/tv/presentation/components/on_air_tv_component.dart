import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';
import 'package:movies/tv/presentation/controller/tv_states.dart';

class OnAirTvComponent extends StatelessWidget {
  const OnAirTvComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc,TvStates>(
    buildWhen: (previous , current)=> previous.onAirTvStates != current.onAirTvStates,
      builder: (context , state){
       switch(state.onAirTvStates) {
         case RequestState.loading:
           return const SizedBox(
             height: 400,
             child: Center(
               child: CircularProgressIndicator(),
             ),
           );
         case RequestState.loaded:
           return FadeIn(
             duration: const Duration(milliseconds: 500),
             child: CarouselSlider(
               options: CarouselOptions(
                 height: 400.0,
                 viewportFraction: 1.0,
                 onPageChanged: (index, reason) {},
               ),
               items: state.onAirTv.map(
                     (item) {
                   return GestureDetector(
                     key: const Key('openMovieMinimalDetail'),
                     onTap: () {

                     },
                     child: Stack(
                       children: [
                         ShaderMask(
                           shaderCallback: (rect) {
                             return const LinearGradient(
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                                 // fromLTRB
                                 Colors.transparent,
                                 Colors.black,
                                 Colors.black,
                                 Colors.transparent,
                               ],
                               stops: [0, 0.3, 0.5, 1],
                             ).createShader(
                               Rect.fromLTRB(0, 0, rect.width, rect.height),
                             );
                           },
                           blendMode: BlendMode.dstIn,
                           child: CachedNetworkImage(
                             height: 560.0,
                             imageUrl: item.backdropPath != null
                                 ?ApiConstance.imageUrl(item.backdropPath!)
                                 :'https://previews.123rf.com/images/lobo71/lobo711804/lobo71180400088/100042388-no-movie-camera-reflective-sign.jpg'
                                 ,
                             fit: BoxFit.cover,
                           ),
                         ),
                         Align(
                           alignment: Alignment.bottomCenter,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Icon(
                                       Icons.circle,
                                       color: Colors.redAccent,
                                       size: 16.0,
                                     ),
                                     const SizedBox(width: 4.0),
                                     Text(
                                       'on the air'.toUpperCase(),
                                       style: const TextStyle(
                                           fontSize: 16.0,
                                           color: Colors.white
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Text(
                                   item.name,
                                   textAlign: TextAlign.center,
                                   style: const TextStyle(
                                       fontSize: 24,
                                       color: Colors.white
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               ).toList(),
             ),
           );
         case RequestState.error:
           return SizedBox(
             height: 400,
             child: Text('${state.onAirTv}',
               style: const TextStyle(
                   color: Colors.white
               ),
             ),
           );
       }
      },
    );
  }
}
