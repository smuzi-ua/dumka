import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import "package:lucide_icons/lucide_icons.dart";

class ControlScreen extends StatefulWidget {
  @override
  ControlPage createState() => ControlPage();
}

class ControlPage extends State<ControlScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Анна Кобзар", "nick": "@Kobzarka", "type": "учень(иця)"},
    {"id": 2, "name": "Вовочка Бест", "nick": "@theBest", "type": "учень(иця)"},
    {"id": 3, "name": "Данило Шевченко", "nick": "@Danya2005", "type": "вчитель(ка)"},
    {"id": 4, "name": "Joe Biden", "nick": "@mrAmerica", "type": "учень(иця)"},
  ];
  final List<Map<String, dynamic>> _newUsers = [
    {"id": 1, "name": "Петро Петрів", "nick": "@pet_pet", "type": "учень(иця)"},
    {"id": 2, "name": "Winston Smith", "nick": "@rebel84", "type": "вчитель(ка)"},
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  List<Map<String, dynamic>> _foundnewUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    _foundnewUsers = _newUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    List<Map<String, dynamic>> resultsNew = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
      resultsNew = _newUsers;
    } else {
      results = _allUsers.where((user) => (user["name"] as String).toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      resultsNew = _newUsers.where((user) => (user["name"] as String).toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundUsers = results;
      _foundnewUsers = resultsNew;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UIConfig.bgColor,
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        elevation: 0,
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
          'Панель керування',
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
          const SizedBox(height: 19),
          Container(
              height: 47,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  hintText: 'Пошук',
                    hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                        fontSize: 16), prefixIcon: const Icon(LucideIcons.search)
                ),
              ),
          ),
          const SizedBox(height: 15),
          DefaultTabController(
            length: 2,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 260,
              child: Column(
              children: <Widget>[
                SizedBox(
                  width: 280,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.deepPurple[300],
                    unselectedLabelColor: Colors.grey[900],
                    labelStyle: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 14)),
                    tabs: <Widget>[
                      Container(
                        height: 42,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: const Tab(
                          text: "Користувачi",
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: const Tab (
                          text: "Заявки",
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      if (_foundUsers.isNotEmpty) ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          width: 340,
                          height: 47,
                          key: ValueKey(_foundUsers[index]["id"]),
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 8,
                              ),
                              Icon(
                                  LucideIcons.user,
                                  color: Colors.grey[900],
                                  size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_foundUsers[index]['name'].toString(), style: TextStyle(fontSize: 14)),
                                  Text(_foundUsers[index]['nick'].toString(), style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Spacer(),
                                  Text(
                                    '${_foundUsers[index]["type"]}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const Spacer(flex: 2),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(LucideIcons.key,
                                  color: Colors.grey[800],
                                  size: 24,),
                                onPressed: () {
                                  // todo key
                                },
                              ),
                              IconButton(
                                icon: Icon(LucideIcons.settings,
                                  color: Colors.grey[800],
                                  size: 24,),
                                  onPressed: () {
                                  // todo settings
                                  },
                              ),
                            ],
                            ),
                          ),
                        ) else const Text(
                          'Користувачів не знайдено',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      if (_foundnewUsers.isNotEmpty) ListView.builder(
                        itemCount: _foundnewUsers.length,
                        itemBuilder: (context, index) => Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          width: 340,
                          height: 76,
                          key: ValueKey(_foundnewUsers[index]["id"]),
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.8),
                            child: Column(
                            children: <Widget>[
                              Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                LucideIcons.user,
                                  color: Colors.grey[900],
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(_foundnewUsers[index]['name'].toString(), style: TextStyle(fontSize: 14)),
                                    Text(_foundnewUsers[index]['nick'].toString(), style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 38,
                                    ),
                                    SizedBox(
                                      width: 94,
                                      height: 22,
                                      child: FlatButton(
                                        onPressed: () {
                                          //todo Підтвердити
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)),
                                        color: Colors.purple[300],
                                        child: Text(
                                          'Підтвердити',
                                          style: TextStyle(color: Colors.grey[100], fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14.5,
                                    ),
                                    SizedBox(
                                      width: 94,
                                      height: 22,
                                      child: FlatButton(
                                        onPressed: () {
                                          //todo Заблокувати
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0)),
                                        color: Colors.purple[300],
                                        child: Text(
                                          'Заблокувати',
                                          style: TextStyle(color: Colors.grey[100], fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                          ),
                        ),
                      ) else const Text(
                        'Користувачів не знайдено',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}