import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relax_app/Widgets/GenreCard.dart';
import 'package:relax_app/Widgets/TrackTile.dart';
import '../Constants.dart';

//MainWelcomeScreen
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Functions
  List<String> _autoSuggestion(String keyword, List<String> songsList) {
    List<String> suggestions = [];
    for (var i = 0; i < songsList.length; i++) {
      if (songsList[i].toUpperCase().contains(keyword.toUpperCase())) {
        suggestions.add(songsList[i]);
      }
    }
    print(suggestions);
    return suggestions;
  }
  //Constants
  final Duration _myDuration = Duration(milliseconds: 500);
  final Curve _myCurve = Curves.ease;
  List<String> _songsList = [
    'Softly Back to Sleep',
    'Read and Study',
    'Relaxation',
    'Good Morning',
    'Feel the Wild'
  ];
  //Vars
  bool state = false;
  //Build
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: _myDuration,
              switchInCurve: _myCurve,
              switchOutCurve: _myCurve,
              child: state
                  ? Container(
                      width: width,
                      height: height,
                      color: lightPurple.withOpacity(.7),
                      child: ListView(
                        children: [
                          GenreCard(
                            width: width,
                            image: 'images/1.jpg',
                            name: 'Softly Back o Sleep',
                            time: '42',
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
            ),
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                //Welcome Text // SearchBar
                Container(
                  width: width,
                  height: width * .25,
                  padding: EdgeInsets.symmetric(horizontal: width * .06),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Good Morning,',
                              style: TextStyle(
                                  color: darkPurple,
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * .065),
                            ),
                            Text(
                              ' Eleven',
                              style: TextStyle(
                                  color: darkPurple,
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * .065),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedContainer(
                          duration: _myDuration,
                          curve: _myCurve,
                          width: state ? width * .88 : width * .15,
                          height: width * .15,
                          padding: EdgeInsets.all(width * .035),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * .1),
                            color: lightPurple,
                          ),
                          child: AnimatedAlign(
                            duration: _myDuration,
                            curve: _myCurve,
                            alignment:
                                state ? Alignment.centerLeft : Alignment.center,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (state == true) {
                                        state = false;
                                      } else {
                                        state = true;
                                      }
                                      print(state);
                                    });
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: width * .07,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: AnimatedSwitcher(
                                    duration: _myDuration,
                                    child: state
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                right: width * .06,
                                                left: width * .03),
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              onChanged: (keyword) {
                                                _autoSuggestion(
                                                    keyword, _songsList);
                                              },
                                              cursorColor: Colors.white,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Enter a search term',
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff)),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff)),
                                                  ),
                                                  focusColor: Colors.white,
                                                  hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * .04,
                                                  )),
                                            ),
                                          )
                                        : SizedBox(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Whole Body
                AnimatedOpacity(
                  duration: _myDuration,
                  opacity: state ? 0 : 1,
                  child: Column(
                    children: [
                      //Genres Cards
                      Container(
                        width: width,
                        height: width * .8,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              width: width * .04,
                            ),
                            GenreCard(
                              width: width,
                              image: 'images/5.jpg',
                              time: '42',
                              name: 'Softly Back to Sleep',
                            ),
                            GenreCard(
                              width: width,
                              image: 'images/4.jpg',
                              time: '23',
                              name: 'Read and Study',
                            ),
                            GenreCard(
                              width: width,
                              image: 'images/3.jpg',
                              time: '15',
                              name: 'Relaxation',
                            ),
                            GenreCard(
                              width: width,
                              image: 'images/2.jpg',
                              time: '7',
                              name: 'Good Morning',
                            ),
                            GenreCard(
                              width: width,
                              image: 'images/1.jpg',
                              time: '22',
                              name: 'Feel the Wild',
                            ),
                            SizedBox(
                              width: width * .04,
                            ),
                          ],
                        ),
                      ),
                      //Recommended Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .06),
                        child: Container(
                          margin: EdgeInsets.only(top: width * .02),
                          width: width,
                          height: width * .2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Recommended ',
                                    style: TextStyle(
                                        color: darkPurple,
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * .06),
                                  ),
                                  Text(
                                    'Tracks',
                                    style: TextStyle(
                                        color: darkPurple,
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * .06),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  //  TODO
                                  print('see all');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'See all ',
                                      style: TextStyle(
                                          color: darkPurple,
                                          fontWeight: FontWeight.w400,
                                          fontSize: width * .04),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: darkPurple,
                                      size: width * .05,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Recommended Cards
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TrackTile(
                                width: width,
                                genre: '7 Days of managing stress',
                                name: 'The Positive Trap',
                                time: '8'),
                            TrackTile(
                                width: width,
                                genre: 'Relaxation',
                                name: 'Rain on Leaves',
                                time: '15'),
                            TrackTile(
                                width: width,
                                genre: 'Study and Read',
                                name: 'Rain of December',
                                time: '21'),
                            TrackTile(
                                width: width,
                                genre: 'Warm Romance',
                                name: 'In The Name of Love',
                                time: '9'),
                            TrackTile(
                                width: width,
                                genre: '7 Days of managing stress',
                                name: 'The Positive Trap',
                                time: '2'),
                            TrackTile(
                                width: width,
                                genre: '7 Days of managing stress',
                                name: 'The Positive Trap',
                                time: '14'),
                            TrackTile(
                                width: width,
                                genre: '7 Days of managing stress',
                                name: 'The Positive Trap',
                                time: '9'),
                            TrackTile(
                                width: width,
                                genre: '7 Days of managing stress',
                                name: 'The Positive Trap',
                                time: '1'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
