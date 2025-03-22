import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:numattendance/models/major_model.dart';

class AuthController extends GetxController {
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Future<void> registerUserWithEmail() async {
  //   try {
  //     final userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: "email",
  //       password: "password",
  //     );
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //   }
  // }

  Future<List<MajorModel>> getMajorById(String? id) async {
    List<MajorModel> majorList = [];

    try {
      final major = await FirebaseFirestore.instance
          .collection("major")
          .where("name", isEqualTo: id) // Search by field name
          .get();
      majorList = major.docs
          .map((element) => MajorModel.fromJson(element.data()))
          .toList();

      return majorList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failure with error '${e.code}' : '${e.message}'");
      }
      return majorList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MajorModel>> getList({int? offset}) async {
    List<MajorModel> majorList = [];

    try {
      final major = await FirebaseFirestore.instance.collection("major").get();
      majorList = major.docs
          .map((element) => MajorModel.fromJson(element.data()))
          .toList();
      return majorList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failure with error '${e.code}' : '${e.message}'");
      }
      return majorList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
