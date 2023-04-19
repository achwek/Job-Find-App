import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final tagsList = <String>[
    'All',
    'UI/UX',
    "MERN Stack",
    "IOT",
    "AI",
  ];
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    color: selected == index
                        ? Color(0xFF7165D6).withOpacity(0.2)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selected == index
                          ? Color(0xFF7165D6)
                          : Color(0xFF7165D6).withOpacity(0.2),
                    )),
                child: Text(tagsList[index]),
              )),
          separatorBuilder: (_, index) => SizedBox(
                width: 15,
              ),
          itemCount: tagsList.length),
    );
  }
}
