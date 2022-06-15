import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class DispUpServer {
  dispUpServer() async {
    final Map<dynamic,dynamic> userData={
        "data": [
          {
            "match_id": "59"
          }
        ]
    };

    final response = await http.put(
      Uri.parse("https://practical.demo4site.com/dev4/api/practical/?method=golf"),
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;

      return responseBody;
    } else {
      debugPrint("response body =" + response.body);
    }
  }
}
