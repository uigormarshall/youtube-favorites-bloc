import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_favorites/models/video.dart';

const API_KEY = "yourKey";

class Api {
  search(String search) async {
    final String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10";
    http.Response response = await http.get(url);
    return decode(response);
  }

  decode(http.Response response) async {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map<Video>((item) {
        return Video.fromJson(item);
      }).toList();
      return videos;
    }
  }

  Future<List> suggestions(String search) async {
    final String url =
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json";

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return body[1].map((item) {
        return item[0];
      }).toList();
    }
    return [];
  }
}
