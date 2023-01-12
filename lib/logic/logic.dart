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

hourToTime(hour) {
  if (hour == 1) {
    return "08:00 - 08:45";
  }
  if (hour == 2) {
    return "08:45 - 09:30";
  }
  if (hour == 3) {
    return "09:55 - 10:40";
  }
  if (hour == 4) {
    return "10:40 - 11:25";
  }
  if (hour == 5) {
    return "11:45 - 12:30";
  }
  if (hour == 6) {
    return "12:30 - 13:15";
  }
  if (hour == 7) {
    return "13:45 - 14:30";
  }
  if (hour == 8) {
    return "14:35 - 15:20";
  }
  if (hour == 9) {
    return "15:20 - 16:05";
  }
  if (hour == 10) {
    return "16:05 - 16:50";
  }
  if (hour == 11) {
    return "16:50 - 17:35";
  }
  if (hour == 12) {
    return "17:35 - 18:20";
  } else {
    return "nodata";
  }
}

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
