import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProposalCardComponent extends StatelessWidget {
  final String name;
  final int numberOfComments;
  final int scoreUp;
  final int scoreDown;

  const ProposalCardComponent(
      this.name, this.numberOfComments, this.scoreUp, this.scoreDown);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 0.6, color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(child: SvgPicture.asset('assets/brain.svg')),
          ),
          const SizedBox(
            width: 18.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 14)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 44,
                      height: 22,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepPurple[400]),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        padding: const EdgeInsets.all(1),
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            const Spacer(),
                            Icon(
                              MdiIcons.triangle,
                              color: Colors.deepPurple[400],
                              size: 11,
                            ),
                            const Spacer(),
                            Text(
                              scoreUp.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 12)),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 44,
                      height: 22,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.deepOrange[500],
                        padding: const EdgeInsets.all(1),
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            const Spacer(),
                            Transform.rotate(
                              angle: 180 * 3.14 / 180,
                              child: const Icon(
                                MdiIcons.triangle,
                                color: Colors.white,
                                size: 11,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              scoreDown.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.white)),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 13,
                    ),
                    SizedBox(
                      width: 44,
                      height: 22,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(1),
                        color: Colors.grey[300],
                        onPressed: () {
                          // todo Comments
                        },
                        child: Row(
                          children: <Widget>[
                            const Spacer(),
                            Icon(
                              MdiIcons.commentMultipleOutline,
                              color: UIConfig.primaryColor,
                              size: 12,
                            ),
                            const Spacer(),
                            Text(
                              numberOfComments.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color: UIConfig.primaryColor)),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
