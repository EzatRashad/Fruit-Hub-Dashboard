import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';


class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    try {
      if (docId != null) {
        await _firestore.collection(path).doc(docId).set(data);
      } else {
        await _firestore.collection(path).add(data);
      }
    } catch (e) {
      log('Error adding user data: ${e.toString()}');
      throw Exception('Error adding user data: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String docId, required String path}) async {
    try {
      var data = await _firestore.collection(path).doc(docId).get();
      return data.data() as Map<String, dynamic>;
    } catch (e) {
      log('Error fetching user data: ${e.toString()}');
      throw Exception('Error fetching user data: ${e.toString()}');
    }
  }

  @override
  Future<bool> checkDataExists(
      {required String docId, required String path}) async {
    try {
      var doc = await _firestore.collection(path).doc(docId).get();
      return doc.exists;
    } catch (e) {
      log('Error checking if user data exists: ${e.toString()}');
      throw Exception('Error checking if user data exists: ${e.toString()}');
    }
  }
}
