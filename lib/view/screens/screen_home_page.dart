/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:bike_hub/managers/manager_bike_list.dart';
import 'package:bike_hub/network/models/model_bike.dart';
import 'package:bike_hub/view/screens/scrren_add_new_bike_request.dart';
import 'package:bike_hub/view/utilities/values/app_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../managers/manager_bike_details.dart';
import '../utilities/components/custom_Dialogue.dart';
import '../utilities/components/custom_text_field.dart';
import '../utilities/values/app_size.dart';
import '../utilities/values/app_strings.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<BikeModel> bikeList = [];
  List<BikeModel> finalBikeList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    finalBikeList =
        bikeList = BikeListManager.getInstance(context: context).bikes;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (isPop) async {
        return await CustomDialogue.decision(
          context: context,
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: Icons.dangerous_outlined,
          message: AppStrings.doYouWantToExitApp,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.bikes),
        ),
        floatingActionButton: MaterialButton(
          elevation: 0,
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => const AddNewBikeRequestScreen(),
              ),
            );
          },
          color: Colors.black,
          child: Text(
            AppStrings.addRequest,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(25),
          children: [
            // search field
            CustomTextField.get(
                context: context,
                controller: searchController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                hint: AppStrings.bikeNameExample,
                label: AppStrings.bikeName,
                prefixWidget: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  final tempBikeList = bikeList.where((element) {
                    final bikeTextLowerCase = element.name!.toLowerCase();
                    final search = value.toLowerCase();
                    return bikeTextLowerCase.contains(search);
                  }).toList();
                  setState(() {
                    finalBikeList = tempBikeList;
                  });
                }),
            AppSize.gapH40,

            // bike list
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: finalBikeList.length,
                itemBuilder: (context, index) {
                  return _elementBike(bike: finalBikeList[index]);
                }),
            AppSize.gapH60,
          ],
        ),
      ),
    );
  }

  Widget _elementBike({required BikeModel bike}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BikeDetailsManager.getInstance(
              context: context,
              id: bike.id!,
            ).connection();
          },
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                image: bike.image!.isEmpty || bike.image == null
                    ? const AssetImage(AppImagePath.cover)
                    : MemoryImage(
                        base64Decode(
                          const Base64Codec().normalize(bike.image!),
                        ),
                      ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      bike.name!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      bike.brandName!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: AppStrings.fontRegular,
                          ),
                    ),
                  ],
                )),
          ),
        ),
        AppSize.gapH20,
      ],
    );
  }
}
