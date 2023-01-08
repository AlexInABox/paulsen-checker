import 'package:flutter/material.dart';
import 'package:paulsen_planer/core/res/color.dart';

class TaskGroupContainer extends StatelessWidget {
  final MaterialColor color;
  final bool? isSmall;
  //final double iconSize;
  final IconData icon;
  final String taskGroup;
  final num taskCount;
  final VoidCallback? onTap;
  const TaskGroupContainer({
    Key? key,
    required this.color,
    this.isSmall = false,
    required this.icon,
    required this.taskGroup,
    required this.taskCount,
    this.onTap,
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
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: isSmall! ? 5 : 10,
                spreadRadius: isSmall! ? 1 : 1,
                offset: isSmall! ? const Offset(2, 4) : const Offset(2, 6),
              )
            ],
            gradient: AppColors.getDarkLinearGradient(color),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: isSmall! ? 200 : 0,
            width: isSmall! ? 100 : 0,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: isSmall!
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: isSmall!
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: isSmall! ? 50 : 60,
                      color: Colors.white,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: isSmall!
                        ? Text(
                            " " + taskGroup,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'System',
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        : null,
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
