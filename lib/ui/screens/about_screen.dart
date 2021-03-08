import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        elevation: 0,
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
          'Обліковий запис',
          style: GoogleFonts.montserrat(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.grey.shade900,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 22),
          Container(
            height: 142,
            width: MediaQuery.of(context).size.width - 28,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(Texts.aboutText,
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          const SizedBox(height: 32),
          Text(Texts.aboutFeedBack,
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 42,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {
                      // todo email
                    },
                    child: const Icon(
                      MdiIcons.emailOutline,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 42,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {
                      // todo instagram
                    },
                    child: const Icon(
                      MdiIcons.instagram,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 42,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {
                      // todo telegram
                    },
                    child: const Icon(
                      MdiIcons.telegram,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 42,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {
                      // todo facebook
                    },
                    child: const Icon(
                      MdiIcons.facebook,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(Texts.aboutSupport,
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const SizedBox(height: 10),
          SizedBox(
            width: 42,
            height: 42,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(1),
              color: Colors.white,
              onPressed: () {
                // todo Comments
              },
              child: const Icon(
                MdiIcons.patreon,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
