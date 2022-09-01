import 'package:flutter/material.dart';
import 'package:netflix_clone/Src/Screen/Screen/Screens.dart';
import 'package:netflix_clone/Src/Service/Provider/Provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context){
        return ScrollOffset();
      }),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix-Clone',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
        home: const NavScreen(),
      ),
    );
  }
}
