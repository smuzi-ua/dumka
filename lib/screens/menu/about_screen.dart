import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      body: Column(
        children: <Widget>[
          const Spacer(flex: 2),
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
          // ignore: avoid_escaping_inner_quotes
          const Spacer(flex: 2),
          // ignore: avoid_escaping_inner_quotes
          Text(Texts.aboutFeedBack,
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const Spacer(),
          SizedBox(
            width: 205.2,
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
          const Spacer(flex: 2),
          Text(Texts.aboutSupport,
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const Spacer(),
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
          const Spacer(flex: 8),
        ],
      ),
    );
  }
}
