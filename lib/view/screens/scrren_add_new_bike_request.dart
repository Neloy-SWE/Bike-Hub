/*
* Created by Neloy on 21 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/managers/manager_add_new_bike_request.dart';
import 'package:bike_hub/view/utilities/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../utilities/components/custom_text_field.dart';
import '../utilities/values/app_size.dart';

class AddNewBikeRequestScreen extends StatefulWidget {
  const AddNewBikeRequestScreen({super.key});

  @override
  State<AddNewBikeRequestScreen> createState() =>
      _AddNewBikeRequestScreenState();
}

class _AddNewBikeRequestScreenState extends State<AddNewBikeRequestScreen> {
  final _addNewBikeRequestKey = GlobalKey<FormState>();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController modelNameController = TextEditingController();

  @override
  void dispose() {
    brandNameController.dispose();
    modelNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addNewBikeRequest),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Container(
            height: 300,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _addNewBikeRequestKey,
                  child: Column(
                    children: [
                      // brand name
                      CustomTextField.get(
                        context: context,
                        controller: brandNameController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        label: AppStrings.brandName,
                        hint: AppStrings.brandNameExample,
                        validatorFunction: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return AppStrings.emptyField;
                          }
                        },
                      ),
                      AppSize.gapH20,

                      // model
                      CustomTextField.get(
                        context: context,
                        controller: modelNameController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        label: AppStrings.modelName,
                        hint: AppStrings.bikeNameExample,
                        validatorFunction: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return AppStrings.emptyField;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    onPressed: () {
                      if (_addNewBikeRequestKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        AddNewBikeRequestManager.getInstance(
                          context: context,
                          brand: brandNameController.text,
                          model: modelNameController.text,
                        ).connection();
                      }
                    },
                    color: Colors.black,
                    child: Text(
                      AppStrings.add,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
