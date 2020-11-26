import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/headline_model.dart';
import 'locator.dart';
import 'ui/routers.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HeadlineModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prime News',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: '/',
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
