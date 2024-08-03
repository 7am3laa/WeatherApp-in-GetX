import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weatherscreen_controller.dart';

import 'package:weather_app/view/widgets/custom_card_description.dart';
import 'package:weather_app/view/widgets/custom_text.dart';
import 'package:weather_app/view/widgets/custom_textfield.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeatherScreenController());
    final cityController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff05406B),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: controller.isWeatherNull()
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: cityController,
                          onPressed: () {
                            controller.fetchWeather(cityController.text);
                          },
                        ),
                        const SizedBox(height: 20),
                        controller.errorMessage.value.isNotEmpty
                            ? CustomText(
                                text:
                                    '${controller.errorMessage.value.split(':').last} \n Please try again',
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      CustomTextField(
                        controller: cityController,
                        onPressed: () {
                          controller.fetchWeather(cityController.text);
                        },
                      ),
                      const SizedBox(height: 20),
                      if (controller.weatherModel != null) ...[
                        Column(
                          children: [
                            CustomText(
                              text:
                                  '${controller.weatherModel!.cityName} , ${controller.weatherModel!.country}',
                            ),
                            Image.asset(
                              controller.getWeatherImage(
                                  controller.weatherModel!.main),
                              width: 200,
                              height: 200,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  text:
                                      '${controller.weatherModel!.temperature}',
                                  fontSize: 64,
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(width: 5),
                                const CustomText(
                                  text: '°C',
                                  fontSize: 64,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                            Text(
                              controller.weatherModel!.description,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          children: [
                            CustomCard(
                              image: 'assets/images/feellike.png',
                              value: '${controller.weatherModel!.feelsLike}',
                              description: 'Feels Like',
                            ),
                            CustomCard(
                              image: 'assets/images/humidity.png',
                              value: '${controller.weatherModel!.humidity}',
                              description: 'Humidity',
                            ),
                            CustomCard(
                              image: 'assets/images/visiblitiy.png',
                              value: '${controller.weatherModel!.visibility}',
                              description: 'Visibility',
                            ),
                            CustomCard(
                              image: 'assets/images/windspeed.png',
                              value: '${controller.weatherModel!.windSpeed}',
                              description: 'Wind Speed',
                            ),
                            CustomCard(
                              isTime: true,
                              image: 'assets/images/sunrise.png',
                              value:
                                  '${controller.getTime(controller.weatherModel!.sunrise)}',
                              description: 'Sun Rise',
                            ),
                            CustomCard(
                              isTime: true,
                              image: 'assets/images/sunset.png',
                              value:
                                  '${controller.getTime(controller.weatherModel!.sunset)}',
                              description: 'Sun Set',
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
          );
        },
      ),
    );
  }
}
