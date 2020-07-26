import 'package:cartvorie/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

GlobalKey<ScaffoldState> scaffoldKey;
ValueNotifier<User> currentUser = new ValueNotifier(User());
String serverMessage;

Future<User> login({email, password}) async {
  final String url = 'https://test.codtrix.com/api/v1/login';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode({'email': email, 'password': password}),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    print(response.body);
    setCurrentUser(response.body);
    currentUser.value =
        User.fromJSON(json.decode(response.body)['data']['user']);
  }
  return currentUser.value;
}

void setCurrentUser(jsonString) async {
  if (json.decode(jsonString)['user'] != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'current_user', json.encode(json.decode(jsonString)['data']['user']));
  }
}
