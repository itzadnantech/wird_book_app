import 'package:flutter/material.dart';

class AllWirdsPage extends StatefulWidget {
  final String wird_cat_id;
  final String wird_sub_cat_id;
  const AllWirdsPage(this.wird_cat_id, this.wird_sub_cat_id);

  @override
  _AllWirdsPageState createState() => _AllWirdsPageState();
}

class _AllWirdsPageState extends State<AllWirdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 20, 97),
        centerTitle: true,
        title: const Text("Wirds Page"),
      ),
      body: const Center(
        child: Text("Hi, Wellcome to here"),
      ),
    );
  }
}
