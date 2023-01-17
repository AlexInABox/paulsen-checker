import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //for time
import 'package:paulsen_planer/core/routes/routes.dart';

getSubstitution(int i, bool today) async {
  //get the substitution plan from the server alexinabox.de/api/paid
  //for now just return a random string
  if (today) {
    return "Ausfall heute";
  } else {
    return "Ausfall morgen";
  }
}

const List<String> timeTable = [
  "08:00 - 08:45",
  "08:50 - 09:35",
  "09:55 - 10:40",
  "10:40 - 11:25",
  "12:05 - 12:50",
  "12:50 - 13:35",
  "13:45 - 14:30",
  "14:35 - 15:20",
  "15:20 - 16:05",
  "16:05 - 16:50",
  "16:50 - 17:35",
  "17:35 - 18:20",
  "18:20 - 19:05"
];
const List<String> timeTableOb = [
  "08:00 - 08:45",
  "08:50 - 09:35",
  "09:55 - 10:40",
  "10:40 - 11:25",
  "11:45 - 12:30",
  "12:30 - 13:15",
  "13:45 - 14:30",
  "14:35 - 15:20",
  "15:20 - 16:05",
  "16:05 - 16:50",
  "16:50 - 17:35",
  "17:35 - 18:20",
  "18:20 - 19:05"
];

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

getDate(compact) {
  var now = DateTime.now();
  if (compact) {
    var formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(now);
  }
  var formatter = DateFormat('EEEE, dd MMMM yyyy');
  return formatter.format(now);
}

getDateTomorrow(compact) {
  var now = DateTime.now();
  var tomorrow = now.add(const Duration(days: 1));
  if (compact) {
    var formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(tomorrow);
  }
  var formatter = DateFormat('EEEE, dd MMMM yyyy');
  return formatter.format(tomorrow);
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
