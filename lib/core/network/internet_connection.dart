// ignore_for_file: unrelated_type_equality_checks
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectionChecker {
  static Future<bool> checkConnection() async{
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

static void showNoInternetMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('No internet connection. Please check your network.'),
      duration: Duration(seconds: 3),
    ),
  );
}
}