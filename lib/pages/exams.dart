import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/widgets/circle_gradient_icon.dart';
import 'package:task_management/widgets/task_group.dart';
import 'package:intl/intl.dart'; //for time

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({Key? key}) : super(key: key);
  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exams",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Hero(
              tag: "examsButton",
              child: TaskGroupContainer(
                onTap: () {},
                color: Colors.blue,
                isSmall: true,
                icon: Icons.calendar_month_rounded,
                taskCount: 0,
                taskGroup: "Klausuren",
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
    );
  }
}
