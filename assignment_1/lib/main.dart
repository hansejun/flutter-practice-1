import 'package:assignment_1/widgets/color-card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF1F1F1F),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text('MONDAY',
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(width: 5),
                          Text('16',
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text('TODAY',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(width: 10),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(0xFFB22581),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Text('17',
                                      style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.3),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 20),
                                  Text('18',
                                      style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.3),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 20),
                                  Text('19',
                                      style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.3),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(width: 20),
                                  Text('20',
                                      style: TextStyle(
                                          color: Colors.white
                                              .withValues(alpha: 0.3),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 40),
                    Column(
                      children: [
                        ColorCard(
                            bgColor: Color(0xFFFEF654),
                            title: 'DESIGN\nMEETING',
                            startMonth: 11,
                            startDay: 30,
                            endMonth: 12,
                            endDay: 20,
                            names: ['ALEX', 'HELENA', 'NANA']),
                        SizedBox(height: 10),
                        ColorCard(
                            bgColor: Color(0xFF9D6BCE),
                            title: 'DESIGN\nMEETING',
                            startMonth: 11,
                            startDay: 30,
                            endMonth: 12,
                            endDay: 20,
                            names: ['ALEX', 'HELENA', 'NANA']),
                        SizedBox(height: 10),
                        ColorCard(
                            bgColor: Color(0xFFBCEF4B),
                            title: 'DESIGN\nMEETING',
                            startMonth: 11,
                            startDay: 30,
                            endMonth: 12,
                            endDay: 20,
                            names: ['ALEX', 'HELENA', 'NANA'])
                      ],
                    )
                  ])
                ],
              ),
            )));
  }
}
