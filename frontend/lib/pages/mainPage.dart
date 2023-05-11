import 'package:flutter/material.dart';

import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/constants/my_colors.dart';
import 'package:frontend/service/service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

String carPred = "";

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final brandController = TextEditingController();
    final modelController = TextEditingController();
    final mileageController = TextEditingController();
    final transmissionController = TextEditingController();
    final fuelTypeController = TextEditingController();
    final mpgController = TextEditingController();
    final engineSizeController = TextEditingController();

    return Scaffold(
        backgroundColor: lighttm,
        appBar: AppBar(
            backgroundColor: darktm,
            title: Icon(
              Icons.car_rental,
              color: lighttm2,
            )),
        body: Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: MyTextField(
                          controller: brandController, hintText: "brand")),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                      child: MyTextField(
                          controller: modelController, hintText: "model")),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: MyTextField(
                          controller: mileageController, hintText: "mileage")),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: MyTextField(
                        controller: transmissionController,
                        hintText: "transmission"),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: MyTextField(
                          controller: fuelTypeController,
                          hintText: "fueltype")),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                      child: MyTextField(
                          controller: mpgController, hintText: "mpg")),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Flexible(
                child: MyTextField(
                    controller: engineSizeController, hintText: "engine size"),
              ),
              SizedBox(
                height: 5,
              ),
              MyButton(
                  onTap: () async {
                    await pred(
                        brandController.text,
                        modelController.text,
                        mileageController.text,
                        transmissionController.text,
                        fuelTypeController.text,
                        mpgController.text,
                        engineSizeController.text);
                    setState(() {});
                  },
                  buttonName: "Pred"),
              FutureBuilder<String>(
                future: getPred(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_crash,
                          color: lighttm2,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${snapshot.data!}\$",
                          style: TextStyle(
                              color: lighttm2,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_crash,
                          color: lighttm2,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Pred\$",
                          style: TextStyle(
                              color: lighttm2,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
