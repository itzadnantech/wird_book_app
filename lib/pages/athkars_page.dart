import 'package:flutter/material.dart';
import 'package:wird_book_app/classes/language.dart';
import 'package:wird_book_app/classes/language_constants.dart';
import 'package:wird_book_app/main.dart';
import 'package:wird_book_app/pages/all_wird_sub_cat_page.dart';
import 'package:wird_book_app/router/route_constants.dart';
import 'package:wird_book_app/widget/search_widget.dart';
import 'package:wird_book_app/data/all_wird_cats.dart';
import 'package:wird_book_app/model/wird_category.dart';

class AthkarsPage extends StatefulWidget {
  const AthkarsPage({Key? key}) : super(key: key);

  @override
  _AthkarsPageState createState() => _AthkarsPageState();
}

class _AthkarsPageState extends State<AthkarsPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  late List<Wird_Category> list_wird_category;
  String query = '';

  @override
  void initState() {
    super.initState();

    list_wird_category = all_wird_cats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 20, 97),
        centerTitle: true,
        title: Text(translation(context).homePage),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language_sharp,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // Text(
                          //   e.flag,
                          //   style: const TextStyle(fontSize: 30),
                          // ),
                          Text(
                            e.name,
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: _drawerList(),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: searchWirdCategory,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: translation(context).search,
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 6, 20, 97), width: 4.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list_wird_category.length,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final single_wird_category = list_wird_category[index];
                  return buildWirdCategoryList(single_wird_category, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch(context) => SearchWidget(
        text: query,
        hintText: translation(context).search,
        onChanged: searchWirdCategory,
      );

  Widget buildWirdCategoryList(Wird_Category single_wird_category, context) =>
      Container(
        margin: EdgeInsets.all(8),
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
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
          leading: test(single_wird_category.wird_cat_id, context),
          trailing: const Icon(
            Icons.star_sharp,
            color: Color.fromARGB(255, 6, 20, 97),
            size: 20,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllWirdSubCatPage(
                        single_wird_category.wird_cat_id,
                        single_wird_category.wird_cat_title)));
          },
        ),
      );

  void searchWirdCategory(String query) {
    final list_wird_category = all_wird_cats.where((single_wird_category) {
      // final subWirdLower = book.subWird.toLowerCase();
      final single_wird_category_Lower =
          single_wird_category.wird_cat_title.toLowerCase();
      final searchLower = query.toLowerCase();

      // return subWirdLower.contains(searchLower) ||
      //     wirdLower.contains(searchLower);
      return single_wird_category_Lower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.list_wird_category = list_wird_category;
    });
  }

  test(String wird_cat_id, context) {
    switch (wird_cat_id) {
      case '1':
        return Text(
          translation(context).wird_cat_id_title_1,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '2':
        return Text(
          translation(context).wird_cat_id_title_2,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '3':
        return Text(
          translation(context).wird_cat_id_title_3,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '4':
        return Text(
          translation(context).wird_cat_id_title_4,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '5':
        return Text(
          translation(context).wird_cat_id_title_5,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '6':
        return Text(
          translation(context).wird_cat_id_title_6,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '7':
        return Text(
          translation(context).wird_cat_id_title_7,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '8':
        return Text(
          translation(context).wird_cat_id_title_8,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '9':
        return Text(
          translation(context).wird_cat_id_title_9,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      case '10':
        return Text(
          translation(context).wird_cat_id_title_10,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 6, 20, 97),
              fontWeight: FontWeight.w400),
        );

      default:
    }
  }
}
