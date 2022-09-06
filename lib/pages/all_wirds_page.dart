import 'package:flutter/material.dart';
import 'package:wird_book_app/classes/language.dart';
import 'package:wird_book_app/classes/language_constants.dart';
import 'package:wird_book_app/main.dart';
import 'package:wird_book_app/pages/all_wird_sub_cat_page.dart';
import 'package:wird_book_app/data/all_wirds.dart';
import 'package:wird_book_app/model/wird.dart';
import 'package:just_audio/just_audio.dart';

class AllWirdsPage extends StatefulWidget {
  final String wird_cat_id;
  final String wird_sub_cat_id;
  final String wird_sub_cat_title;
  final String wird_audio_link;
  const AllWirdsPage(this.wird_cat_id, this.wird_sub_cat_id,
      this.wird_sub_cat_title, this.wird_audio_link);

  @override
  _AllWirdsPageState createState() => _AllWirdsPageState();
}

class _AllWirdsPageState extends State<AllWirdsPage> {
  late List<Wird> wirds;

  /// Compulsory
  final player = AudioPlayer();
  String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';

  @override
  void initState() {
    super.initState();
    wirds = all_wirds
        .where((medium) =>
            medium.wird_sub_cat_id == widget.wird_sub_cat_id &&
            medium.wird_cat_id == widget.wird_cat_id)
        .toList();
  }

  /// Compulsory
  playMusic() async {
    final duration = await player.setUrl(widget.wird_audio_link);
    player.play();
  }

  /// Compulsory
  pauseMusic() async {
    await player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 20, 97),
        centerTitle: true,
        title: Text(widget.wird_sub_cat_title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton.icon(
                    onPressed: playMusic,
                    icon: Icon(Icons.play_arrow),
                    label: Text("Play Wird"),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 6, 20, 97)),
                  ),
                  ElevatedButton.icon(
                    onPressed: pauseMusic,
                    icon: Icon(Icons.stop),
                    label: Text("Stop Wird"),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 6, 20, 97)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: wirds.length,
                  itemBuilder: (context, index) {
                    final single_wird = wirds[index];
                    return WirdCards(single_wird, context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget WirdCards(Wird single_wird, context) => Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  title: Text(
                    "Wird " + single_wird.wird_id,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 6, 20, 97),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    single_wird.wird_description,
                    textAlign: TextAlign.center,
                  ))),
        ),
      );
}
