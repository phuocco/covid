import 'dart:convert';

import 'package:phuoc_nguyen_covid/models/country.dart';
import 'package:phuoc_nguyen_covid/models/global.dart';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
  Summary({
    this.global,
    this.countries,
    this.date,
  });

  Global global;
  List<Country> countries;
  DateTime date;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(
            json["Countries"].map((x) => Country.fromJson(x))),
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Global": global.toJson(),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "Date": date.toIso8601String(),
      };
}
