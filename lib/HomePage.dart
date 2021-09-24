import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageUrl = "";
  Future<String> getData() async {
    var data =
        await http.get(Uri.parse("https://meme-api.herokuapp.com/gimme"));
    return jsonDecode(data.body)["url"];
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   var url = getData();
  //   setState(() {
  //     imageUrl = url.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Meme App"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data.toString(),
                      fit: BoxFit.contain,
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(" Some Error Occured");
                  }
                  return CircularProgressIndicator();
                }),
            // Image.network(imageUrl),
            MaterialButton(
              onPressed: () {
                var url = getData();
                print(url);
                setState(() {
                  imageUrl = url.toString();
                });
              },
              child: Text("NEXT"),
            )
          ],
        ),
      ),
    ));
  }
}
