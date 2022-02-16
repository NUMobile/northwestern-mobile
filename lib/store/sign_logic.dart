import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:thindek_ui/thindek_ui.dart';

import 'constants.dart';

class SignLogic extends GetxController {
  /// Find the instance globally
  static SignLogic get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  final userInfo = {}.obs;
  final isSigned = false.obs;
  final userId = ''.obs;

  Future<void> signUp(String email, String password) async {
    try {
      if (isEmail(email)) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        userId.value = userCredential.user!.uid;
        isSigned.value = true;
        firestore.collection('users').doc(userId.value).set({
          'name': email.substring(0, email.indexOf('@')),
          'blocked': false,
        });
        getUserInfo(userId.value);
        update();
        SmartDialog.showToast('Welcome');
      } else {
        SmartDialog.showToast('Not a valid Email Address');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SmartDialog.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SmartDialog.showToast('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userId.value = userCredential.user!.uid;
      isSigned.value = true;
      getUserInfo(userId.value);
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SmartDialog.showToast('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        SmartDialog.showToast('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> getCurrentUserId() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('SignController: User is currently signed out!');
      } else {
        userId.value = auth.currentUser!.uid;
        isSigned.value = true;
        update();
        print('getCurrentUserId:' + userId.value);
      }
    });
  }

  Future<void> getUserInfo(String userId) async {
    firestore
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        userInfo.value = data;
        print('getUserInfo:' + data['name']);
        update();
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> signOut() async {
    await auth.signOut();
    isSigned.value = false;
    update();
    SmartDialog.showToast('Logout Successfully');
  }

  Future<void> deleteUser() async {
    try {
      await auth.currentUser!.delete();
      SmartDialog.showToast('Alright, see you later');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}
