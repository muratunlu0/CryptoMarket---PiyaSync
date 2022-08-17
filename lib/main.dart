import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'properties.dart';
import 'sector.dart';
import 'splash_screen.dart';

import 'package:piyasync_mvp/repository/repository_cybersecurity.dart';
import 'package:piyasync_mvp/repository/repository_energy.dart';
import 'package:piyasync_mvp/repository/repository_gaming.dart';
import 'package:piyasync_mvp/repository/repository_marketPlace.dart';
import 'package:piyasync_mvp/repository/repository_media.dart';
import 'package:piyasync_mvp/repository/repository_memes.dart';
import 'package:piyasync_mvp/repository/repository_sports.dart';
import 'package:piyasync_mvp/repository/repository_web3.dart';

import 'models/fetchCoins_models/big_data_model_sector.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'PiyaSync';

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _title,
          home: SplashScreen(),
          routes: {
            '/sector': (context) => const sector(),
          });
    });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

bool loading = true;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String?> coinNames = [];
  List<String?> coinPrices = [];

  int finishDownload = 0;
  @override
  void initState() {
    PrintData();

    super.initState();
  }

  Future<void> PrintData() async {
    loading = true;
    BigDataModelSector Energy = await RepositoryEnergy().getCoins();
    BigDataModelSector MarketPlace = await RepositoryMarketPlace().getCoins();
    BigDataModelSector Cybersecurity =
        await RepositoryCybersecurity().getCoins();
    BigDataModelSector Media = await RepositoryMedia().getCoins();

    BigDataModelSector Sports = await RepositorySports().getCoins();
    BigDataModelSector Gaming = await RepositoryGaming().getCoins();
    BigDataModelSector Web3 = await RepositoryWeb3().getCoins();
    BigDataModelSector Memes = await RepositoryMemes().getCoins();

    setState(() {
      try {
        for (int i = 0; i < 3; i++) {
          coinNames.add(Energy.dataModel[i].symbol.toString());
          coinPrices
              .add(Energy.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(MarketPlace.dataModel[i].symbol.toString());
          coinPrices.add(
              MarketPlace.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(Cybersecurity.dataModel[i].symbol.toString());
          coinPrices.add(
              Cybersecurity.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(Media.dataModel[i].symbol.toString());
          coinPrices
              .add(Media.dataModel[i].quoteModel.usdModel.price.toString());
        }
        ///////////////
        for (int i = 0; i < 3; i++) {
          coinNames.add(Sports.dataModel[i].symbol.toString());
          coinPrices
              .add(Sports.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(Gaming.dataModel[i].symbol.toString());
          coinPrices
              .add(Gaming.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(Web3.dataModel[i].symbol.toString());
          coinPrices
              .add(Web3.dataModel[i].quoteModel.usdModel.price.toString());
        }
        for (int i = 0; i < 3; i++) {
          coinNames.add(Memes.dataModel[i].symbol.toString());
          coinPrices
              .add(Memes.dataModel[i].quoteModel.usdModel.price.toString());
        }
      } catch (e) {
        print("hata meydana geldi " + e.toString());
        loading = false;
      }
      finishDownload = 1;
      loading = false;
    });
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'henüz premium sayfası yok..',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'henüz premium sayfası yok..',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'henüz premium sayfası yok..',
        style: optionStyle,
      ),
    ),
  ];

  Color appColor = Color.fromARGB(255, 0, 202, 138);
  int cryptoListCount = 8;

  List<String> Titles = [
    'ENERGY',
    'MARKETPLACE',
    'CYBERSECURITY',
    'MEDIA',
    'SPORTS',
    'GAMING',
    'WEB3',
    'MEMES',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          // statusBarColor: Colors.white,
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          title: Center(child: Text("PiyaSync")),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: loading
            ? Loading()
            : ScrollConfiguration(
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
                        onTap: () async {
                          List<String?> coinNamesSector = [];
                          List<String?> coinPricesSector = [];
                          List<String?> coin24hours = [];

                          BigDataModelSector bigDataModelSector;
                          if (index == 0) {
                            bigDataModelSector =
                                await RepositoryEnergy().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 1) {
                            bigDataModelSector =
                                await RepositoryMarketPlace().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 2) {
                            bigDataModelSector =
                                await RepositoryCybersecurity().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 3) {
                            bigDataModelSector =
                                await RepositoryMedia().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 4) {
                            bigDataModelSector =
                                await RepositorySports().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 5) {
                            bigDataModelSector =
                                await RepositoryGaming().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 6) {
                            bigDataModelSector =
                                await RepositoryWeb3().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          } else if (index == 7) {
                            bigDataModelSector =
                                await RepositoryMemes().getCoins();
                            for (int i = 0; i < 10; i++) {
                              coinNamesSector.add(bigDataModelSector
                                  .dataModel[i].symbol
                                  .toString());
                              coinPricesSector.add(bigDataModelSector
                                  .dataModel[i].quoteModel.usdModel.price
                                  .toString());
                              coin24hours.add(bigDataModelSector.dataModel[i]
                                  .quoteModel.usdModel.percentChange_24h
                                  .toString());
                            }
                          }
                          Navigator.pushNamed(context, '/sector', arguments: {
                            "title": Titles[index],
                            "coinNames": coinNamesSector,
                            "coinPrices": coinPricesSector,
                            "coin24hours": coin24hours,
                          });
                        },
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: index % 2 == 0
                                ? EdgeInsets.only(
                                    right: 8,
                                    top: 8,
                                    bottom:
                                        index >= cryptoListCount - 2 ? 8 : 0,
                                  )
                                : EdgeInsets.only(
                                    top: 8,
                                    bottom:
                                        index >= cryptoListCount - 2 ? 8 : 0,
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
                                        Titles[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 19),
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
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? coinNames[
                                                                        index *
                                                                            3]
                                                                    .toString()
                                                                : '---',
                                                            style: TextStyle(
                                                                color: appColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? double.parse(coinPrices[
                                                                            index *
                                                                                3]
                                                                        .toString())
                                                                    .toStringAsFixed(
                                                                        4)
                                                                : '---',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        90,
                                                                        90,
                                                                        90),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? coinNames[
                                                                        index * 3 +
                                                                            1]
                                                                    .toString()
                                                                : '---',
                                                            style: TextStyle(
                                                                color: appColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? double.parse(coinPrices[
                                                                            index * 3 +
                                                                                1]
                                                                        .toString())
                                                                    .toStringAsFixed(
                                                                        4)
                                                                : '---',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        90,
                                                                        90,
                                                                        90),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? coinNames[
                                                                        index * 3 +
                                                                            2]
                                                                    .toString()
                                                                : '---',
                                                            style: TextStyle(
                                                              color: appColor,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            finishDownload == 1
                                                                ? double.parse(coinPrices[
                                                                            index * 3 +
                                                                                2]
                                                                        .toString())
                                                                    .toStringAsFixed(
                                                                        4)
                                                                : '---',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        90,
                                                                        90,
                                                                        90),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            color: Color.fromARGB(255, 66, 66, 66),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    color: _selectedIndex == 0 ? appColor : Colors.white,
                    icon: Icon(
                      Icons.money,
                    ),
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: _selectedIndex == 1 ? appColor : Colors.white,
                    icon: Icon(
                      Icons.monetization_on,
                    ),
                    onPressed: () {
                      if (loading == false) {
                        PrintData();
                      }

                      _onItemTapped(1);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: _selectedIndex == 2 ? appColor : Colors.white,
                    icon: Icon(
                      Icons.person,
                    ),
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
