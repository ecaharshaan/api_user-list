import 'dart:convert';

import 'package:api_user_demo/model/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Welcome> welCome = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
          itemCount: welCome.length,
          itemBuilder: (context, index) {
            return Container(
              height: 215,
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                Text('id: ${welCome[index].id}',
                style: TextStyle(fontSize: 18),
                ),
                Text('name: ${welCome[index].name}',
                style: TextStyle(fontSize: 18),
                ),
                Text('username: ${welCome[index].username}',
                style: TextStyle(fontSize: 18),
                ),
                Text('email: ${welCome[index].email}',
                style: TextStyle(fontSize: 18),
                ),
                Text('address: ${welCome[index].address}',
                style: TextStyle(fontSize: 18),
                ),
                Text('phone: ${welCome[index].phone}',
                style: TextStyle(fontSize: 18),
                ),
                Text('website: ${welCome[index].website}',
                style: TextStyle(fontSize: 18),
                ),
                Text('company: ${welCome[index].company}',
                style: TextStyle(fontSize: 18),
                ),
              ]),
            );
          }
        );
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        } 
      }
    );
  }

  Future<List<Welcome>> getData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200 ){
      for(Map<String, dynamic> index in data){
        welCome.add(Welcome.fromJson(index));
      }
      return welCome;
    }else{
      return welCome;
    }
  }
}