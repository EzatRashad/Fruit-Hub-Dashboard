import 'dart:io';

import 'package:frut_hub_dashboard/core/services/firebase_services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
import 'package:uuid/uuid.dart';

import '../../utils/keyes.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase supabase;
  static createBucket(String bucketName) async {
    // final response = await supabase.client.storage.listBuckets();

    // bool isBucketExists = false;

    // for (final bucket in response) {
    //   if (bucket.id == bucketName) {
    //     isBucketExists = true;
    //     break;
    //   }
    // }

    // if (!isBucketExists) {
    //   await supabase.client.storage.createBucket(bucketName);
    //   print("Bucket created: $bucketName");
    // } else {
    //   print("Bucket already exists: $bucketName");
    // }

    try {
      await supabase.client.storage.createBucket(bucketName);
      print("Bucket created successfully: $bucketName");
    } catch (e) {
      if (e.toString().contains("Duplicate")) {
        print("Bucket already exists: $bucketName");
      } else {
        rethrow;
      }
    }
  }

  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

 @override
  Future<String> uploadImage(File file, String path) async {
    try {
      String extension = b.extension(file.path);
      String uniqueFileName = const Uuid().v4() + extension;

       String filePath = '$path/$uniqueFileName';

       await supabase.client.storage
          .from('fruits_images')
          .upload(filePath, file);

       final publicUrl =
          supabase.client.storage.from('fruits_images').getPublicUrl(filePath);

      return publicUrl;
    } catch (e) {
      throw Exception('Upload failed: $e');
    }
  }
}
