import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/widgets/circle_gradient_icon.dart';
import 'package:task_management/widgets/task_group.dart';
import 'package:intl/intl.dart'; //for time

bool premium = false;

openHome(context) {
  Navigator.pushNamed(context, Routes.home);
}

openSubstitution(context) {
  Navigator.pushNamed(context, Routes.substitution);
}

openMensaPage(context) {
  Navigator.pushNamed(context, Routes.mensa);
}

openExams(context) {
  Navigator.pushNamed(context, Routes.exams);
}

openHomework(context) {
  Navigator.pushNamed(context, Routes.homework);
}

getDate() {
  var now = DateTime.now();
  var formatter = DateFormat('EEEE, dd MMMM yyyy');
  return formatter.format(now);
}

getPremiumStatus() {
  if (premium) {
    return "+";
  } else {
    return "";
  }
}

void setPremiumStatus(bool status) {
  premium = status;
}

getNextTask() {
  return "Für die nächsten 7 Tage keine Aufgaben :)";
}

getNextExam() {
  return "Demnächst keine Prüfungen";
}

getNextSubstitution() {
  return "Für heute keine Vertretungen eingetragen";
}

getNextClass() {
  return "Freizeit :)";
}

getNextMeal() {
  return "Für heute keine Essenspläne eingetragen";
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(48, 49, 53, 1),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Hero(
              tag: "profile",
              child: CircleGradientIcon(
                onTap: () {
                  Navigator.pushNamed(context, Routes.todaysTask);
                },
                icon: Icons.account_circle_outlined,
                color: Colors.lightBlue,
                iconSize: 24,
                size: 40,
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      body: _buildBody(context),
    );
  }

  Stack _buildBody(context) {
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
                buildGrid(context),
                const SizedBox(
                  height: 25,
                ),
                _onGoingHeader(),
                const SizedBox(
                  height: 10,
                ),
                buildList(),
                const SizedBox(
                  height: 30,
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
        Text(
          "PaulsenPlaner" + getPremiumStatus(),
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        IconButton(
            onPressed: () {
              setPremiumStatus(!premium);
              setState(() {}); //refresh
            },
            icon: Icon(
              Icons.workspace_premium,
              color: Colors.orange[400],
            ))
      ],
    );
  }

  StaggeredGrid buildGrid(context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Hero(
            tag: "substitutionButton",
            child: TaskGroupContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.substitution);
              },
              color: Colors.indigo,
              icon: Icons.free_cancellation_rounded,
              taskCount: 0,
              taskGroup: "Vertretungsplan",
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Hero(
            tag: "homeworkButton",
            child: TaskGroupContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.homework);
              },
              color: Colors.orange,
              isSmall: false,
              icon: Icons.book_rounded,
              taskCount: 5,
              taskGroup: "Hausaufgaben",
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Hero(
            tag: "mensaButton",
            child: TaskGroupContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.mensa);
              },
              color: Colors.lightGreen,
              icon: Icons.food_bank_rounded,
              taskCount: 0,
              taskGroup: "Mensa",
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Hero(
            tag: "examsButton",
            child: TaskGroupContainer(
              onTap: () {
                Navigator.pushNamed(context, Routes.exams);
              },
              color: Colors.blue,
              isSmall: false,
              icon: Icons.calendar_month_rounded,
              taskCount: 9,
              taskGroup: "Klausuren",
            ),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView buildList() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(
                15,
              ),
              decoration: BoxDecoration(
                //color: Colors.orange[300],
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange[400],
                gradient: AppColors.getLinearGradient(Colors.orange),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 4,
                    offset: const Offset(3, 5),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: 100.w,
                height: 20.w,
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fällige Aufgaben: ",
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getNextTask(),
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(
                15,
              ),
              decoration: BoxDecoration(
                //color: Colors.orange[300],
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[400],
                gradient: AppColors.getDarkLinearGradient(Colors.blue),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 4,
                    offset: const Offset(3, 5),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: 100.w,
                height: 20.w,
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Die nächsten Klausuren: ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getNextExam(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(
                15,
              ),
              decoration: BoxDecoration(
                //color: Colors.orange[300],
                borderRadius: BorderRadius.circular(15),
                color: Colors.indigo[400],
                gradient: AppColors.getDarkLinearGradient(Colors.indigo),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 4,
                    offset: const Offset(3, 5),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: 100.w,
                height: 20.w,
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Ausfall heute: ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getNextSubstitution(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(
                15,
              ),
              decoration: BoxDecoration(
                //color: Colors.orange[300],
                borderRadius: BorderRadius.circular(15),
                color: Colors.lightGreen[400],
                gradient: AppColors.getDarkLinearGradient(Colors.lightGreen),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightGreen.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 4,
                    offset: const Offset(3, 5),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: 100.w,
                height: 20.w,
                child: FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Essen heute: ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getNextMeal(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 237, 241, 243),
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          //Duplicate the SizedBoxs here
          SizedBox(
            height: 0.w,
            child: Column(),
          ),
        ],
      ),
    );
  }
}

/*
class NextEvents extends StatelessWidget {
  const NextEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Have 5 SizedBoxs here alligned on the x-axis to the right and make them scrollable from left to right
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aufgaben für heute:",
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.purple[300],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      getNextTask(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Complete - 80%",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.rocket_rounded,
            size: 60,
            color: Colors.orange,
          ),

          //Duplicate the SizedBoxs here
          SizedBox(
            width: 60.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aufgaben für heute:",
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.purple[300],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      getNextTask(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Complete - 80%",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    final firstControlPoint = Offset(size.width * 0.6, 0);
    final firstEndPoint = Offset(size.width * 0.58, 44);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secControlPoint = Offset(size.width * 0.55, 50);
    final secEndPoint = Offset(size.width * 0.5, 50);
    path.quadraticBezierTo(
      secControlPoint.dx,
      secControlPoint.dy,
      secEndPoint.dx,
      secEndPoint.dy,
    );

//     path.lineTo(size.width * 0.45, 30);

//     final lastControlPoint = Offset(size.width * 0.45, 20);
//     final lastEndPoint = Offset(size.width * 0.2, 30);
//     path.quadraticBezierTo(
//       lastControlPoint.dx,
//       lastControlPoint.dy,
//       lastEndPoint.dx,
//       lastEndPoint.dy,
//     );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
