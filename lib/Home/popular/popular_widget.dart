import 'package:flutter/material.dart';
import 'package:movies/Home/popular/popular_item.dart';
import 'package:movies/Model/Movies%20and%20Results.dart';

class PopularWidget extends StatelessWidget {
  Results? resultResponse;

  PopularWidget(this.resultResponse);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.30,
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      '${resultResponse!.backdropPath ?? ''}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  left: size.width * 0.40,
                  top: size.height * 0.09,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 70,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.06,
            child: Row(
              children: [
                PopularItem(resultResponse),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      resultResponse!.title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      resultResponse!.releaseDate ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
