import 'package:brewery_info02/providers/app_theme.dart';
import 'package:flutter/material.dart';

import 'brewery_data_service.dart';
import 'brewery_main_body.dart';
import '../blocs/brewery_bloc.dart';

void main() {
  dataService = BreweryDataService();

  runApp(const App());
}

// this is probably why it's recommended to "keep state above the Widgets /
// classes that need it." (re: theBloc = bloc)
var theBloc = bloc;
late final BreweryDataService dataService;

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brewery Locator',
      theme: BreweryAppTheme.lightTheme,
      darkTheme: BreweryAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Brewery List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  //
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created
          // by the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        //
        body: BreweriesListView(context: context),
        //
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Expanded(
                child: Container(
                    height: 50, // SHOULD SET THESE BOTH using a variable.
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () {
                        debugPrint('"Get Breweries" button Clicked!');
                        theBloc.getAllBreweries();
                      },
                      style: Theme.of(context).outlinedButtonTheme.style,
                      child: const Text("Get Breweries"),
                    )),
              ),
              Expanded(
                child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        debugPrint(
                            'main page Find Closest button Received Click!');

                        var closestBreweryModel =
                            await dataService.getClosestBrewery();

                        openDialog('${closestBreweryModel.name} in ',
                            '${closestBreweryModel.city}, ${closestBreweryModel.state}');
                      },
                      style: Theme.of(context).outlinedButtonTheme.style,
                      child: const Text("Find Closest"),
                      // style: Theme.of(context).textTheme.displayMedium),
                    )),
              ),
            ],
          ),
        ));
  }

  Future openDialog(String textLine1, String textLine2) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Closest Brewery"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Text(textLine1),
                ]),
                Row(children: [
                  Text(textLine2),
                ]),
              ],
            ),
            actions: [
              TextButton(onPressed: okPressed, child: const Text("OK"))
            ],
          ));

  // closes the Closest Brewery dialog
  void okPressed() {
    Navigator.of(context).pop();
  }
}
