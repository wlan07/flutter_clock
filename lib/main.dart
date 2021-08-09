import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/views/HomeScreen.dart';

import 'core/constants/Myconst.dart';
import 'logic/cubit/page_cubit.dart';

Future<void> _warmupFlare() async {
  for (final filename in Myconst.filesToWarmup) {
    await cachedActor(AssetFlare(bundle: rootBundle, name: filename));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlareCache.doesPrune = false;

  await _warmupFlare();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xffd4a9b1))),
            )),
        home: BlocProvider(
          create: (context) => PageCubit()..init(),
          child: const MyClockHomeScreen(),
        ));
  }
}
