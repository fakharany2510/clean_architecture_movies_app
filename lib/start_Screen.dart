import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';
import 'package:movies/tv/presentation/screens/tv_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(

              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainMoviesScreen()));
              },
              child: Container(
                width: 159,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('Movies',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TvScreen()));
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('Tv',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
