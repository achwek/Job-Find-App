import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/drawer.dart';
import 'package:jobfindeapp/screen/home_screen.dart';
import 'package:intl/intl.dart'; // pour formater les dates
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateOffreScreen extends StatefulWidget {
  @override
  _UpdateOffreScreenState createState() => _UpdateOffreScreenState();
}

class _UpdateOffreScreenState extends State<UpdateOffreScreen> {
  List<String> types = [
    "Select Type",
    "Full time",
    "contract",
  ];
  File? _imageFile = null;

  late String selectedCategory =
      types[0]; // To keep track of the selected category
  DateTime selectedDate = DateTime.now();
  final TextEditingController _closingDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7165D6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Choose an Image"),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          GestureDetector(
                                            child: Row(
                                              children: [
                                                Icon(Icons.image),
                                                SizedBox(width: 10),
                                                Text("Gallery"),
                                              ],
                                            ),
                                            onTap: () async {
                                              final pickedFile =
                                                  await ImagePicker().getImage(
                                                      source:
                                                          ImageSource.gallery);

                                              if (pickedFile != null) {
                                                setState(() {
                                                  _imageFile =
                                                      File(pickedFile.path);
                                                });
                                              }

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          SizedBox(height: 20),
                                          GestureDetector(
                                            child: Row(
                                              children: [
                                                Icon(Icons.camera_alt),
                                                SizedBox(width: 10),
                                                Text("Camera"),
                                              ],
                                            ),
                                            onTap: () async {
                                              final pickedFile =
                                                  await ImagePicker().getImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (pickedFile != null) {
                                                setState(() {
                                                  _imageFile =
                                                      File(pickedFile.path);
                                                });
                                              }

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: _imageFile != null
                                      ? FileImage(_imageFile!)
                                      : AssetImage("assets/images/google.png")
                                          as ImageProvider<Object>,

                                  radius: 50, // set the radius to 50
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Update Offre ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            label: Text(
                              "Title",
                              style: TextStyle(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.title,
                              color: Color(0xFF7165D6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          maxLines:
                              3, // Set the maximum number of lines for description
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            label: Text(
                              "Requirement",
                              style: TextStyle(
                                color: Color(0xFF7165D6),
                              ),
                            ),

                            // Use labelText instead of label
                            prefixIcon: Icon(
                              Icons.description, // Use description icon
                              color: Color(0xFF7165D6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            label: Text(
                              "Location",
                              style: TextStyle(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on, // Use location icon
                              color: Color(0xFF7165D6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            label: Text(
                              "Type",
                              style: TextStyle(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.type_specimen_outlined,
                              color: Color(0xFF7165D6),
                            ),
                          ),
                          value: selectedCategory,
                          items: types.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedCategory = newValue!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            label: Text(
                              "Closing Date",
                              style: TextStyle(
                                color: Color(0xFF7165D6),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF7165D6),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              helpText: 'Select a date',
                              cancelText: 'Cancel',
                              confirmText: 'OK',
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor:
                                        Color(0xFF7165D6), // change color here
                                    hintColor:
                                        Color(0xFF7165D6), // change color here
                                    colorScheme: ColorScheme.light(
                                        primary: Color(0xFF7165D6)),
                                    buttonTheme: ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary,
                                    ),
                                  ),
                                  child: child ?? const SizedBox.shrink(),
                                );
                              },
                            );
                            if (pickedDate != null) {
                              selectedDate = pickedDate;
                              _closingDateController.text =
                                  "${selectedDate.toLocal()}".split(' ')[0];
                            }
                          },
                          controller: _closingDateController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Update Offre",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
