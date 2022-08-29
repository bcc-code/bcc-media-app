import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class livechromecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator 02livechromecastWidget - FRAME
    return Container(
        width: 375,
        height: 1253,
        decoration: BoxDecoration(
          color: Color.fromRGBO(13, 22, 35, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 504,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(),
                    SizedBox(height: 0),
                    Container(
                        width: 375,
                        height: 72,
                        decoration: BoxDecoration(),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 375,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: SvgPicture.asset(
                                            'assets/images/background.svg',
                                            semanticsLabel: 'background')),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: SvgPicture.asset(
                                            'assets/images/line.svg',
                                            semanticsLabel: 'line')),
                                  ]))),
                          Positioned(top: 22, left: 337, child: Container()),
                          Positioned(
                              top: 22,
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      'Today, 10.03',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(254, 254, 254, 1),
                                          fontFamily: 'Barlow',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.1666666666666667),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                              width: 69,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ),
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    child: Text(
                                                      'Serie',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              230, 60, 98, 1),
                                                          fontFamily: 'Barlow',
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height:
                                                              1.1428571428571428),
                                                    )),
                                                Positioned(
                                                    top: 0,
                                                    left: 37,
                                                    child: Text(
                                                      'S1:E1',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              217, 224, 235, 1),
                                                          fontFamily: 'Barlow',
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height:
                                                              1.1428571428571428),
                                                    )),
                                              ])),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              top: 14,
                              left: 16,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      'Nå',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(254, 254, 254, 1),
                                          fontFamily: 'Barlow',
                                          fontSize: 17,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.1764705882352942),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '2h 34m',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(112, 124, 142, 1),
                                          fontFamily: 'Barlow',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.1428571428571428),
                                    ),
                                  ],
                                ),
                              )),
                        ])),
                    SizedBox(height: 0),
                    Container(),
                  ],
                ),
              )),
          Positioned(top: 300, left: 0, child: Container()),
          Positioned(top: 88, left: 0, child: Container()),
          Positioned(top: 0, left: 0, child: Container()),
          Positioned(top: 1168, left: 0, child: Container()),
        ]));
  }
}
