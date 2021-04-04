import 'package:flutter/material.dart';

import '../Constants.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({
    Key key,
    @required this.width,
    @required this.time,
    @required this.genre,
    @required this.name,
  });

  final double width;
  final String time;
  final String genre;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      //  TODO
        print('Play $name');
      },
      child: ListTile(
        trailing: Container(
          width: width*.24,
          margin: EdgeInsets.only(bottom: width*.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$time min',
                style: TextStyle(
                    color: lightPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: width*.04
                ),
              ),
              Icon(Icons.play_arrow,color: lightPurple,size: width*.08,)
            ],
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: width*.05,
            color: darkPurple,
          ),
        ),
        subtitle: Text(
          genre,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: width*.03,
              color: darkPurple
          ),
        ),
      ),
    );
  }
}
