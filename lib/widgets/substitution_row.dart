import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/pages/home.dart';
import 'package:paulsen_planer/logic/logic.dart';

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
