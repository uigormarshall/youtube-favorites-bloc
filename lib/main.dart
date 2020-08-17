import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_favorites/blocs/video_bloc.dart';
import 'package:youtube_favorites/screens/home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideosBloc>(
      bloc: VideosBloc(),
      child: MaterialApp(
        title: 'Youtube Bloc',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
