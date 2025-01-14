import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final Color bgColor;

  final String title;
  final double startMonth;
  final double startDay;
  final double endMonth;
  final double endDay;
  final List<String> names;

  const ColorCard(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.startMonth,
      required this.startDay,
      required this.endMonth,
      required this.endDay,
      required this.names});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(40)),
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text(startMonth.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              height: 0.9,
                              fontWeight: FontWeight.w600)),
                      Text(startDay.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black54),
                    width: 1,
                    height: 25,
                  ),
                  Column(
                    children: [
                      Text(endMonth.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              height: 0.9,
                              fontWeight: FontWeight.w600)),
                      Text(endDay.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                height: 0.9,
                                fontSize: 60,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    for (var name in names) ...[
                      Text(name,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withValues(alpha: 0.4),
                              fontWeight: FontWeight.w600)),
                      if (name != names.last) const SizedBox(width: 20),
                    ]
                  ])
                ],
              ),
            ],
          )),
    );
  }
}
