import 'package:agricos/screens/after_login_page.dart';
import 'package:agricos/screens/otp_code.dart';
import 'package:agricos/utils/custom_widget/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String verifyId = "";

  Future<void> firebaseLogIN({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        isLoading.value = false;
        Get.offAll(() => const AfterLoginPage());
      });
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      print('error is ${e.code}');
      if (e.code == 'user-not-found') {
        customToast(msg: 'No user found for that email.', isError: true);
      } else if (e.code == 'wrong-password') {
        customToast(
            msg: 'Wrong password provided for that user.', isError: true);
      } else {
        customToast(msg: 'Invalid Login Credentials', isError: true);
      }
    } catch (e) {
      isLoading.value = false;
      print('error is $e');
    }
  }

  // to sent and otp to user
  Future sentOtp({
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await _firebaseAuth
          .verifyPhoneNumber(
              timeout: const Duration(seconds: 60),
              phoneNumber: "+88$phone",
              verificationCompleted: (phoneAuthCredential) async {
                isLoading.value = false;
                return;
              },
              verificationFailed: (error) async {
                isLoading.value = false;
                print('error is $error');
                return;
              },
              codeSent: (verificationId, forceResendingToken) async {
                isLoading.value = false;
                verifyId = verificationId;
                Get.to(() => OtpCodeScreen(
                    verificationId: verifyId,
                    phone: phone,
                    email: email,
                    password: password));
              },
              codeAutoRetrievalTimeout: (verificationId) async {
                isLoading.value = false;
                return;
              })
          .onError((error, stackTrace) {
        isLoading.value = false;
        print('error is $error');
        customToast(msg: 'Error in sending otp', isError: true);
      });
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'credential-already-in-use') {
        customToast(msg: 'The account already exists', isError: true);
      }
      print('error is $e');
    } catch (e) {
      isLoading.value = false;
      customToast(msg: 'Error in sending otp', isError: true);
      print('error is $e');
    }
  }

  // verify the otp code and login
  Future<void> verifyOtp(
      {required String otp,
      required String email,
      required String password}) async {
    try {
      isLoading.value = true;
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: otp,
      ))
          .then((value) {
        isLoading.value = false;
        Get.offAll(() => const AfterLoginPage());
      });
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      customToast(msg: e.message.toString(), isError: true);
    } catch (e) {
      isLoading.value = false;
      print('error is $e');
    }
  }

  //google sign in using firebase
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential).then((value) {
        Get.offAll(() => const AfterLoginPage());
      });
    } on FirebaseAuthException catch (e) {
      customToast(msg: e.message.toString(), isError: true);
    } catch (e) {
      print('error is $e');
    }
  }

  // check whether the user is logged in or not
  Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
