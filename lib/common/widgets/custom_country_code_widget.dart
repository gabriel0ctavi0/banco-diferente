import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/features/splash/controllers/splash_controller.dart';

class CustomCountryCodeWidget extends StatelessWidget {
  final ValueChanged<CountryCode> onChanged;
  final ValueChanged<CountryCode?>? onInit;
  final String? initSelect;
  const CustomCountryCodeWidget(
      {Key? key, required this.onChanged, this.initSelect, this.onInit})
      : super(key: key);

  static String? getCountryCode(String? number) {
    String? countryCode = '';
    try {
      countryCode = codes.firstWhere(
          (item) => number!.contains('${item['dial_code']}'))['dial_code'];
    } catch (error) {
      debugPrint('country error: $error');
    }
    return countryCode;
  }

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      dialogBackgroundColor: Theme.of(context).canvasColor,
      padding: EdgeInsets.zero,
      onChanged: onChanged,
      onInit: onInit,
      showDropDownButton: false,
      enabled: false,
      initialSelection: '+55',
      favorite: const ['BR'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      showFlag: false,
    );
  }
}
