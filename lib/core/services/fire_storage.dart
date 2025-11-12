import 'dart:io';
import 'package:path/path.dart' as b;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:frut_hub_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    Reference fileRef = storageReference.child('$path/$fileName.$extensionName');
    await fileRef.putFile(file);
    String downloadUrl = await fileRef.getDownloadURL();
    return downloadUrl;
  }
}
