import 'package:flutter/material.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  final bool isDelete;
  final int? customerId;
  const SignOutConfirmationDialog(
      {Key? key, this.isDelete = false, this.customerId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        isDelete
            ? Padding(
                padding:
                    const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
                child: SizedBox(
                    width: Dimensions.iconSizeDefault,
                    child: Image.asset(Images.delete)),
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge, vertical: 50),
          child: Text('Sign Out',
              style: robotoRegular, textAlign: TextAlign.center),
        ),
        const Divider(height: 0, color: ColorResources.hintTextColor),
        Row(children: [
          Expanded(
              child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: Text('Yes',
                  style: titilliumBold.copyWith(
                      color: Theme.of(context).primaryColor)),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: ColorResources.red,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10))),
              child: Text('No',
                  style: titilliumBold.copyWith(color: ColorResources.white)),
            ),
          )),
        ]),
      ]),
    );
  }
}
