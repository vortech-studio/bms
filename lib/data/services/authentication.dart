import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationService extends GetxService {
  FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage box = GetStorage();

  late String verificationId;
  int? resendToken;

  Future<AuthenticationService> init() async {
    return this;
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        box.write(
          'isNewUser',
          userCredential.additionalUserInfo!.isNewUser,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        throw Exception(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        this.resendToken = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  Future verifySmsCode(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential = await auth.signInWithCredential(credential);
    box.write(
      'isNewUser',
      userCredential.additionalUserInfo!.isNewUser,
    );
  }

  Future<ConfirmationResult> webVerifyPhoneNumber(String phoneNumber) async {
    ConfirmationResult confirmationResult =
        await auth.signInWithPhoneNumber(phoneNumber);
    return confirmationResult;
  }

  Future webVerifySmsCode(
      ConfirmationResult confirmationResult, String verificationCode) async {
    UserCredential userCredential =
        await confirmationResult.confirm(verificationCode);
    box.write(
      'isNewUser',
      userCredential.additionalUserInfo!.isNewUser,
    );
  }
}
