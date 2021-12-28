import 'package:flutter/material.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen.dart';
import 'package:learning_app/presentation/screens/home_screen/home_screen.dart';
import 'package:learning_app/presentation/screens/profile_screen/profile_screen.dart';

enum Screens { home, course, exam, cart , account }

List<Widget> screens = const [
  HomeScreen(),
  Scaffold(body: Center(child: Text("Cource"),),),
  Scaffold(body: Center(child: Text("Exam"),),),
  CartScreen(),
  ProfileScreen(),
];
