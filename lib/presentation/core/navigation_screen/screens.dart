import 'package:learning_app/presentation/screens/cart_screen/cart_screen.dart';
import 'package:learning_app/presentation/screens/home_screen/home_screen.dart';
import 'package:learning_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:learning_app/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

enum Screens { home, search, profile, cart }

List<Widget> screens = const [
  HomeScreen(),
  SearchScreen(),
  ProfileScreen(),
  CartScreen(),
];
