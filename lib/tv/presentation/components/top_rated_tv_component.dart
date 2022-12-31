import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/utls/dummy.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';
import 'package:movies/tv/presentation/controller/tv_states.dart';
import 'package:shimmer/shimmer.dart';

class GetTopRatedTvComponent extends StatelessWidget {
  const GetTopRatedTvComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TvBloc, TvStates>(
       buildWhen: (previous , current)=>previous.onAirTvStates != current.onAirTvStates,
        builder: (context , state){
          switch(state.topRatedTvStates){
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
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.topRatedTv.length,
                    itemBuilder: (context, index) {
                      // final movie = moviesList[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            /// TODO : NAVIGATE TO  MOVIE DETAILS
                          },
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl:state.topRatedTv[index].backdropPath !=null
                                  ? ApiConstance.imageUrl(state.topRatedTv[index].backdropPath!)
                                  :'https://previews.123rf.com/images/lobo71/lobo711804/lobo71180400088/100042388-no-movie-camera-reflective-sign.jpg',

                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Text('${state.topRatedMessage}',
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),
              );
          }
        }
    );
  }
}
