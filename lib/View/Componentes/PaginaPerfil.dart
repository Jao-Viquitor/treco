import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:treco/Model/Musicistas/Organista.dart';

class PaginaPerfil extends StatelessWidget {
  final Organista args;
  const PaginaPerfil(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "${snapshot.data![55]['url']}"),
                          fit: BoxFit.cover,
                        ),
                      )),
                      Text(
                        "${args.nome}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 72,
                            fontFamily: 'Raleway'),
                      ),
                    ],
                  );
                },
              ),
              Stack(
                children: [
                  Text(
                    "${args.telefone}",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${args.nivel}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "${args.batismo}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "${args.comum}",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              ButtonBar(),
            ],
          ),
        ),
      ),
    );
  }

  Future<List> getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var result = await http.get(url);
    List wait = jsonDecode(result.body);

    return wait;
  }
}
