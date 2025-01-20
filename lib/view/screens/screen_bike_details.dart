/*
* Created by Neloy on 19 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:bike_hub/managers/manager_bike_details.dart';
import 'package:bike_hub/network/models/model_bike.dart';
import 'package:bike_hub/view/utilities/components/custom_grid_fixed_height_delegate.dart';
import 'package:flutter/material.dart';

import '../utilities/values/app_size.dart';
import '../utilities/values/app_strings.dart';

class BikeDetailsScreen extends StatefulWidget {
  final int id;

  const BikeDetailsScreen({super.key, required this.id});

  @override
  State<BikeDetailsScreen> createState() => _BikeDetailsScreenState();
}

class _BikeDetailsScreenState extends State<BikeDetailsScreen> {
  late BikeModel details;

  @override
  void initState() {
    details =
        BikeDetailsManager.getInstance(context: context, id: widget.id).details;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bikeDetails),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        children: [
          // bike image
          Image.memory(
            base64Decode(
              const Base64Codec().normalize(details.image!),
            ),
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          AppSize.gapH40,

          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const CustomGridFixedHeightDelegate(
              crossAxisCount: 2,
              height: 120,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
// details
              // name
              _detailsContainer(
                title: AppStrings.name,
                details: details.name!,
              ),

              // brand name
              _detailsContainer(
                title: AppStrings.brandName,
                details: details.brandName!,
              ),

              // cc
              _detailsContainer(
                title: AppStrings.cc,
                details: details.cc.toString(),
              ),

              // gears
              _detailsContainer(
                title: AppStrings.gears,
                details: details.gears.toString(),
              ),

              // max power
              _detailsContainer(
                title: AppStrings.maxPower,
                details: details.maxPower!,
              ),

              // max torque
              _detailsContainer(
                title: AppStrings.maxTorque,
                details: details.maxTorque!,
              ),

              // mileage
              _detailsContainer(
                title: AppStrings.mileage,
                details: details.mileage!,
              ),

              // fuel tank capacity
              _detailsContainer(
                title: AppStrings.fuelTankCapacity,
                details: details.fuelTankCapacity.toString(),
              ),

              // engine oil capacity
              _detailsContainer(
                title: AppStrings.engineOilCapacity,
                details: details.engineOilCapacity.toString(),
              ),

              // seat height
              _detailsContainer(
                title: AppStrings.seatHeight,
                details: details.seatHeight.toString(),
              ),

              // front suspension
              _detailsContainer(
                title: AppStrings.frontSuspension,
                details: details.frontSuspension!,
              ),

              // rear suspension
              _detailsContainer(
                title: AppStrings.rearSuspension,
                details: details.rearSuspension!,
              ),

              // front break
              _detailsContainer(
                title: AppStrings.frontBreak,
                details: details.frontBreak!,
              ),

              // rear break
              _detailsContainer(
                title: AppStrings.rearBreak,
                details: details.rearBreak!,
              ),

              // front wheel
              _detailsContainer(
                title: AppStrings.frontWheel,
                details: details.frontWheel!,
              ),

              // rear wheel
              _detailsContainer(
                title: AppStrings.rearWheel,
                details: details.rearBreak!,
              ),

              // front tyre
              _detailsContainer(
                title: AppStrings.frontTyre,
                details: details.frontTyre!,
              ),

              // rear tyre
              _detailsContainer(
                title: AppStrings.rearTyre,
                details: details.rearTyre!,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailsContainer({required String title, required String details}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
