import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProposalBodyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.fromLTRB(15, 35.87, 15, 10),
        decoration: BoxDecoration(
          color: UIConfig.deepPurple300,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
            child: Text(
              ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse condimentum urna vel dolor sollicitudin accumsan. In auctor finibus diam, quis malesuada mi congue in. Sed dignissim sollicitudin tortor eu mollis.',
              style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
            ),
          ),
          Row(children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                height: 60,
                width: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(3),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        width: 50,
                        height: 50,
                        child: Column(children: <Widget>[
                          const Icon(MdiIcons.fileOutline,
                              color: Colors.white, size: 40),
                          Text(
                            'file $index',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        ]));
                  },
                )),
            const Spacer(),
          ])
        ]),
      ),
    ]);
  }
}
