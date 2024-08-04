import 'package:flutter/material.dart';
import 'package:weather_app/view/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final dynamic value;
  final String description;
  final bool isTime;
  final bool isWind;
  final bool isHumidity;
  final bool isVisibility;

  const CustomCard({
    Key? key,
    required this.image,
    required this.value,
    required this.description,
    this.isTime = false,
    this.isWind = false,
    this.isHumidity = false,
    this.isVisibility = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xff22699D),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 60,
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: value,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(width: 5),
                CustomText(
                  text: isTime
                      ? checkTime(value)
                      : isWind
                          ? 'm/s'
                          : isHumidity
                              ? '%'
                              : isVisibility
                                  ? ''
                                  : '°C',
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ],
            ),
            CustomText(
              text: description,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      ),
    );
  }
}

dynamic checkTime(time) {
  time = time.split(':').first;
  time = int.parse(time);
  if (time >= 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}
