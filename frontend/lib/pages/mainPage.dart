import 'package:flutter/material.dart';

import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/constants/my_colors.dart';
import 'package:frontend/service/service.dart';

import '../constants/my_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

String carPred = "";
String? selectedBrand;
String? selectedModel;
String? selectedfuelType;
String? selectedtransmission;
int? brandController = brandmap[selectedBrand];
String brandController2 = brandController.toString();
int? modelController = modelmap[selectedModel];
String modelController2 = modelController.toString();
final mileageController = TextEditingController();
int? transmissionController = tranmissonmap[selectedtransmission];
String transmissionController2 = transmissionController.toString();
int? fuelTypeController = fuelTypemap[selectedfuelType];
String fuelTypeController2 = fuelTypeController.toString();
final mpgController = TextEditingController();
final engineSizeController = TextEditingController();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lighttm,
        appBar: AppBar(
            backgroundColor: darktm,
            title: Icon(
              Icons.car_rental,
              color: lighttm2,
            )),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Form(
                    child: DropdownButtonFormField<String>(
                      value: selectedBrand,
                      items: brand.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Brand',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darktm, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darktm, width: 2.0),
                        ),
                        fillColor: lighttm2,
                        filled: true,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          selectedBrand = value!;
                          //print(selectedBrand);
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Form(
                    child: DropdownButtonFormField<String>(
                      value: selectedModel,
                      items: model.map((String model) {
                        return DropdownMenuItem<String>(
                          value: model,
                          child: Text(model),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Model',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darktm, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darktm, width: 2.0),
                        ),
                        fillColor: lighttm2,
                        filled: true,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          selectedModel = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Form(
                        child: DropdownButtonFormField<String>(
                          value: selectedfuelType,
                          items: fuelType.map((String fuelType) {
                            return DropdownMenuItem<String>(
                              value: fuelType,
                              child: Text(fuelType),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'FuelType',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darktm, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darktm, width: 2.0),
                            ),
                            fillColor: lighttm2,
                            filled: true,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              selectedfuelType = value!;
                              print(selectedfuelType);
                              print(fuelTypeController2);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Form(
                        child: DropdownButtonFormField<String>(
                          value: selectedtransmission,
                          items: transmission.map((String transmission) {
                            return DropdownMenuItem<String>(
                              value: transmission,
                              child: Text(transmission),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Transmission',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darktm, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darktm, width: 2.0),
                            ),
                            fillColor: lighttm2,
                            filled: true,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              selectedtransmission = value!;
                              print(selectedtransmission);
                              print(transmissionController2);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
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
                          controller: mpgController, hintText: "mpg")),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Flexible(
                child: MyTextField(
                    controller: engineSizeController, hintText: "engine size"),
              ),
              SizedBox(
                height: 7,
              ),
              MyButton(
                  onTap: () {
                    setState(() {
                      pred(
                          brandController2,
                          modelController2,
                          mileageController.text,
                          transmissionController2,
                          fuelTypeController2,
                          mpgController.text,
                          engineSizeController.text);
                    });
                  },
                  buttonName: "Pred"),
              SizedBox(
                height: 7,
              ),
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
