import 'package:flutter/material.dart';

import 'models/brewery_model.dart';
import 'brewery_detail.dart';
import '../blocs/brewery_bloc.dart';

class BreweriesListView extends StatefulWidget {
  const BreweriesListView({super.key, required BuildContext context});

  @override
  State<BreweriesListView> createState() {
    return BreweriesListViewState();
  }
}

class BreweriesListViewState extends State<BreweriesListView> {
  // Per the tutorial I'm following, we made this back into a StatefulWidget
  // so that we could make the API call in initState(), and call dispose()
  // in the following method.

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  // @override
  // initState - I don't actually want to make the API call here. It gets made
  //             when the user tells it to via either the RefreshIndicator or
  //             the Get Breweries button.

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.allBreweries,
        builder: (context, AsyncSnapshot<List<BreweryModel>> snapshot) {
          if (snapshot.hasData == true) {
            return RefreshIndicator(
              onRefresh: () async {
                debugPrint('Main list RefreshIndicator triggered!!');
                bloc.getAllBreweries();
              },
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.all(14.0),
                  itemBuilder: (context, i) {
                    String snapTitleTest = '${snapshot.data?[i].name}';
                    String snapSubtitleTest =
                        '${snapshot.data?[i].city}, ${snapshot.data?[i].state}';
                    String listTileTitleText =
                        snapTitleTest == '' ? '<Empty>' : snapTitleTest;
                    String listTileSubtitleText =
                        snapSubtitleTest == '' ? '<Empty>' : snapSubtitleTest;

                    return Column(
                        // backgroundColor:
                        children: [
                          Card(
                            child: ListTile(
                                // ignore: sized_box_for_whitespace
                                leading: Container(
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(
                                      'assets/img/BeerMugIconImg.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                shape: Theme.of(context).listTileTheme.shape,
                                title: Text(listTileTitleText),
                                subtitle: Text(listTileSubtitleText),
                                //
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BreweryDetail(
                                                brewery: snapshot.data![i],
                                              )));
                                }),
                          ),
                          const SizedBox(height: 6)
                        ]); // to here.
                  }),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          // if no data, show | go back to the No Data image
          return getRefreshIndicator();
        });
  }
}

Widget getRefreshIndicator() {
  return RefreshIndicator(
    onRefresh: () async {
      // Handle refresh.
      debugPrint('RefreshIndicator / onRefresh activated!');

      // this fires an event
      bloc.getAllBreweries();
    },
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 120),
            Center(
              child: Image.asset(
                'assets/img/nodata.png',
                fit: BoxFit.fitHeight,
                height: 330,
                width: 338,
              ),
            ),
          ]),
    ),
  );
}
