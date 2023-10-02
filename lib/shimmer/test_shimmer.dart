import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TestShimmer extends StatelessWidget {
  const TestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Color.fromRGBO(122, 118, 118, 1),
                highlightColor: Color.fromRGBO(255, 255, 255, 1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffEEEEEE)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(width: 70, height: 120, color: Colors.white),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          250,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          250,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 50),
                                    Container(
                                      width: 90,
                                      height: 10.0,
                                      color: Colors.white,
                                    ),                                   
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 65),
                                    Container(
                                      width: 100,
                                      height: 30.0,
                                      color: Colors.white,
                                    ),
                                  ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
