import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';

class PhoneFormField extends StatelessWidget {
  final TextEditingController controller;
  final String helperText;
  final String labelText;
  final IconData icon;
  final Function(PhoneNumber) onChanged;
  final Function(Country) onCountryChanged;
  final String? initialCountryCode;
  final String? Function(PhoneNumber?)? validator;

  const PhoneFormField({
    super.key,
    required this.controller,
    required this.helperText,
    required this.labelText,
    required this.icon,
    required this.onChanged,
    required this.onCountryChanged,
    this.initialCountryCode,
    this.validator,
  });

  @override
  Widget build(context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        icon: Icon(icon, color: GlobalConstants.defaultTextColor),
        helperText: helperText,
        labelText: labelText,
      ),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: InputDecoration(
          hintText: GlobalTexts.current.PHONE_FORM_FIELD_searchText,
        ),
      ),
      languageCode: GlobalConstants.defaultLanguageCode,
      initialCountryCode: initialCountryCode ?? GlobalConstants.countryCode,
      countries: GlobalConstants.selectableCountries,
      invalidNumberMessage:
          GlobalTexts.current.PHONE_FORM_FIELD_invalidNumberMessage,
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
      controller: controller,
      validator: validator,
      disableLengthCheck: false,
    );
  }
}
