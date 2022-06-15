import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ScoreUpServer {
  scoreUpServer(int s1,int s2,int s3,int s4,int holeId,int holeNo,context) async {
    final Map<dynamic,dynamic> userData={
        "data": [
          {
            "holeNumber": holeNo,
            "hole_id": holeId,
            "players": [
              {
                "firstName": "Nick",
                "lastName": "Leviton",
                "player_id": "4",
                "default_score": s1
              },
              {
                "firstName": "Jeff",
                "lastName": "Hudson",
                "player_id": "13",
                "default_score": s2
              },
              {
                "firstName": "Barry",
                "lastName": "Pearce",
                "player_id": "14",
                "default_score": s3
              },
              {
                "firstName": "Graham",
                "lastName": "Piper",
                "player_id": "15",
                "default_score": s4
              }
            ]
          }
        ]

    };

    final response = await http.put(
      Uri.parse("http://php.demo4work.com/api/practical/?method=golf"),
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;
      int status = response.statusCode;
      print(status);
      if(status==200){
        const snackBar=SnackBar(
          content: Text("Score updated successfully"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      return responseBody;
    } else {
      debugPrint("response body =" + response.body);
    }
  }
}
