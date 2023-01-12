import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/core/routes/routes.dart';
import 'package:paulsen_planer/widgets/circle_gradient_icon.dart';
import 'package:paulsen_planer/widgets/task_group.dart';
import 'package:intl/intl.dart'; //for time
import 'package:paulsen_planer/logic/logic.dart';

class MensaScreen extends StatefulWidget {
  const MensaScreen({Key? key}) : super(key: key);
  @override
  State<MensaScreen> createState() => _MensaScreenState();
}

class _MensaScreenState extends State<MensaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mensa",
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
              tag: "mensaButton",
              child: TaskGroupContainer(
                onTap: () {},
                isSmall: true,
                color: Colors.lightGreen,
                icon: Icons.food_bank_rounded,
                taskCount: 0,
                taskGroup: "Mensa",
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
    );
  }
}
