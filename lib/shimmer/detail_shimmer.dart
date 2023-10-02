import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Shimmer.fromColors(
          baseColor: Color.fromRGBO(122, 118, 118, 1),
          highlightColor: Color.fromRGBO(255, 255, 255, 1),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffEEEEEE)),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Container(
                        width: 120,
                        height: 150,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              height: 20.0,
                              color: Colors.white,
                            ),
                            SizedBox(height: 18),
                            Container(
                              width: MediaQuery.of(context).size.width - 250,
                              height: 20.0,
                              color: Colors.white,
                            ),                            
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffEEEEEE)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[                            
                            SizedBox(height: 8),
                            Container(
                              width: 130,
                              height: 40.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Container(
                              width: 130,
                              height: 40.0,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),                  
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffEEEEEE)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 220,
                                  height: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
