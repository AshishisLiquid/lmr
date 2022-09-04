import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmr/detail/detail.dart';
import 'package:lmr/services/firestore.dart';
import 'package:lmr/services/models.dart';
import 'package:lmr/shared/custommodel.dart';
import 'package:lmr/shared/shared.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int indx = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                height: size.height *
                    (1 +
                        (-0.07 -
                            0.005 -
                            0.1 -
                            0.091 -
                            0.042)), //color: Colors.red,

                child: ListView(
                  children: [
                    SizedBox(
                      
                      height: size.height * 0.35,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            children: [
                              Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight * 0.15,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.03),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * 0.5,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "Continue Reading",
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black
                                                            .withOpacity(0.85),
                                                        fontSize: 25)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * 0.2,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "view all",
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                              SizedBox(
                                  //color: Colors.green,
                                  height: constraints.maxHeight * 0.85,
                                  width: constraints.maxWidth,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return FutureBuilder(future: FirestoreService().getAllSubjects(),builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          List<Subject> subjects = snapshot.data as List<Subject>;
                                          return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: subjects.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsPage(
                                                      image:
                                                          subjects[index]
                                                              .image,
                                                      authorname:
                                                          subjects[index]
                                                              .author,
                                                      name:
                                                          subjects[index]
                                                              .name, 
                                                      description: subjects[index].description,
                                                    ),
                                                  ),
                                                ),
                                                child: Hero(
                                                  tag: const Text("Haha"),
                                                  child: Container(
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal:
                                                            constraints.maxWidth *
                                                                0.025),
                                                    width: constraints.maxWidth *
                                                        0.34,
                                                    height:
                                                        constraints.maxHeight *
                                                            0.84,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius
                                                            .circular(constraints
                                                                    .maxHeight *
                                                                0.081),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover, image: Image.network(subjects[index].image).image),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 3,
                                                              spreadRadius: 2,
                                                              offset:
                                                                  const Offset(4, 1),
                                                              color: Colors.black
                                                                  .withOpacity(
                                                                      0.1))
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: constraints.maxHeight *
                                                    0.01,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.05),
                                                height: constraints.maxHeight *
                                                    0.07,
                                                width:
                                                    constraints.maxWidth * 0.39,
                                                //color: Colors.red,
                                                child: FittedBox(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      subjects[index].name,
                                                      style: GoogleFonts.lato(
                                                          color: const Color.fromRGBO(
                                                              66, 66, 86, 1),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )),
                                              ),
                                              Container(
                                                height: constraints.maxHeight *
                                                    0.05,
                                                width:
                                                    constraints.maxWidth * 0.39,
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.05),
                                                //color: Colors.red,
                                                child: LayoutBuilder(
                                                  builder:
                                                      (context, constraints) {
                                                    return Row(
                                                      children: [
                                                        Container(
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.60,
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.8,
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                    .fromRGBO(
                                                                        230,
                                                                        230,
                                                                        232,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        constraints.maxHeight *
                                                                            0.3)),
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  height: constraints
                                                                      .maxHeight,
                                                                  width: constraints
                                                                          .maxWidth *
                                                                      subjects[index].percentageCompleted *
                                                                      0.01,
                                                                  decoration: BoxDecoration(
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                              66,
                                                                              66,
                                                                              86,
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(constraints.maxHeight *
                                                                              0.3)),
                                                                )
                                                              ],
                                                            )),
                                                        SizedBox(
                                                          height: constraints
                                                              .maxHeight,
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.2,
                                                          child: FittedBox(
                                                              child: Text(
                                                            "${subjects[index]
                                                                    .percentageCompleted}%",
                                                            style: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.7))),
                                                          )),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      );

                                        }else{
                                          return const Text('NO DATA');
                                        }
                                      });
                                                                          },
                                  ))
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      //color: Colors.red,
                      height: size.height * 0.45,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            children: [
                              Container(
                                  //color: Colors.purple,
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight * 0.1,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.03),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * 0.5,
                                            child: FittedBox(
                                              alignment: Alignment.topLeft,
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "Popular",
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black
                                                            .withOpacity(0.85),
                                                        fontSize: 23)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * 0.2,
                                            child: FittedBox(
                                              alignment: Alignment.centerRight,
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "view all",
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 15)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                             
                              SizedBox(
                                  //color: Colors.green,
                                  height: constraints.maxHeight * 0.7,
                                  width: constraints.maxWidth,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: popular.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxWidth *
                                                            0.025),
                                                width:
                                                    constraints.maxWidth * 0.35,
                                                height: constraints.maxHeight *
                                                    0.84,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                0.081),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: ExactAssetImage(
                                                            popular[index]
                                                                .imagePath)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 3,
                                                          spreadRadius: 2,
                                                          offset: const Offset(4, 1),
                                                          color: Colors.black
                                                              .withOpacity(0.1))
                                                    ]),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      bottom:
                                                          constraints.maxWidth *
                                                              0.02,
                                                      left:
                                                          constraints.maxWidth *
                                                              0.02,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    constraints
                                                                            .maxHeight *
                                                                        0.015),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    constraints
                                                                            .maxHeight *
                                                                        0.04)),
                                                        height: constraints
                                                                .maxHeight *
                                                            0.12,
                                                        width: constraints
                                                                .maxWidth *
                                                            0.12,
                                                        child: FittedBox(
                                                          child: Text(
                                                            "⭐ ${popular[index]
                                                                    .rating}",
                                                            style: GoogleFonts.lato(
                                                                textStyle: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: constraints.maxHeight *
                                                    0.01,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                height: constraints.maxHeight *
                                                    0.07,
                                                width:
                                                    constraints.maxWidth * 0.39,
                                                //color: Colors.red,
                                                child: FittedBox(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      popular[index].bookname,
                                                      style: GoogleFonts.lato(
                                                          color: const Color.fromRGBO(
                                                              66, 66, 86, 1),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                              
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ))
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
