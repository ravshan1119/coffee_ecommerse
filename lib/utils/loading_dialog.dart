import 'package:coffee_ecommerse/utils/custom_circular.dart';
import 'package:flutter/material.dart';


void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child: const Center(
            child: SizedBox(
              height: 70.0,
              width: 70.0,
              child: CustomCircularProgressIndicator(strokeWidth: 6,),
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext? dialogContext}) async {
  if (dialogContext != null) Navigator.pop(dialogContext);
}
