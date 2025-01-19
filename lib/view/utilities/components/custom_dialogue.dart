/*
* Created by Neloy on 19 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';

import '../values/app_size.dart';
import '../values/app_strings.dart';
import 'custom_loader.dart';

class CustomDialogue {
  static loading({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            Text(
              AppStrings.wait,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            AppSize.gapH20,
            const MyLoader(),
          ],
        ),
      ),
    );
  }

  static simple({
    required BuildContext context,
    required void Function()? onPressed,
    required IconData icon,
    required String message,
    required String buttonText,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.black,
            ),
            AppSize.gapH20,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            AppSize.gapH20,
            MaterialButton(
              height: 50,
              elevation: 0,
              onPressed: onPressed,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static decision({
    required BuildContext context,
    required void Function()? onPressed,
    required IconData icon,
    required String message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.black,
            ),
            AppSize.gapH20,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            AppSize.gapH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 50,
                    elevation: 0,
                    onPressed: onPressed,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      AppStrings.yes,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                AppSize.gapW20,
                Expanded(
                  child: MaterialButton(
                    height: 50,
                    elevation: 0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppStrings.no,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}