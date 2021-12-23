import 'package:app/provider/panchang_provider.dart';
import 'package:app/screens/panchang/widgets/hindu_maah_widget.dart';
import 'package:app/screens/panchang/widgets/karan_widget.dart';
import 'package:app/screens/panchang/widgets/mini_info_row.dart';
import 'package:app/screens/panchang/widgets/muhurta_widget.dart';
import 'package:app/screens/panchang/widgets/nakshatra_widget.dart';
import 'package:app/screens/panchang/widgets/tithi_widget.dart';
import 'package:app/screens/panchang/widgets/yog_widget.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PanchangBody extends StatelessWidget {
  const PanchangBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanchangProvider>(
      builder: (context, _provider, _) {
        if (_provider.error != null) {
          return SizedBox(
            height: SizeConfig.fitToHeight(250),
            child: Center(
                child: Text(
              _provider.error!,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )),
          );
        }

        if (_provider.loading) {
          return SizedBox(
            height: SizeConfig.fitToHeight(300),
            width: double.infinity,
            child: Center(
              child: Lottie.asset("assets/anim/planet.json",
                  fit: BoxFit.fitHeight, alignment: Alignment.center),
            ),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MiniInfoRow(
                ayana: _provider.data!.ayana,
                moonrise: _provider.data!.moonrise,
                moonset: _provider.data!.moonset,
                sunrise: _provider.data!.sunrise,
                sunset: _provider.data!.sunset,
                ritu: _provider.data!.ritu,
              ),
              SizedBox(
                height: SizeConfig.fitToHeight(10),
              ),
              TithiWidget(_provider.data!.tithi),
              NakshatraWidget(_provider.data!.nakshatra),
              YogWidget(_provider.data!.yog),
              KaranWidget(_provider.data!.karan),
              HinduMaahWidget(_provider.data!.hinduMaah,
                  paksha: _provider.data!.paksha,
                  ritu: _provider.data!.ritu,
                  sunSign: _provider.data!.sunSign,
                  moonSign: _provider.data!.moonSign,
                  ayana: _provider.data!.ayana,
                  panchangYog: _provider.data!.panchangYog,
                  vikramSamvat: _provider.data!.vikramSamvat,
                  vikramSamvatName: _provider.data!.vikramSamvatName,
                  shakaSamvat: _provider.data!.shakaSamvat,
                  shakaSamvatName: _provider.data!.shakaSamvatName,
                  dishaShool: _provider.data!.dishaShool,
                  dishaShoolRemedies: _provider.data!.dishaShoolRemedies,
                  nakShool: _provider.data!.nakShool,
                  moonNivas: _provider.data!.moonNivas),
              MuhurtaWidget(
                  name: "Abhijit Muhurta",
                  muhurta: _provider.data!.abhijitMuhurta),
              MuhurtaWidget(
                  name: "Rahukaal", muhurta: _provider.data!.rahukaal),
              MuhurtaWidget(
                  name: "Gulikaal", muhurta: _provider.data!.guliKaal),
              MuhurtaWidget(
                  name: "Yamghant Kaal", muhurta: _provider.data!.yamghantKaal),
            ],
          );
        }
      },
    );
  }
}
