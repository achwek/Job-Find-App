import 'package:flutter/material.dart';
import 'package:jobfindeapp/widgets/icon_text.dart';
import '../../../models/offre.dart';

class OffreDetail extends StatelessWidget {
  final Offre offre;
  OffreDetail(this.offre);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      height: 550,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 5,
            width: 60,
            color: Colors.grey.withOpacity(0.3),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8), // corrected padding value
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Image.asset(offre.logoUrl),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        offre.company,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Icon(
                      offre.isMark
                          ? Icons.bookmark
                          : Icons.bookmark_outline_outlined,
                      color: offre.isMark
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                    Icon(Icons.more_horiz_outlined),
                  ]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                offre.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(Icons.location_on_outlined, offre.location),
                  IconText(Icons.access_time_outlined, offre.time)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Requirement',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ...offre.req
                  .map((e) => Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 300,
                                ),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    wordSpacing: 2.5,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ]),
                      ))
                  .toList(),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 45,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xFF4DB6AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {},
                  child: Text('Apply Now'),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
