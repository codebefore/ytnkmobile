import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/common/phone.dart';
import 'package:ytnkio/models/common/social_account_info.dart';
import 'package:ytnkio/widgets/common/autocomplete_text_form_field.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';
import 'package:ytnkio/widgets/common/phone_form_field.dart';

class EditPersonalInfoPage extends StatefulWidget {
  static const id = "/pages/profile/edit_personal_info_page";

  const EditPersonalInfoPage({super.key});

  @override
  State<EditPersonalInfoPage> createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final countryController = TextEditingController();
  final cityControlller = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final linkedinController = TextEditingController();
  final githubController = TextEditingController();
  final xController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();

  late PhoneNumber phoneNumber;
  late Country country;
  late String initialCountryCode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _fillFormFields();
  }

  void _fillFormFields() {
    var profile = context.read<GlobalBloc>().state.profile;

    firstNameController.text = profile.firstName;
    lastNameController.text = profile.lastName;
    countryController.text = profile.location.country;
    cityControlller.text = profile.location.city;
    addressController.text = profile.location.address;

    country = countries.firstWhere(
        (element) =>
            element.dialCode ==
            (profile.phones.isEmpty
                ? GlobalConstants.countryCode
                : profile.phones[0].countrySuffix),
        orElse: () => countries.first);

    phoneNumber = PhoneNumber(
        countryISOCode: profile.phones.isEmpty
            ? GlobalConstants.countryCode
            : profile.phones[0].country,
        countryCode: profile.phones.isEmpty
            ? GlobalConstants.countryCode
            : profile.phones[0].country,
        number: profile.phones.isEmpty ? "" : profile.phones[0].number);

    initialCountryCode = profile.phones.isEmpty
        ? GlobalConstants.countryCode
        : profile.phones[0].country;

    phoneController.text =
        profile.phones.isEmpty ? "" : profile.phones[0].number;

    websiteController.text =
        profile.websites.isEmpty ? "" : profile.websites[0];

    if (profile.socialAccounts.isNotEmpty) {
      linkedinController.text = profile.socialAccounts
          .firstWhere((element) => element.accountType == 'linkedin',
              orElse: () => SocialAccountInfo(
                  accountType: 'linkedin', url: '', userName: ''))
          .url;

      githubController.text = profile.socialAccounts
          .firstWhere((element) => element.accountType == 'github',
              orElse: () => SocialAccountInfo(
                  accountType: 'github', url: '', userName: ''))
          .url;

      xController.text = profile.socialAccounts
          .firstWhere((element) => element.accountType == 'x',
              orElse: () =>
                  SocialAccountInfo(accountType: 'x', url: '', userName: ''))
          .url;

      facebookController.text = profile.socialAccounts
          .firstWhere((element) => element.accountType == 'facebook',
              orElse: () => SocialAccountInfo(
                  accountType: 'facebook', url: '', userName: ''))
          .url;

      instagramController.text = profile.socialAccounts
          .firstWhere((element) => element.accountType == 'instagram',
              orElse: () => SocialAccountInfo(
                  accountType: 'instagram', url: '', userName: ''))
          .url;
    }
  }

  @override
  void didUpdateWidget(covariant EditPersonalInfoPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    _fillFormFields();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    countryController.dispose();
    cityControlller.dispose();
    addressController.dispose();
    phoneController.dispose();
    websiteController.dispose();
    linkedinController.dispose();
    githubController.dispose();
    xController.dispose();
    facebookController.dispose();
    instagramController.dispose();

    super.dispose();
  }

  SocialAccountInfo? buildSocialAccountInfo(String type, String url) {
    if (url.isEmpty) {
      return null;
    }

    var uri = Uri.tryParse(url);

    if (uri == null) {
      return null;
    }

    return SocialAccountInfo(
        accountType: type,
        url: url,
        userName: uri.pathSegments.isNotEmpty ? uri.pathSegments.last : "");
  }

  void save() {
    if (_formKey.currentState!.validate()) {
      var linkedinAccount =
          buildSocialAccountInfo("linkedin", linkedinController.text);
      var githubAccount =
          buildSocialAccountInfo("github", githubController.text);
      var xAccount = buildSocialAccountInfo("x", xController.text);
      var facebookAccount =
          buildSocialAccountInfo("facebook", facebookController.text);
      var instagramAccount =
          buildSocialAccountInfo("instagram", instagramController.text);

      context.read<GlobalBloc>().add(UpdatePersonalInfoEvent(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          country: countryController.text,
          city: cityControlller.text,
          address: addressController.text,
          phone: Phone(
            country: country.code,
            countrySuffix: country.dialCode,
            number: phoneNumber.number,
          ),
          website: websiteController.text,
          linkedin: linkedinAccount,
          github: githubAccount,
          x: xAccount,
          facebook: facebookAccount,
          instagram: instagramAccount));
    }
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your country';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your city';
    }
    return null;
  }

  String? validatePhoneNumber(PhoneNumber? phoneNumber) {
    if (phoneNumber == null) {
      return 'Please enter your phone number';
    }

    if (phoneNumber.number.isEmpty) {
      return 'Please enter your phone number';
    }

    if (phoneNumber.countryCode.isEmpty) {
      return 'Please select your country';
    }

    return null;
  }

  String? webSiteValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  String? validateLinkedInPersonal(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }
    if (!uri.path.contains('linkedin.com') &&
        !uri.origin.contains('linkedin.com')) {
      return 'URL must be from linkedin.com';
    }
    if (uri.pathSegments.isEmpty ||
        !uri.pathSegments.any((element) => element == "in")) {
      return 'LinkedIn personal profiles must start with "/in/"';
    }
    return null;
  }

  String? validateGithubPersonal(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }
    if (!uri.path.contains('github.com') &&
        !uri.origin.contains('github.com')) {
      return 'URL must be from github.com';
    }
    if (uri.pathSegments.isEmpty || uri.pathSegments.first.isEmpty) {
      return 'GitHub personal profiles must include your username';
    }
    return null;
  }

  String? validateXPersonal(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }
    if (!uri.path.contains('x.com') && !uri.origin.contains('x.com')) {
      return 'URL must be from x.com';
    }
    if (uri.pathSegments.isEmpty || uri.pathSegments.first.isEmpty) {
      return 'X personal profiles must include your username';
    }
    return null;
  }

  String? validateFacebookPersonal(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }
    if (!uri.path.contains('facebook.com') &&
        !uri.origin.contains('facebook.com')) {
      return 'URL must be from facebook.com';
    }
    if (uri.pathSegments.isEmpty) {
      return 'Facebook URL must contain a username or profile indicator';
    }
    if (uri.pathSegments.first == 'profile.php') {
      if (!uri.queryParameters.containsKey('id') ||
          uri.queryParameters['id']!.isEmpty) {
        return 'Facebook personal profile URL must contain an id parameter';
      }
    } else {
      if (uri.pathSegments.first.toLowerCase() == 'pages') {
        return 'Please provide a personal profile URL, not a page URL';
      }
    }
    return null;
  }

  String? validateInstagramPersonal(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid URL';
    }

    if (!uri.path.contains('instagram.com') &&
        !uri.origin.contains('instagram.com')) {
      return 'URL must be from instagram.com';
    }

    if (uri.pathSegments.isEmpty || uri.pathSegments.first.isEmpty) {
      return 'Instagram personal profiles must contain a username';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITPERSONALINFO_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isFailure) {
              EasyLoading.showError(state.infoMessage);
            } else {
              Navigator.of(context).pop();
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextFormField(
                  controller: firstNameController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_firstNameHint,
                  labelText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_firstName,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_firstNameIcon,
                  keyboardType: TextInputType.text,
                  validator: validateFirstName,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: lastNameController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_lastNameHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_lastName,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_lastNameIcon,
                  keyboardType: TextInputType.text,
                  validator: validateLastName,
                ),
                const SizedBox(height: 10),
                AutocompleteTextFormField(
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_country,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_countryHint,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_countryIcon,
                  keyboardType: TextInputType.text,
                  searchList: "countries",
                  controller: countryController,
                ),
                const SizedBox(height: 10),
                AutocompleteTextFormField(
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_city,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_cityHint,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_cityIcon,
                  keyboardType: TextInputType.text,
                  searchList: "cities",
                  controller: cityControlller,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                    controller: addressController,
                    helperText:
                        GlobalTexts.current.EDITPERSONALINFO_PAGE_addressHint,
                    labelText:
                        GlobalTexts.current.EDITPERSONALINFO_PAGE_address,
                    icon: GlobalIcons.EDITPERSONALINFO_PAGE_addressIcon,
                    keyboardType: TextInputType.streetAddress),
                const SizedBox(height: 10),
                PhoneFormField(
                  controller: phoneController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_phoneHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_phone,
                  icon: GlobalIcons.GENERAL_phoneIcon,
                  onChanged: (PhoneNumber newValue) => phoneNumber = newValue,
                  onCountryChanged: (Country newValue) => country = newValue,
                  initialCountryCode: initialCountryCode,
                  validator: validatePhoneNumber,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: websiteController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_websiteHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_website,
                  icon: GlobalIcons.GENERAL_websiteIcon,
                  keyboardType: TextInputType.url,
                  validator: webSiteValidator,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: linkedinController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_linkedinHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_linkedin,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_linkedinIcon,
                  keyboardType: TextInputType.text,
                  validator: validateLinkedInPersonal,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: githubController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_githubHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_github,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_githubIcon,
                  keyboardType: TextInputType.url,
                  validator: validateGithubPersonal,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: xController,
                  helperText: GlobalTexts.current.EDITPERSONALINFO_PAGE_xHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_x,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_xIcon,
                  keyboardType: TextInputType.url,
                  validator: validateXPersonal,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: facebookController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_facebookHint,
                  labelText: GlobalTexts.current.EDITPERSONALINFO_PAGE_facebook,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_facebookIcon,
                  keyboardType: TextInputType.url,
                  validator: validateFacebookPersonal,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: instagramController,
                  helperText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_instagramHint,
                  labelText:
                      GlobalTexts.current.EDITPERSONALINFO_PAGE_instagram,
                  icon: GlobalIcons.EDITPERSONALINFO_PAGE_instagramIcon,
                  keyboardType: TextInputType.url,
                  validator: validateInstagramPersonal,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultElevatedButton(
                      isProcessing: state.isProcessing,
                      icon: GlobalIcons.GENERAL_saveIcon,
                      label: GlobalTexts.current.EDITPERSONALINFO_PAGE_save,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
