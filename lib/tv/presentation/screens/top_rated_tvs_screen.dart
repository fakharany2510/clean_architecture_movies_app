import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/tv/presentation/components/top_rated_tv_details_compnent.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';
import 'package:movies/tv/presentation/controller/tv_events.dart';

class TopRatedTvScreen extends StatelessWidget {
  const TopRatedTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    sl<TvBloc>()..add(GetTopRatedTvEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('TopRated Tvs',
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white
            ),
          ),
        ),
        body: const TopRatedTvDetailsComponent(),
      ),
    );
  }
}
