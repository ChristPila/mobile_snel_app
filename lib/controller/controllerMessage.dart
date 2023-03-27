import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:snel_app/mod%C3%A8le/messageModel.dart';
//import 'package:libota/utilitaires/Parametres.dart';

//import '../modeles/ArticleModel.dart';

class ControllerMessage with ChangeNotifier{

  List<MessageModel> messages = [];
  List<MessageModel> messageAll = [];
  var status;

  Future<List<MessageModel>>? getAllPost() async {
    /*var paramgetAllPost={
    'per_page': "10",
    '_embed':"",
    'page' : "${page}",
  };*/
    try {
      final response = await http.get(
          Uri.parse("http://192.168.51.177/wordpress/wp-json/wp/v2/posts?"),
          headers: {"Accept": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> databrute = jsonDecode(response.body);
        var data = databrute.map((e) => MessageModel.fromJson(e)).toList();

        var existant = messageAll;
        /* if (page == 1) {
        messageAll = data;
      } else {
        messageAll = [...existant, ...data];
      }*/
        messageAll = data;
        status = response.statusCode;
        messages = messageAll;
        notifyListeners();
        return data;
      } else {
        return Future.error("server error");
      }
    } catch (SocketException) {
      return Future.error(SocketException);
    }
  }

}

