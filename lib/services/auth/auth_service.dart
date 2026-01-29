import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/models/auth/verification_sent_info.dart';
import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/services/base/service_base.dart';

class AuthService extends ServiceBase {
  Future<ServiceResponse<AuthUserInfo>> loginWithEmailPassword(
      String email, String password) async {
    try {
      var isUserChecked = await checkUserEmail(email);

      if (!isUserChecked.isSuccess) {
        return ServiceResponse.fail("User not found");
      }

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return ServiceResponse.fail("User is null");
      }

      var verificationToken = await FirebaseAuth.instance.currentUser!
          .getIdToken(); //await credential.user!.getIdToken();

      var loginResponse = await login(verificationToken!, credential.user!.uid);

      if (!loginResponse.isSuccess) {
        return ServiceResponse.fail("Login unsuccessful");
      }

      final userInfo = AuthUserInfo.fromJson(loginResponse.responseObject);

      // final userInfo = AuthUserInfo(
      //   userId: credential.user!.uid,
      //   email: credential.user!.email ?? "",
      //   name: credential.user!.displayName ?? (credential.user!.email ?? ""),
      //   surname: "",
      // );

      return ServiceResponse.success(responseObject: userInfo);
    } catch (e) {
      return ServiceResponse.fail("Unknown exception: $e");
    }
  }

  Future<ServiceResponse<AuthUserInfo>> loginWithGoogle() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        return ServiceResponse.fail("Google sign in failed");
      }

      var checkUserCallResponse =
          await checkUserEmail(googleSignInAccount.email);

      if (!checkUserCallResponse.isSuccess) {
        return ServiceResponse.fail(checkUserCallResponse.message);
      }

      if (((checkUserCallResponse.responseObject ?? "false") == "false")) {
        return ServiceResponse.fail("User not found");
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      if (userCredential.user == null) {
        return ServiceResponse.fail("User credential is null.");
      }

      //var verificationToken = googleSignInAuthentication.idToken!;
      var verificationToken = await FirebaseAuth.instance.currentUser!
          .getIdToken(); //await credential.user!.getIdToken();

      var loginResponse =
          await login(verificationToken!, userCredential.user!.uid);

      if (!loginResponse.isSuccess) {
        return ServiceResponse.fail("Login unsuccessful");
      }

      final userInfo = AuthUserInfo.fromJson(loginResponse.responseObject);

      // final userInfo = AuthUserInfo(
      //   userId: userCredential.user!.uid,
      //   email: userCredential.user!.email!,
      //   name: "${userCredential.user!.displayName}",
      //   surname: "",
      // );

      return ServiceResponse.success(responseObject: userInfo);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return ServiceResponse.fail(
            "Firebase Exception: Account exist with different credential.");
      } else if (e.code == 'invalid-credential') {
        return ServiceResponse.fail("Firebase Exception: Invalid credential.");
      }

      return ServiceResponse.fail("Unknown Firebase Exception: $e");
    } catch (e) {
      return ServiceResponse.fail("Unknown Exception: $e");
    }
  }

  Future<ServiceResponse> login(String token, String uid) async {
    return postAPIRequest("talent/auth/login", {"token": token, "uid": uid},
        idToken: token);
  }

  Future<ServiceResponse> checkUserEmail(String email) async {
    return postAPIRequest("talent/auth/checkUserEmail", {"email": email});
  }

  Future<ServiceResponse> logout() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
      }

      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.signOut();
      }

      return ServiceResponse.success();
    } catch (e) {
      return ServiceResponse.fail("Unknown exception: $e");
    }
  }

  Future<ServiceResponse<AuthUserInfo>> loginWithGoogleOnly() async {
    try {
      //Logout first to prevent direct login with existing Google account if user is already logged in
      logout();

      final GoogleSignIn googleSignIn = GoogleSignIn();

      FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        return ServiceResponse.fail("Google sign in failed");
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      if (userCredential.user == null) {
        return ServiceResponse.fail("User credential is null.");
      }

      final userInfo = AuthUserInfo(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: "${userCredential.user!.displayName}",
        surname: "",
      );

      return ServiceResponse.success(responseObject: userInfo);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return ServiceResponse.fail(
            "Firebase Exception: Account exist with different credential.");
      } else if (e.code == 'invalid-credential') {
        return ServiceResponse.fail("Firebase Exception: Invalid credential.");
      }

      return ServiceResponse.fail("Unknown Firebase Exception: $e");
    } catch (e) {
      return ServiceResponse.fail("Unknown Exception: $e");
    }
  }

  Future<ServiceResponse<AuthUserInfo>> signup(
      referenceCode, fullName, email,
      countryCode, countryName, phone, location, password, isSocial, deviceId) async {
    try {
      // Step 1: Firebase Create User (Web ile tutarlı)
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        return ServiceResponse.fail("Firebase user creation failed");
      }

      final idToken = await credential.user!.getIdToken();

      // Step 2: Backend Signup
      final response = await postAPIRequest("talent/auth/signup", {
        "referenceCode": referenceCode,
        "fullName": fullName,
        "email": email,
        "countryCode": countryCode,
        "countryName": countryName,
        "phone": phone,
        "location": location,
        "password": password,
        "isSocial": isSocial,
        "deviceId": deviceId,
      }, idToken: idToken!);

      if (response.isSuccess && response.responseObject != null) {
        final userInfo = AuthUserInfo.fromJson(response.responseObject!);
        return ServiceResponse.success(responseObject: userInfo);
      } else {
        // Rollback: Delete Firebase user if backend signup fails
        try {
          await credential.user!.delete();
        } catch (e) {
          // Ignore delete error
        }
        return ServiceResponse.fail(response.message);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return ServiceResponse.fail("Email already in use.");
      } else if (e.code == 'weak-password') {
        return ServiceResponse.fail("Password is too weak.");
      } else if (e.code == 'invalid-email') {
        return ServiceResponse.fail("Invalid email address.");
      }
      return ServiceResponse.fail("Firebase error: ${e.message}");
    } catch (e) {
      return ServiceResponse.fail("Signup failed: $e");
    }
  }

  Future<ServiceResponse<void>> forgotPassword(String email) {
    return postAPIRequest("talent/auth/forgotPassword", {"email": email});
  }

  Future<ServiceResponse<VerificationSentInfo>> sendVerificationEmail(
      AuthUserInfo user) async {
    var response =
        await postAPIRequest("talent/auth/sendVerificationEmail", {"user": user.toMap()});

    if (response.isSuccess) {
      final verificationSentInfo = VerificationSentInfo.fromJson(
        response.responseObject!,
      );

      return ServiceResponse.success(responseObject: verificationSentInfo);
    }

    return ServiceResponse.fail(response.message);
  }

  Future<ServiceResponse<String>> verifyEmail(
      String syncCode, String verificationCode, String email, String userId) async {
    // Get fresh token to avoid expiration issues
    final freshToken = await getFreshIdToken();

    return postAPIRequest("talent/auth/verifyEmail", {
      "syncCode": syncCode,
      "verificationCode": verificationCode,
      "email": email,
      "userId": userId,
    }, idToken: freshToken);
  }
}
