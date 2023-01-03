import 'package:flutter/material.dart';
import 'package:task_management/core/res/color.dart';

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
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color[400],
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 4,
              offset: const Offset(2, 6),
            )
          ],
          gradient: AppColors.getDarkLinearGradient(color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: isSmall! ? 60 : 60,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
