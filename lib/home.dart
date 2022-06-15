import 'dart:convert';

import 'package:assignment3/dispplayer.dart';
import 'package:assignment3/scoredisp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late final response;
  List players=[];
  String p1="";
  String p2="";
  String p3="";
  String p4="";
  int holeNumber=0;
  int holeId=0;
  int len=0;
  int nextIn=0;
  int prevIn=0;
  int s1=0;
   int s2=0;
   int s3=0;
   int s4=0;

  @override
  void initState() {
    super.initState();
    player();
  }
  player() async{
    response= await DispUpServer().dispUpServer();
    print(response);
    Map<dynamic,dynamic> jsonData=jsonDecode(response);
    len=jsonData['success'].length;
    print(len);
    print(jsonData["success"][0].toString());
    for(int i=0;i<len;i++){
      players.add(jsonData["success"][i]);
    }

    setState(() {
      print("player list index0  \n"+players[0]["players"].toString());
      p1=players[0]["players"][0]["firstName"].toString() +","+players[0]["players"][0]["lastName"].toString();
      print("index0 \n"+players[0]["holeNumber"].toString());
      p2=players[0]["players"][1]["firstName"].toString() +","+players[0]["players"][1]["lastName"].toString();
      print("p2"+p2);
      p3=players[0]["players"][2]["firstName"].toString() +","+players[0]["players"][2]["lastName"].toString();
      p4=players[0]["players"][3]["firstName"].toString() +","+players[0]["players"][3]["lastName"].toString();
      holeNumber=int.parse(players[0]["holeNumber"]);
      holeId=(players[0]["hole_id"]);
      s1=(players[0]["players"][0]["default_score"]);
      s2=(players[0]["players"][1]["default_score"]);
      s3=(players[0]["players"][2]["default_score"]);
      s4=(players[0]["players"][3]["default_score"]);
      print("players index2"+players[1]);
    });
  }
  nextHole(){

    if(nextIn<=len){
      setState(() {
        nextIn=nextIn+1;
        if(int.parse(players[nextIn]["holeNumber"])==int.parse(players[nextIn+1]["holeNumber"])){
          nextIn=nextIn+1;
        }
        print("player list index0  \n"+players[0]["players"].toString());
        p1=players[nextIn]["players"][0]["firstName"].toString() +","+players[nextIn]["players"][0]["lastName"].toString();
        print("index0 \n"+players[0]["holeNumber"].toString());
        p2=players[nextIn]["players"][1]["firstName"].toString() +","+players[nextIn]["players"][1]["lastName"].toString();
        print("p2"+p2);
        p3=players[nextIn]["players"][2]["firstName"].toString() +","+players[nextIn]["players"][2]["lastName"].toString();
        p4=players[nextIn]["players"][3]["firstName"].toString() +","+players[nextIn]["players"][3]["lastName"].toString();
        holeNumber=int.parse(players[nextIn]["holeNumber"]);
        holeId=int.parse(players[0]["hole_id"]);
        s1=(players[nextIn]["players"][0]["default_score"]);
        s2=(players[nextIn]["players"][1]["default_score"]);
        s3=(players[nextIn]["players"][2]["default_score"]);
        s4=(players[nextIn]["players"][3]["default_score"]);
        prevIn=nextIn;
      });


    }
    else{

      setState(() {
        nextIn=0;
        print("player list index0  \n"+players[0]["players"].toString());
        p1=players[nextIn]["players"][0]["firstName"].toString() +","+players[nextIn]["players"][0]["lastName"].toString();
        print("index0 \n"+players[0]["holeNumber"].toString());
        p2=players[nextIn]["players"][1]["firstName"].toString() +","+players[nextIn]["players"][1]["lastName"].toString();
        print("p2"+p2);
        p3=players[nextIn]["players"][2]["firstName"].toString() +","+players[nextIn]["players"][2]["lastName"].toString();
        p4=players[nextIn]["players"][3]["firstName"].toString() +","+players[nextIn]["players"][3]["lastName"].toString();
        holeNumber=int.parse(players[nextIn]["holeNumber"]);
        holeId=int.parse(players[0]["hole_id"]);
        s1=(players[nextIn]["players"][0]["default_score"]);
        s2=(players[nextIn]["players"][1]["default_score"]);
        s3=(players[nextIn]["players"][2]["default_score"]);
        s4=(players[nextIn]["players"][3]["default_score"]);
        prevIn=nextIn;
      });
    }

  }
  previousHole(){


    if(prevIn>=len){ prevIn=nextIn-1;
      if(int.parse(players[prevIn]["holeNumber"])==int.parse(players[prevIn-1]["holeNumber"])){
        prevIn=prevIn-1;
      }
      setState(() {
        print("player list index0  \n"+players[0]["players"].toString());
        p1=players[prevIn]["players"][0]["firstName"].toString() +","+players[prevIn]["players"][0]["lastName"].toString();
        print("index0 \n"+players[0]["holeNumber"].toString());
        p2=players[prevIn]["players"][1]["firstName"].toString() +","+players[prevIn]["players"][1]["lastName"].toString();
        print("p2"+p2);
        p3=players[prevIn]["players"][2]["firstName"].toString() +","+players[prevIn]["players"][2]["lastName"].toString();
        p4=players[prevIn]["players"][3]["firstName"].toString() +","+players[prevIn]["players"][3]["lastName"].toString();
        holeNumber=int.parse(players[prevIn]["holeNumber"]);
        holeId=int.parse(players[0]["hole_id"]);
        s1=(players[prevIn]["players"][0]["default_score"]);
        s2=(players[prevIn]["players"][1]["default_score"]);
        s3=(players[prevIn]["players"][2]["default_score"]);
        s4=(players[prevIn]["players"][3]["default_score"]);
        nextIn=prevIn;
      });

    }
    else{
      debugPrint("else"+prevIn.toString());
      setState(() {
        if(prevIn==-1){
          prevIn=len-2;
          print(prevIn);
          nextIn=prevIn;
        }else{
          prevIn=prevIn-1;
          print(prevIn);
          nextIn=prevIn;
        }

        print("player list index0  \n"+players[0]["players"].toString());
        p1=players[prevIn]["players"][0]["firstName"].toString() +","+players[prevIn]["players"][0]["lastName"].toString();
        print("index0 \n"+players[0]["holeNumber"].toString());
        p2=players[prevIn]["players"][1]["firstName"].toString() +","+players[prevIn]["players"][1]["lastName"].toString();
        print("p2"+p2);
        p3=players[prevIn]["players"][2]["firstName"].toString() +","+players[prevIn]["players"][2]["lastName"].toString();
        p4=players[prevIn]["players"][3]["firstName"].toString() +","+players[prevIn]["players"][3]["lastName"].toString();
        holeNumber=int.parse(players[prevIn]["holeNumber"]);
        holeId=int.parse(players[0]["hole_id"]);
        s1=(players[prevIn]["players"][0]["default_score"]);
        s2=(players[prevIn]["players"][1]["default_score"]);
        s3=(players[prevIn]["players"][2]["default_score"]);
        s4=(players[prevIn]["players"][3]["default_score"]);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Hole Score"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon:Icon(Icons.camera_alt_outlined)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.info_outline)
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image:DecorationImage(
                // image: AssetImage("images/ball.jpg"),
                image: NetworkImage("https://cdn.pixabay.com/photo/2020/01/27/05/42/ball-4796461_960_720.jpg"),
                fit: BoxFit.cover,
              )
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: (){
                              previousHole();

                            },
                            icon: Icon(Icons.skip_previous,color: Colors.white,size: 50,)
                        ),
                        Row(
                          children: [
                            Text("HOLE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 10,),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text(holeNumber.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: (){
                             nextHole();
                            },
                            icon: Icon(Icons.skip_next,color: Colors.white,size: 50,)
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(p1.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      if(s1!=0) {
                                        s1 = s1 - 1;
                                      }
                                      else{
                                        s1=0;
                                      }

                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.minimize_rounded)
                              ),
                              Text(s1.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      s1=s1+1;
                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.add_circle_outline_rounded)
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(p2.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.red
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      if(s2!=0) {
                                        s2 = s2 - 1;
                                      }
                                      else{
                                        s2=0;
                                      }

                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                   icon: Icon(Icons.minimize_rounded)
                              ),
                              Text(s2.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      s2=s2+1;
                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.add_circle_outline_rounded)
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(p3.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.yellow
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      if(s3!=0) {
                                        s3 = s3 - 1;
                                      }
                                      else{
                                        s3=0;
                                      }

                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.minimize_rounded)
                              ),
                              Text(s3.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      s3=s3+1;
                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.add_circle_outline_rounded)
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(p4.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.yellow
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      if(s4!=0) {
                                        s4 = s4 - 1;
                                      }
                                      else{
                                        s4=0;
                                      }

                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.minimize_rounded)
                              ),
                              Text(s4.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              IconButton(
                                  onPressed:(){
                                    setState(() {
                                      s4=s4+1;
                                    });
                                    ScoreUpServer().scoreUpServer(s1, s2, s3, s4, holeId, holeNumber,context);
                                  },
                                  icon: Icon(Icons.add_circle_outline_rounded)
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("SI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  )

                                ],
                              ),
                              Row(
                                children: [
                                  Text("PAR",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("4",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("4",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("4",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                                  )

                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PAR",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(width: 10,),
                          Container(
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("350",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                          ),
                          SizedBox(width: 10,),
                          Container(
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("320",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                          ),
                          SizedBox(width: 10,),
                          Container(
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("319",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))
                          )

                        ],
                      )
                    ],
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
