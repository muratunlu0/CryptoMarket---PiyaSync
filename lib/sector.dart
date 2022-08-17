import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'main.dart';
import 'properties.dart';

class sector extends StatelessWidget {
  const sector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    Color appColor = Color.fromARGB(255, 0, 202, 138);
    int cryptoListCount = 10;

    List<String> Energy = [
      'POWR',
      'EWT',
      'WOZX',
      'GRID',
      'SNC',
      'ELEC',
      'TSL',
      'EVDC',
      'LITH',
      'ROX',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: appColor,
        // elevation: 0,
        title: Center(child: Text(arguments["title"])),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(21),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Padding(
          padding: EdgeInsets.only(
            right: 8,
            left: 8,
          ),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(cryptoListCount, (index) {
              return GestureDetector(
                onTap: () {
                  print("Container clicked");
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: index % 2 == 0
                        ? EdgeInsets.only(
                            right: 8,
                            top: 8,
                            bottom: index >= cryptoListCount - 2 ? 8 : 0,
                          )
                        : EdgeInsets.only(
                            top: 8,
                            bottom: index >= cryptoListCount - 2 ? 8 : 0,
                          ),
                    child: Container(
                      width: double.infinity,
                      color: appColor,
                      child: Center(
                        child: Column(
                          children: [
                            Spacer(),
                            Spacer(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                arguments["coinNames"][index].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Spacer(),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "Price",
                                                    style: TextStyle(
                                                        color: appColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Spacer(),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    double.parse(arguments[
                                                                    "coinPrices"]
                                                                [index]
                                                            .toString())
                                                        .toStringAsFixed(4),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 90, 90, 90),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Spacer(),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    '24h%',
                                                    style: TextStyle(
                                                        color: appColor,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Spacer(),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    double.parse(arguments[
                                                                    "coin24hours"]
                                                                [index]
                                                            .toString())
                                                        .toStringAsFixed(4),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 90, 90, 90),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //  Text(
                            //   'BTC $index',
                            //   style:
                            //       TextStyle(color: Colors.white, fontSize: 24),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
