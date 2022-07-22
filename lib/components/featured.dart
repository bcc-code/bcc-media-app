import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Featured extends StatelessWidget {
  const Featured({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 320),
      child: Container(
      height: 380,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              Container(
                  width: 344,
                  height: 380,
                  padding: const EdgeInsets.symmetric(horizontal: 1, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                          Container(
                              width: 342,
                              height: 380,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                      Container(
                                          width: 342,
                                          height: 380,
                                          child: Stack(
                                              children: [
                                                  Positioned.fill(
                                                      child: FlutterLogo(size: 342),
                                                  ),
                                                  Positioned.fill(
                                                      child: Stack(
                                                          children:[
                                                              Container(
                                                                  width: 342,
                                                                  height: 380,
                                                                  decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001d2838), Color(0xff1d2838)], )),
                                                              ),
                                                              Positioned(
                                                                  left: 16,
                                                                  top: 204,
                                                                  child: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children:[
                                                                          Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children:[
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "VERDT AT SE",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xffd9e0eb),
                                                                                              fontSize: 15,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w600,
                                                                                              letterSpacing: 1,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "Animationsserie fra bibelskolen",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xfffefefe),
                                                                                              fontSize: 28,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w800,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                              ],
                                                                          ),
                                                                          SizedBox(height: 16),
                                                                          SizedBox(
                                                                            height: 33,
                                                                            child: Container(
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                    border: Border.all(color: Color(0x33ffffff), width: 1, ),
                                                                                    color: Color(0xff6eb0e6),
                                                                                ),
                                                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4, ),
                                                                                child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children:[
                                                                                        Container(
                                                                                            height: 100,
                                                                                            padding: const EdgeInsets.only(bottom: 1, ),
                                                                                            child: Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children:[
                                                                                                    Text(
                                                                                                        "See more",
                                                                                                        style: TextStyle(
                                                                                                            color: Colors.white,
                                                                                                            fontSize: 18,
                                                                                                            fontFamily: "Barlow",
                                                                                                            fontWeight: FontWeight.w700,
                                                                                                        ),
                                                                                                    ),
                                                                                                ],
                                                                                            ),
                                                                                        ),
                                                                                    ],
                                                                                ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ],
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
              Container(
                  width: 344,
                  height: 380,
                  padding: const EdgeInsets.symmetric(horizontal: 1, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                          Container(
                              width: 342,
                              height: 380,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                      Container(
                                          width: 342,
                                          height: 380,
                                          child: Stack(
                                              children: [
                                                  Positioned.fill(
                                                      child: FlutterLogo(size: 342),
                                                  ),
                                                  Positioned.fill(
                                                      child: Stack(
                                                          children:[
                                                              Container(
                                                                  width: 342,
                                                                  height: 380,
                                                                  decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001d2838), Color(0xff1d2838)], )),
                                                              ),
                                                              Positioned(
                                                                  left: 16,
                                                                  top: 236,
                                                                  child: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children:[
                                                                          Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children:[
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "KL. 20:00",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xffd9e0eb),
                                                                                              fontSize: 15,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w600,
                                                                                              letterSpacing: 1,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "Festkveld",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xfffefefe),
                                                                                              fontSize: 28,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w800,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                              ],
                                                                          ),
                                                                          SizedBox(height: 16),
                                                                          Container(
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                  border: Border.all(color: Color(0x33ffffff), width: 1, ),
                                                                                  color: Color(0xffe63c62),
                                                                              ),
                                                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4, ),
                                                                              child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children:[
                                                                                      Container(
                                                                                          width: 24,
                                                                                          height: 24,
                                                                                          decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                          child: FlutterLogo(size: 24),
                                                                                      ),
                                                                                      SizedBox(width: 4),
                                                                                      SizedBox(
                                                                                        height: 25,
                                                                                        child: Container(
                                                                                            padding: const EdgeInsets.only(bottom: 1, ),
                                                                                            child: Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children:[
                                                                                                    Text(
                                                                                                        "Live",
                                                                                                        style: TextStyle(
                                                                                                            color: Colors.white,
                                                                                                            fontSize: 18,
                                                                                                            fontFamily: "Barlow",
                                                                                                            fontWeight: FontWeight.w700,
                                                                                                        ),
                                                                                                    ),
                                                                                                ],
                                                                                            ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                              ),
                                                                          ),
                                                                      ],
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ],
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
              Container(
                  width: 344,
                  height: 380,
                  padding: const EdgeInsets.symmetric(horizontal: 1, ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                          Container(
                              width: 342,
                              height: 380,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                      Container(
                                          width: 342,
                                          height: 380,
                                          child: Stack(
                                              children: [
                                                  Positioned.fill(
                                                      child: FlutterLogo(size: 342),
                                                  ),
                                                  Positioned.fill(
                                                      child: Stack(
                                                          children:[
                                                              Container(
                                                                  width: 342,
                                                                  height: 380,
                                                                  decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001d2838), Color(0xff1d2838)], )),
                                                              ),
                                                              Positioned(
                                                                  left: 16,
                                                                  top: 204,
                                                                  child: Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children:[
                                                                          Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children:[
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "FEATURED",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xffd9e0eb),
                                                                                              fontSize: 15,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w600,
                                                                                              letterSpacing: 1,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  SizedBox(
                                                                                      width: 310,
                                                                                      child: Text(
                                                                                          "Animationsserie fra bibelskolen",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xfffefefe),
                                                                                              fontSize: 28,
                                                                                              fontFamily: "Barlow",
                                                                                              fontWeight: FontWeight.w800,
                                                                                          ),
                                                                                      ),
                                                                                  ),
                                                                              ],
                                                                          ),
                                                                          SizedBox(height: 16),
                                                                          Container(
                                                                            height: 35,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                  border: Border.all(color: Color(0x33ffffff), width: 1, ),
                                                                                  color: Color(0xff6eb0e6),
                                                                              ),
                                                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4, ),
                                                                              child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children:[
                                                                                      Container(
                                                                                          height: double.infinity,
                                                                                          padding: const EdgeInsets.only(bottom: 1, ),
                                                                                          child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children:[
                                                                                                  Text(
                                                                                                      "See more",
                                                                                                      style: TextStyle(
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 18,
                                                                                                          fontFamily: "Barlow",
                                                                                                          fontWeight: FontWeight.w700,
                                                                                                      ),
                                                                                                  ),
                                                                                              ],
                                                                                          ),
                                                                                      ),
                                                                                  ],
                                                                              ),
                                                                          ),
                                                                      ],
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ],
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                      ],
                  ),
              ),
          ],
      ),
    ),
    );
  }
}