import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/pages/home.dart';
import 'package:paulsen_planer/pages/substitution.dart';
import 'package:paulsen_planer/pages/substitution.dart';

hourToTime(hour) {
  if (hour == 1) {
    return "08:00 - 08:45";
  }
  if (hour == 2) {
    return "08:45 - 09:30";
  }
  if (hour == 3) {
    return "09:55 - 10:40";
  }
  if (hour == 4) {
    return "10:40 - 11:25";
  }
  if (hour == 5) {
    return "11:45 - 12:30";
  }
  if (hour == 6) {
    return "12:30 - 13:15";
  }
  if (hour == 7) {
    return "13:45 - 14:30";
  }
  if (hour == 8) {
    return "14:35 - 15:20";
  }
  if (hour == 9) {
    return "15:20 - 16:05";
  }
  if (hour == 10) {
    return "16:05 - 16:50";
  }
  if (hour == 11) {
    return "16:50 - 17:35";
  }
  if (hour == 12) {
    return "17:35 - 18:20";
  } else {
    return "nodata";
  }
}

class SubstitutionRowContainer extends StatelessWidget {
  final MaterialColor color;
  final int rowIndex;
  final VoidCallback? onTap;
  final bool? isHeader;
  final bool? isFooter;
  //final double iconSize;
  //final IconData icon;
  //final String taskGroup;
  //final num taskCount;
  //final VoidCallback? onTap;
  const SubstitutionRowContainer({
    Key? key,
    this.color = Colors.blue,
    this.isHeader = false,
    this.isFooter = false,
    this.onTap,
    required this.rowIndex,
    //required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
          decoration: BoxDecoration(
            color: color[400],
            gradient: AppColors.getDarkLinearGradient(color),
            borderRadius: isHeader!
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : isFooter!
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    : const BorderRadius.horizontal(),
          ),
          child: FractionallySizedBox(
            widthFactor: 1.0,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: isHeader! ? 30 : 40,
                  ),
                  SizedBox(
                    width: 30,
                    child: Text(
                      isHeader! ? "" : "($rowIndex)",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      isHeader! ? "Zeit" : hourToTime(rowIndex),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: isHeader!
                        ? Text(
                            getDate(true).toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          )
                        : FutureBuilder(
                            future: getSubstitution(rowIndex, true),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString());
                              } else {
                                return const Text('Loading...');
                              }
                            },
                          ),
                  ),
                  SizedBox(
                    width: 120,
                    child: isHeader!
                        ? Text(
                            getDateTomorrow(true).toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          )
                        : FutureBuilder(
                            future: getSubstitution(rowIndex, false),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString());
                              } else {
                                return const Text('Loading...');
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
