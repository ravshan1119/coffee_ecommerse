import 'package:coffee_ecommerse/cubits/coffee/coffees_cubit.dart';
import 'package:coffee_ecommerse/cubits/coffee_add/coffee_add_cubit.dart';
import 'package:coffee_ecommerse/theme.dart';
import 'package:coffee_ecommerse/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeAddCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: GoogleFonts
                .roboto()
                .fontFamily,
            scaffoldBackgroundColor: AppTheme.whiteColor),
        home: const SplashScreen(),
      ),
    );
  }
}
