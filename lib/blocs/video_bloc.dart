import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_favorites/api.dart';
import 'package:youtube_favorites/models/video.dart';

class VideosBloc implements BlocBase {
  Api _api;
  List<Video> videos;

  final _videosController = StreamController<List<Video>>();
  final searchController = StreamController<String>();

  Stream get outVideos => _videosController.stream;

  Sink get inSearch => searchController.sink;

  VideosBloc() {
    _api = Api();
    searchController.stream.listen(_search);
  }

  void _search(String search) async {
    videos = await _api.search(search);
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    searchController.close();
  }
}
