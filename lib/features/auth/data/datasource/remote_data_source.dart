import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/core/error/exciption.dart';
import 'package:grocery_app/core/global/constants.dart';

abstract class AuthRemoteDataSource {
  Future<String> signInPhone(String phoneNumber);
  Future<UserCredential> otpVerify(String verfyId, String otpVerfy);
  Future<UserCredential> SignInbyGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);
  @override
  Future<String> signInPhone(String phoneNumber) async {
    // String verification = '';
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          otpVerify(phoneAuthCredential.verificationId ?? '',
              phoneAuthCredential.smsCode ?? '');
          // await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            throw PhoneNumberWrongException();
          } else {
            throw ServerException();
          }
        },
        codeSent: (verificationId, forceResendingToken) async {
          veficationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      return veficationId;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<UserCredential> otpVerify(String verfyId, String otpVerfy) async {
    try {
      final response = await firebaseAuth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verfyId, smsCode: otpVerfy));
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('users');
      collectionReference.doc(response.user!.uid).set({
        'uid': response.user!.uid,
        'name': response.user!.displayName,
        'phone': response.user!.phoneNumber,
      });
      return response;
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<UserCredential> SignInbyGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential usercredential =
        await firebaseAuth.signInWithCredential(credential);
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    collectionReference.doc(usercredential.user!.uid).set({
      'uid': usercredential.user!.uid,
      'name': usercredential.user!.displayName,
      'email': usercredential.user!.email,
    });

    // Once signed in, return the UserCredential
    return usercredential;
  }
}
