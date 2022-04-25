import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'constants.dart';

class PulseLogic extends GetxController {
  static PulseLogic get to => Get.find();

  final pulseList = List.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPulses();
  }

  Future<void> fetchPulses() async {
    firestore
        .collection('pulses')
        .orderBy('time', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      pulseList.value = querySnapshot.docs;
    });
    update();
  }

  Future<void> addReport(String report, Timestamp time, String uid) async {
    SmartDialog.showLoading();
    await firestore
        .collection('reports')
        .add({'uid': uid, 'report': report, 'time': time})
        .then((value) => SmartDialog.dismiss().then((value) =>
            SmartDialog.showToast(
                'Thank you for your report, we will review this pulse as soon as possible',
                time: Duration(milliseconds: 3000))))
        .catchError((error) => print("Failed to send pulse: $error"));

    update();
  }

  Future<void> addPulse(String category, String content, Timestamp time,
      bool blocked, String uid) async {
    SmartDialog.showLoading();
    await firestore
        .collection('pulses')
        .add({
          'uid': uid,
          'category': category,
          'content': content,
          'likes': FieldValue.arrayUnion([uid]),
          'time': time,
          'blocked': blocked
        })
        .then((value) => SmartDialog.dismiss()
            .then((value) => SmartDialog.showToast('Pulse sent')))
        .catchError((error) => print("Failed to send pulse: $error"));

    update();
  }

  Future<void> addLike(String uid, String pulseId) async {
    SmartDialog.showLoading();
    await firestore
        .collection('pulses')
        .doc(pulseId)
        .update({
          'likes': FieldValue.arrayUnion([uid]),
        })
        .then((value) => SmartDialog.dismiss()
            .then((value) => SmartDialog.showToast('I like it !')))
        .catchError((error) => print("Failed to add like: $error"));
  }

  Future<void> removeLike(String uid, String pulseId) async {
    SmartDialog.showLoading();
    await firestore
        .collection('pulses')
        .doc(pulseId)
        .update({
          'likes': FieldValue.arrayRemove([uid]),
        })
        .then((value) => SmartDialog.dismiss()
            .then((value) => SmartDialog.showToast('Forget about it !')))
        .catchError((error) => print("Failed to remove like: $error"));
  }
}
