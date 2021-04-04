import 'package:flutter/material.dart';

import '../Constants.dart';

class GenreCard extends StatefulWidget {
  GenreCard({
    @required this.width,
    @required this.image,
    @required this.name,
    @required this.time,
  });

  final double width;
  final String image;
  final String name;
  final String time;

  final Duration myDuration = Duration(milliseconds: 500);

  @override
  _GenreCardState createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> with TickerProviderStateMixin {

  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 1.25);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(milliseconds: 1700), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * .6,
      height: widget.width * .7,
      margin: EdgeInsets.symmetric(horizontal: widget.width * .02),
      padding: EdgeInsets.symmetric(horizontal: widget.width * .04, vertical: widget.width * .04),
      //Image
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(widget.width * .05)),
      child: Stack(
        children: [
          //TextOverImage
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.width * .04, vertical: widget.width * .025),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.1),
                    borderRadius: BorderRadius.circular(widget.width * .1)),
                child: Text(
                  '${widget.time} min',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: widget.width * .03,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.width * .05,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: widget.width * .01,
                  ),
                  Text(
                    'Most Popular',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.width * .04,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          ),
          //PlayButton
          GestureDetector(
            onTap: (){
            //  TODO
              print('Pressed ${widget.name}');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: widget.width*.25,
                      height : widget.width*.25,
                      padding: EdgeInsets.all(widget.width*.05),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle
                      ),
                      child: Container(
                        width: widget.width*.2,
                        height: widget.width*.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: ScaleTransition(
                            scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
                            child: Icon(Icons.play_arrow,color: lightPurple,size: widget.width*.08,),
                        ),
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
