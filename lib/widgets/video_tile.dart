import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_favorites/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(video.thumb, fit: BoxFit.cover),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(video.title,
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.00),
                            maxLines: 2),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(video.channel,
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.00)),
                      ),
                    ]),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                onPressed: () {},
                color: Colors.white,
                iconSize: 16.00,
              )
            ],
          )
        ],
      ),
    );
  }
}
