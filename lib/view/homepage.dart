import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/model/model.dart';
import 'package:weatherapp/provider/api_provider.dart';
import 'package:weatherapp/view/detailspage.dart';
import 'package:weatherapp/view/favPage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: false);
    ApiProvider apiProviderTrue =
        Provider.of<ApiProvider>(context, listen: true);

    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<ApiProvider>(context, listen: false)
            .frommap(apiProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModal? ha = snapshot.data;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/96/df/d4/96dfd411ab0e68f8bc1eb47e4eee8771.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          color: Colors.black45.withOpacity(0.2),
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Spacer(),
                                TextField(
                                  onSubmitted: (value) {
                                    apiProviderTrue.searchImage(value);
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.6),
                                    hintText: 'Search...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  "${ha!.currentModal.condition.text} ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "${ha!.currentModal.temp_c}°C",
                                  style: TextStyle(
                                    fontSize: 70,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${ha!.locationModal.country} ",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${ha!.locationModal.name}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    apiProvider.addToFavourite(
                                        ha.locationModal.name,
                                        ha.currentModal.temp_c.toString(),
                                        ha.locationModal.name);

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => FavPage(),
                                    ));
                                  },
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => DetailsPage(),
                                    ));
                                  },
                                  child: Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Hourly Forecast',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 5),
                                                        height: 3,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.black12,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Weekly Forecast',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      height: 3,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              child: Row(
                                                children: [
                                                  ...List.generate(
                                                      ha
                                                          .forcatModal
                                                          .forcastday
                                                          .first
                                                          .hour
                                                          .length, (index) {
                                                    final hour = ha
                                                        .forcatModal
                                                        .forcastday
                                                        .first
                                                        .hour[index];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: 140,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.white10,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              '${hour.time.split(" ").sublist(1, 2).join(" ")}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Image.network(
                                                              'https:${hour.hourConditionModal.icon}',
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              '${ha.currentModal.humidity}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

String day = '';
String night = '';

TextEditingController txtsearch = TextEditingController();
