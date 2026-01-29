import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/widgets/auth/already_have_an_account_section.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';
import 'package:ytnkio/widgets/common/phone_form_field.dart';

class SignupPage extends StatefulWidget {
  static const id = "/pages/auth/signup_with_email_page";

  final AuthUserInfo? user;

  const SignupPage({super.key, this.user});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController refCodeController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

  late PhoneNumber phoneNumber;
  late Country country;

  late bool isSocialAccount;
  late String socialName;
  late String socialEmail;

  @override
  void initState() {
    super.initState();

    country = GlobalConstants.selectableCountries.firstWhere((element) {
      return element.code == GlobalConstants.countryCode;
    });

    if (widget.user != null) {
      isSocialAccount = true;
      socialEmail = widget.user!.email;
      socialName = "${widget.user!.name} ${widget.user!.surname}";
    } else {
      isSocialAccount = false;

      socialEmail = "";
      socialName = "";
    }

    if (isSocialAccount) {
      emailController.text = socialEmail;
      fullNameController.text = socialName;
    }
  }

  (bool, String) validateRefCode() {
    if (refCodeController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_invalidReferenceCode);
    }

    return (true, "");
  }

  (bool, String) validateFullName() {
    if (fullNameController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_fullNameMustBeFilled);
    }

    if (fullNameController.text.split(" ").length < 2) {
      return (
        false,
        GlobalTexts.current.SIGNUP_PAGE_fullNameMustContainFirstAndLast
      );
    }

    return (true, "");
  }

  (bool, String) validateEmail() {
    if (emailController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_emailMustBeFilled);
    }

    if (!emailController.text.contains("@")) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_emailIsNotValid);
    }

    if (!emailController.text.contains(".")) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_emailIsNotValid);
    }

    return (true, "");
  }

  (bool, String) validatePhone() {
    if (phoneController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_phoneMustBeFilled);
    }

    //PHONE WIDGET VALIDATES PHONE NUMBER ACCORDING TO COUNTRY CODE
    //SO NO NEED TO VALIDATE HERE
    // if (phoneController.text.length < 10) {
    //   return (false, "Phone number is not valid");
    // }

    return (true, "");
  }

  (bool, String) validateLocation() {
    if (locationController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_locationMustBeFilled);
    }

    if (locationController.text.length < 5) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_locationIsNotValid);
    }

    return (true, "");
  }

  (bool, String) validatePassword() {
    if (passwordController.text.isEmpty) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_passwordMustBeFilled);
    }

    if (passwordController.text.length < 6) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_passwordIsNotValid);
    }

    if (passwordController.text != passwordAgainController.text) {
      return (false, GlobalTexts.current.SIGNUP_PAGE_passwordNotMatching);
    }

    return (true, "");
  }

  (bool, String) validateAll() {
    final (bool, String) refCode = validateRefCode();
    final (bool, String) fullName = validateFullName();
    final (bool, String) email = validateEmail();
    final (bool, String) phone = validatePhone();
    final (bool, String) location = validateLocation();
    final (bool, String) password =
        isSocialAccount ? (true, "") : validatePassword();

    if (!refCode.$1) {
      return refCode;
    }

    if (!fullName.$1) {
      return fullName;
    }

    if (!email.$1) {
      return email;
    }

    if (!phone.$1) {
      return phone;
    }

    if (!location.$1) {
      return location;
    }

    if (!password.$1) {
      return password;
    }

    return (true, "");
  }

  void showMessage(message) {
    EasyLoading.showToast(message);
  }

  onChanged(PhoneNumber phoneNumber) {
    this.phoneNumber = phoneNumber;
    //print(phone.completeNumber);
  }

  onCountryChanged(Country country) {
    this.country = country;
    //print('Country changed to: ' + country.name);
  }

  void createMyAccount(BuildContext context, GlobalState state) {
    final (bool, String) validationResult = validateAll();

    if (!validationResult.$1) {
      EasyLoading.showInfo(validationResult.$2);
      return;
    }

    context.read<GlobalBloc>().add(
          SignupEvent(
            referenceCode: refCodeController.text,
            fullName: fullNameController.text,
            email: emailController.text,
            countryCode: country.code,
            countryName: country.name,
            phone: phoneNumber.number,
            location: locationController.text,
            password: passwordController.text,
            isSocial: isSocialAccount,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isNaked: true,
      title: GlobalTexts.current.SIGNUP_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isSuccessful) {
              EasyLoading.showSuccess(
                  GlobalTexts.current.SIGNUP_PAGE_signupSuccess);
              context.read<GlobalBloc>().add(LogoutEvent());
              context.go(LoginPage.id);
              return;
            }

            if (state.isFailure) {
              EasyLoading.showError(
                  "${GlobalTexts.current.SIGNUP_PAGE_signupFailed} ${state.infoMessage}");
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: refCodeController,
                    helperText: "",
                    labelText: GlobalTexts.current.SIGNUP_PAGE_referenceCode,
                    icon: GlobalIcons.GENERAL_codeIcon,
                    keyboardType: TextInputType.text,
                  ),
                  DefaultTextFormField(
                    controller: fullNameController,
                    helperText: "",
                    labelText: GlobalTexts.current.SIGNUP_PAGE_fullName,
                    icon: GlobalIcons.GENERAL_usernameIcon,
                    keyboardType: TextInputType.text,
                    enabled: !isSocialAccount,
                  ),
                  DefaultTextFormField(
                    controller: emailController,
                    helperText: "",
                    labelText: GlobalTexts.current.SIGNUP_PAGE_email,
                    icon: GlobalIcons.GENERAL_emailIcon,
                    keyboardType: TextInputType.text,
                    enabled: !isSocialAccount,
                  ),
                  PhoneFormField(
                    controller: phoneController,
                    helperText: "",
                    labelText: GlobalTexts.current.SIGNUP_PAGE_phone,
                    icon: GlobalIcons.GENERAL_phoneIcon,
                    onChanged: onChanged,
                    onCountryChanged: onCountryChanged,
                  ),
                  DefaultTextFormField(
                    controller: locationController,
                    helperText: "",
                    labelText: GlobalTexts.current.SIGNUP_PAGE_location,
                    icon: GlobalIcons.GENERAL_locationIcon,
                    keyboardType: TextInputType.text,
                  ),
                  !isSocialAccount
                      ? DefaultTextFormField(
                          controller: passwordController,
                          helperText: "",
                          labelText: GlobalTexts.current.SIGNUP_PAGE_password,
                          icon: GlobalIcons.GENERAL_passwordIcon,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  !isSocialAccount
                      ? DefaultTextFormField(
                          controller: passwordAgainController,
                          helperText: "",
                          labelText:
                              GlobalTexts.current.SIGNUP_PAGE_passwordAgain,
                          icon: GlobalIcons.GENERAL_passwordIcon,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  DefaultElevatedButton(
                    isProcessing: state.isProcessing,
                    icon: GlobalIcons.GENERAL_addIcon,
                    label: GlobalTexts.current.SIGNUP_PAGE_createAccount,
                    onPressed: () {
                      createMyAccount(context, state);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const AlreadyHaveAnAccountSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
