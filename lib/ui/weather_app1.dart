import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';
import 'package:test_flutter/app_assets.dart';
import 'package:test_flutter/ui/weather_app2.dart';

class WeatherApp1 extends StatelessWidget {
  //List<dynamic> users=[];
  const WeatherApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.color1, AppColor.color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon đám mây
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Image.asset(
                    AppAssets.icCloudRain,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Weather\n',
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'ForeCasts',
                          style: TextStyle(color: AppColor.color3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    width: 290,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.color3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherApp2(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Start",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
