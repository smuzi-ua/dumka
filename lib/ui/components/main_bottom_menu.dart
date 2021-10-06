import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/menu_popup.dart';
import 'bottom_sheet.dart';

class MainBottomMenu extends StatelessWidget {
  final bool sideScreen;
  final BuildContext screenContext;

  const MainBottomMenu(this.screenContext, {this.sideScreen = false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'bottom_menu',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: SizedBox(
            height: 54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(MdiIcons.menu),
                  color: Colors.grey,
                  onPressed: () {
                    DumkaBottomSheet.show(screenContext, MenuPopup(screenContext));
                  },
                ),
                if (!sideScreen)
                  IconButton(
                    icon: const Icon(MdiIcons.magnify),
                    color: Colors.grey,
                    onPressed: () {
                      // todo Search
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
