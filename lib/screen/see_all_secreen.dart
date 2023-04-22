import 'package:flutter/material.dart';
import 'package:jobfindeapp/screen/welcome_screen.dart';

import '../widgets/upcoming_schedule.dart';
import 'home_screen.dart';

class SeeAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imgs = [
      "student1.jpg",
      "student2.jpg",
      "student3.jpg",
      "student4.jpg",
      "student1.jpg",
      "student2.jpg",
      "student3.jpg",
      "student4.jpg",
    ];
    List<String> students = [
      "John Doe",
      "Jane Doe",
      "Mark Smith",
      "Emma Johnson",
      "John Doe",
      "Jane Doe",
      "Mark Smith",
      "Emma Johnson",
    ];
    List<String> institutes = [
      "XYZ University",
      "ABC Institute",
      "PQR College",
      "LMN School",
      "XYZ University",
      "ABC Institute",
      "PQR College",
      "LMN School",
    ];
    List<String> profile = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor ultricies ligula, nec maximus felis rhoncus non.",
      "Donec commodo ex vel arcu consequat, a dapibus tortor mattis. Maecenas eu fringilla mauris. Sed tempor tristique elit, ac sollicitudin lorem lobortis vel.",
      "Suspendisse euismod, purus sed rhoncus interdum, augue eros dictum quam, in consequat augue ex id risus. Etiam faucibus, mi sit amet lacinia accumsan, odio augue ullamcorper dolor, nec gravida eros nulla vitae arcu.",
      "Nullam luctus libero eget risus laoreet, eget varius velit tristique. In hac habitasse platea dictumst. Sed ut sapien et ipsum egestas congue. Duis id risus quis magna tristique varius.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor ultricies ligula, nec maximus felis rhoncus non.",
      "Donec commodo ex vel arcu consequat, a dapibus tortor mattis. Maecenas eu fringilla mauris. Sed tempor tristique elit, ac sollicitudin lorem lobortis vel.",
      "Suspendisse euismod, purus sed rhoncus interdum, augue eros dictum quam, in consequat augue ex id risus. Etiam faucibus, mi sit amet lacinia accumsan, odio augue ullamcorper dolor, nec gravida eros nulla vitae arcu.",
      "Nullam luctus libero eget risus laoreet, eget varius velit tristique. In hac habitasse platea dictumst. Sed ut sapien et ipsum egestas congue. Duis id risus quis magna tristique varius.",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF7165D6),
        appBar: AppBar(
          title: Text("Student Reviews"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF7165D6),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 10,
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
              Row(
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "(124)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7165D6),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Color(0xFF7165D6),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: imgs.length, // number in students
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('Container tapped');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  // onPressed: () {},
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: InkWell(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                                "assets/images/${imgs[index]}"),
                                          ),
                                          title: Text(
                                            students[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          subtitle: Text(institutes[index]),
                                          trailing: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                "4.9",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            profile[index],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
