import 'package:flutter/material.dart';

import 'package:paulsen_planer/widgets/task_group.dart';
//for time

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({Key? key}) : super(key: key);
  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Homework",
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
              tag: "homeworkButton",
              child: TaskGroupContainer(
                onTap: () {},
                color: Colors.orange,
                isSmall: true,
                icon: Icons.book_rounded,
                taskCount: 0,
                taskGroup: "Hausaufgaben",
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}

Stack _buildBody() {
  return Stack(
    children: [],
  );
}
