import 'package:app/models/panchang/hindu_maah.dart';
import 'package:app/models/panchang/karan.dart';
import 'package:app/models/panchang/muhurta.dart';
import 'package:app/models/panchang/nakshatra.dart';
import 'package:app/models/panchang/nakshool.dart';
import 'package:app/models/panchang/tithi.dart';
import 'package:app/models/panchang/yog.dart';
import 'package:equatable/equatable.dart';

class Panchang with EquatableMixin {
  Panchang({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.vedicSunrise,
    required this.vedicSunset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hinduMaah,
    required this.paksha,
    required this.ritu,
    required this.sunSign,
    required this.moonSign,
    required this.ayana,
    required this.panchangYog,
    required this.vikramSamvat,
    required this.shakaSamvat,
    required this.vkramSamvatName,
    required this.shakaSamvatName,
    required this.dishaShool,
    required this.dishaShoolRemedies,
    required this.nakShool,
    required this.moonNivas,
    required this.abhijitMuhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghantKaal,
  });

  String day;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String vedicSunrise;
  String vedicSunset;
  Tithi tithi;
  Nakshatra nakshatra;
  Yog yog;
  Karan karan;
  HinduMaah hinduMaah;
  String paksha;
  String ritu;
  String sunSign;
  String moonSign;
  String ayana;
  String panchangYog;
  int vikramSamvat;
  int shakaSamvat;
  String vkramSamvatName;
  String shakaSamvatName;
  String dishaShool;
  String dishaShoolRemedies;
  NakShool nakShool;
  String moonNivas;
  Muhurta abhijitMuhurta;
  Muhurta rahukaal;
  Muhurta guliKaal;
  Muhurta yamghantKaal;

  factory Panchang.fromJson(Map<String, dynamic> json) => Panchang(
        day: json["day"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        vedicSunrise: json["vedic_sunrise"],
        vedicSunset: json["vedic_sunset"],
        tithi: Tithi.fromJson(json["tithi"]),
        nakshatra: Nakshatra.fromJson(json["nakshatra"]),
        yog: Yog.fromJson(json["yog"]),
        karan: Karan.fromJson(json["karan"]),
        hinduMaah: HinduMaah.fromJson(json["hindu_maah"]),
        paksha: json["paksha"],
        ritu: json["ritu"],
        sunSign: json["sun_sign"],
        moonSign: json["moon_sign"],
        ayana: json["ayana"],
        panchangYog: json["panchang_yog"],
        vikramSamvat: json["vikram_samvat"],
        shakaSamvat: json["shaka_samvat"],
        vkramSamvatName: json["vkram_samvat_name"],
        shakaSamvatName: json["shaka_samvat_name"],
        dishaShool: json["disha_shool"],
        dishaShoolRemedies: json["disha_shool_remedies"],
        nakShool: NakShool.fromJson(json["nak_shool"]),
        moonNivas: json["moon_nivas"],
        abhijitMuhurta: Muhurta.fromJson(json["abhijit_muhurta"]),
        rahukaal: Muhurta.fromJson(json["rahukaal"]),
        guliKaal: Muhurta.fromJson(json["guliKaal"]),
        yamghantKaal: Muhurta.fromJson(json["yamghant_kaal"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "vedic_sunrise": vedicSunrise,
        "vedic_sunset": vedicSunset,
        "tithi": tithi.toJson(),
        "nakshatra": nakshatra.toJson(),
        "yog": yog.toJson(),
        "karan": karan.toJson(),
        "hindu_maah": hinduMaah.toJson(),
        "paksha": paksha,
        "ritu": ritu,
        "sun_sign": sunSign,
        "moon_sign": moonSign,
        "ayana": ayana,
        "panchang_yog": panchangYog,
        "vikram_samvat": vikramSamvat,
        "shaka_samvat": shakaSamvat,
        "vkram_samvat_name": vkramSamvatName,
        "shaka_samvat_name": shakaSamvatName,
        "disha_shool": dishaShool,
        "disha_shool_remedies": dishaShoolRemedies,
        "nak_shool": nakShool.toJson(),
        "moon_nivas": moonNivas,
        "abhijit_muhurta": abhijitMuhurta.toJson(),
        "rahukaal": rahukaal.toJson(),
        "guliKaal": guliKaal.toJson(),
        "yamghant_kaal": yamghantKaal.toJson(),
      };

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        day,
        sunrise,
        sunset,
        moonrise,
        moonset,
        vedicSunrise,
        vedicSunset,
        tithi,
        nakshatra,
        yog,
        karan,
        hinduMaah,
        paksha,
        ritu,
        sunSign,
        moonSign,
        ayana,
        panchangYog,
        vikramSamvat,
        shakaSamvat,
        vkramSamvatName,
        shakaSamvatName,
        dishaShool,
        dishaShoolRemedies,
        nakShool,
        moonNivas,
        abhijitMuhurta,
        rahukaal,
        guliKaal,
        yamghantKaal
      ];
}
