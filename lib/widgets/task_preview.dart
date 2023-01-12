import 'package:flutter/material.dart';
import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/logic/logic.dart';

class TaskPreviewContainer extends StatelessWidget {
  const TaskPreviewContainer({
    Key? key,
    //required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                color: Colors.indigo[400],
                gradient: AppColors.getDarkLinearGradient(Colors.indigo),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(2, 6),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 80,
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
                color: Colors.orange[400],
                gradient: AppColors.getLinearGradient(Colors.orange),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(2, 6),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: double.infinity,
                height: 80,
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
                color: Colors.lightGreen[400],
                gradient: AppColors.getDarkLinearGradient(Colors.lightGreen),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightGreen.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(2, 6),
                  ),
                ],
              ),
              //width: 60.w,
              //height: 30.w,
              child: SizedBox(
                width: double.infinity,
                height: 80,
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
            height: 20,
          ),
          Container(
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
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(2, 6),
                ),
              ],
            ),
            //width: 60.w,
            //height: 30.w,
            child: SizedBox(
              width: double.infinity,
              height: 80,
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
        ],
      ),
    );
  }
}
