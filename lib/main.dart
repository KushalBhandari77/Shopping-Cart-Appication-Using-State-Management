import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/pages/home_page.dart';
import 'bloc/cart_bloc.dart';

void main() {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=>CartBloc()),
        ],
      child: MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

