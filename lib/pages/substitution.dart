import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/widgets/circle_gradient_icon.dart';
import 'package:task_management/widgets/task_group.dart';
import 'package:intl/intl.dart'; //for time
//import main.dart for the global variables
import 'package:task_management/main.dart';
import 'package:task_management/pages/home.dart';

class SubstitutionScreen extends StatefulWidget {
  const SubstitutionScreen({Key? key}) : super(key: key);
  @override
  State<SubstitutionScreen> createState() => _SubstitutionScreenState();
}

class _SubstitutionScreenState extends State<SubstitutionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getDate(),
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
              tag: "substitutionButton",
              child: TaskGroupContainer(
                onTap: () {},
                isSmall: true,
                color: Colors.indigo,
                icon: Icons.free_cancellation_rounded,
                taskCount: 0,
                taskGroup: "Vertretungsplan",
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }
}

Stack _buildBody() {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              _taskHeader(),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              _onGoingHeader(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Row _onGoingHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Aktuelles: ",
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: Text(
          "Mehr",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}

Row _taskHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SelectableText(
        "PaulsenPlaner",
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        toolbarOptions: const ToolbarOptions(
          copy: true,
          selectAll: true,
        ),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.workspace_premium,
            color: Colors.orange[400],
          ))
    ],
  );
}
