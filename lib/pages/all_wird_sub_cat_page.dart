import 'package:flutter/material.dart';
import 'package:wird_book_app/classes/language.dart';
import 'package:wird_book_app/classes/language_constants.dart';
import 'package:wird_book_app/main.dart';
import 'package:wird_book_app/pages/athkars_page.dart';
import 'package:wird_book_app/pages/all_wirds_page.dart';
import 'package:wird_book_app/data/all_wird_sub_cats.dart';
import 'package:wird_book_app/model/wird_sub_category.dart';

class AllWirdSubCatPage extends StatefulWidget {
  final String wird_cat_id;
  final String wird_cat_title;
  const AllWirdSubCatPage(this.wird_cat_id, this.wird_cat_title);

  @override
  _AllWirdSubCatPageState createState() => _AllWirdSubCatPageState();
}

class _AllWirdSubCatPageState extends State<AllWirdSubCatPage> {
  late List<Wird_Sub_Category> subwirds;

  @override
  void initState() {
    super.initState();
    // final subwirds = allSubWird.where((e) => e['wird_id'] == '1');
    // subwirds = all_wird_sub_cats.where((list) {
    //   final wirdLower = list.wird_cat_id.toLowerCase();
    //   return wirdLower.contains(widget.wird_cat_id);
    // }).toList();

    subwirds = all_wird_sub_cats
        .where((medium) => medium.wird_cat_id == widget.wird_cat_id)
        .toList();

    // subwirds = allSubWird.where((e) => e["wird_id"] = 10).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 20, 97),
          centerTitle: true,
          title: Text(widget.wird_cat_title),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: subwirds.length,
                itemBuilder: (context, index) {
                  final subwird = subwirds[index];
                  return buildBook(subwird, context);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildBook(Wird_Sub_Category list, context) => Container(
        margin: EdgeInsets.all(10),
        // margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.9),
              blurRadius: 2.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
            )
          ],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
          trailing: Icon(
            Icons.star_sharp,
            color: Color.fromARGB(255, 6, 20, 97),
            size: 20,
          ),
          leading: Text(
            list.wird_sub_cat_title,
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 6, 20, 97),
                fontWeight: FontWeight.w400),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllWirdsPage(
                        list.wird_cat_id,
                        list.wird_sub_cat_id,
                        list.wird_sub_cat_title,
                        list.wird_audio_link)));
          },
        ),
      );
}
