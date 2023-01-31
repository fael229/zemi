import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int totCart(
  int num1,
  int num2,
) {
  // Add your function code here!
  double somme = 0.0;

  if (num1 < 10) {
    somme = (num1 * num2) + 0.0;
  } else {
    somme = (num1 * num2) + ((num1 * num2) * 0.05);
  }
  return somme.toInt();
}

int subtotal(List<int> prixlist) {
  // Add your function code here!
  int somme = 0;
  for (int i = 0; i < prixlist.length; i++) {
    somme = somme + prixlist[i];
  }
  return somme;
}

int fraislivraison(
  List<String> prixlist,
  int num1,
) {
  // Add your function code here!

  for (int i = 0; i < prixlist.length; i++) {
    if ((prixlist[i] == prixlist[i + 1]) ||
        (prixlist[i] == prixlist[i + 2]) ||
        (prixlist[i] == prixlist[i + 3]) ||
        (prixlist[i] == prixlist[i + 4]) ||
        (prixlist[i] == prixlist[i + 5]) ||
        (prixlist[i] == prixlist[i + 6]) ||
        (prixlist[i] == prixlist[i + 7]) ||
        (prixlist[i] == prixlist[i + 8]) ||
        (prixlist[i] == prixlist[i + 9]) ||
        (prixlist[i] == prixlist[i + 10])) {
      num1 = num1 + 0;
    } else if (prixlist[i] == prixlist[prixlist.length]) {
      num1 = num1 + 0;
    } else {
      num1 = num1 + 150;
    }
    ;
  }
  return num1;
}

int totalLiv(
  String zone,
  int num,
) {
  // Add your function code here!
  int a = 500;
  int b = 1000;
  int c = 1000;
  if (zone == "Cotonou") {
    return num + a;
  } else if (zone == "Calavi") {
    return num + b;
  } else {
    return num + c;
  }
}

String tostring(List<String> num1) {
  // Add your function code here!
  return num1.toString();
}

int multippl(
  int prix,
  int qty,
) {
  // Add your function code here!
  int c = prix * qty;
  return c;
}

double rate(
  List<double> num1,
  int nbre,
) {
  // Add your function code here!
  // Add your function code here!
  double s = 0.0;
  for (int i = 0; i < num1.length; i++) {
    s = s + num1[i] / nbre;
  }
  return s;
}

int ttc(
  int num1,
  int num2,
) {
  // Add your function code here!
  return num1 + num2;
}

String phone(
  String num1,
  String num2,
) {
  // Add your function code here!
  return num1 + num2;
}

int calculateAgeCopy(DateTime dateToCheck) {
  return DateTime.now().year - dateToCheck.year;
}

int livreSup(
  int num1,
  int num2,
  bool abo,
) {
  int s = 0;
  // Add your function code here!
  if ((abo == true) && (num1 < 3)) {
    s = 0;
  } else if ((abo == true) && (num1 > 3)) {
    s = 0;
  } else if ((num1 < 3) && (abo == false)) {
    s = num2;
  } else if ((num1 > 3) && (abo == false)) {
    s = num2 + 200;
  }
  return s;
}

int addqty(
  int num1,
  int num2,
) {
  // Add your function code here!
  return num1 + num2;
}

int reduce(
  int mt,
  int prct,
) {
  // Add your function code here!
  return mt - ((mt * prct) ~/ 100);
}

int reduceCopy(
  int mt,
  int prct,
) {
  // Add your function code here!
  return mt - ((mt * prct) ~/ 100);
}

int livreAbo(
  int frais,
  int nbre,
  bool abo,
) {
  // Add your function code here!
  int s = 0;
  if (abo == true) {
    s = 0;
  } else {
    s = frais * nbre;
  }
  return s;
}

bool abo(
  DateTime abodeb,
  DateTime now,
) {
  // Add your function code here!
  abodeb = DateTime(abodeb.year, abodeb.month, abodeb.day);
  now = DateTime(now.year, now.month, now.day);
  int s = 30;
  bool x;
  if ((now.difference(abodeb).inHours / 24).round() >= s) {
    x = false;
  } else {
    x = true;
  }
  return x;
}

DateTime date(DateTime abodeb) {
  // Add your function code here!
  abodeb = DateTime(abodeb.year, abodeb.month, abodeb.day);
  return abodeb;
}

List<LatLng> listlang(
  LatLng client,
  LatLng livreur,
) {
  // Add your function code here!
  List<LatLng> c = [client, livreur];
  return c;
}

int montantlivreur(int frais) {
  // Add your function code here!
  return frais - 100;
}

String? mapsRoute(
  String apiKey,
  LatLng originCo,
  LatLng destinationCo,
) {
  var orLat = originCo.latitude;
  var orLng = originCo.longitude;
  var disLat = destinationCo.latitude;
  var disLng = destinationCo.longitude;

  var origin =
      '$orLat,$orLng'; // coordonnées latitudinals et longitudinals de l'origine
  var destination =
      '$disLat, $disLng'; // coordonnées latitudinals et longitudinals de la destination
  var travelMode =
      'driving'; // mode de transport souhaité (voiture, marche, vélo, transport en commun)
  var mapUrl =
      'https://www.google.com/maps/dir/?api=1&key=$apiKey&origin=$origin&destination=$destination&travelmode=$travelMode';

  return mapUrl;
}

int newCustomFunction(int nb) {
  return nb + 1;
}
