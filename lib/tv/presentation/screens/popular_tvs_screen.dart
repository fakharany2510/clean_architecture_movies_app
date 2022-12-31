import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/tv/presentation/components/popuar_tv_details_component.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';
import 'package:movies/tv/presentation/controller/tv_events.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    sl<TvBloc>()..add(GetPopularTvEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Popular Tvs',
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white
            ),
          ),
        ),
        body: PopularTvDetailsComponent(),
      ),
    );
  }
}
