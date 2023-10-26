import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static String verifyId = "";
  // to sent and otp to user
  static Future sentOtp({
    required String phone,
    required Function errorStep,
    required Function(String verifyID) nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: "+88$phone",
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  // verify the otp code and login
  static Future<void> signIn(
      {required String otp,
      required Function(String error) errorStep,
      required Function nextStep,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verifyId,
            smsCode: otp,
          ))
          .then((value) => nextStep());
    } on FirebaseAuthException catch (e) {
      errorStep(e.message.toString());
    } catch (e) {
      print('error is $e');
    }
  }

  //google sign in using firebase
  static Future<void> googleSignIn(
      {required Function(String error) errorStep,
      required Function nextStep}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      nextStep();
    } on FirebaseAuthException catch (e) {
      errorStep(e.message.toString());
    } catch (e) {
      print('error is $e');
    }
  }

  // check whether the user is logged in or not
  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
