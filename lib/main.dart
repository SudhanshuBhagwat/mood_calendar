import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_calendar/providers/routine_provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

import './providers/mood_provider.dart';
import './screens/home_screen.dart';
import './models/mood.dart';
import './models/routine.dart';
import './models/routine_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MoodAdapter());
  Hive.registerAdapter(RoutineAdapter());
  Hive.registerAdapter(RoutineItemAdapter());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoodProvider()),
        ChangeNotifierProvider(create: (_) => RoutineProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: HomeScreen.routeName,
      // routes: {
      //   HomeScreen.routeName: (context) => HomeScreen(),
      //   CreateMoodScreen.routeName: (context) => CreateMoodScreen(),
      // },
      home: FutureBuilder(
        future: Hive.openBox('calendar'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return HomeScreen();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
