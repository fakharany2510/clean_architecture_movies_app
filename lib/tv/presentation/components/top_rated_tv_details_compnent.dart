import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';
import 'package:movies/tv/presentation/controller/tv_states.dart';

class TopRatedTvDetailsComponent extends StatelessWidget {
  const TopRatedTvDetailsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvStates>(builder: (context, state) {
      switch(state.topRatedTvStates){
        case RequestState.loading:
          return const Center(child: CupertinoActivityIndicator(),);
        case RequestState.loaded:
          return ListView.separated(
            itemCount: state.topRatedTv.length,
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemBuilder: (context, index) {
              List dateOfRelease = state.topRatedTv[index].firstAirDate.split('-');
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .18,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: state.topRatedTv[index].backdropPath != null
                                ? ApiConstance.imageUrl(
                                state.topRatedTv[index].backdropPath!)
                                : 'https://previews.123rf.com/images/lobo71/lobo711804/lobo71180400088/100042388-no-movie-camera-reflective-sign.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*.6,
                              child: Text(
                                state.topRatedTv[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.red.shade900,
                                  ),
                                  child: Center(
                                    child: Text(
                                      dateOfRelease[0],
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          letterSpacing: 0.15,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${state.topRatedTv[index].voteAverage}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      letterSpacing: 0.15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.6,
                              child: Text(
                                state.topRatedTv[index].overView,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Colors.white,
                                ),
                              ),

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        case RequestState.error:
          return Center(child: Text(state.popularMessage));
      }
    });
  }
}
