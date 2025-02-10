import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dash/core/service/storage_service.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {
    String extensionName = p.extension(file.path);

    String fileName = p.basename(file.path);
    var fileRefrerence = storageRef.child("$path/$fileName.$extensionName");
    await fileRefrerence.putFile(file);
    var fileUrl = fileRefrerence.getDownloadURL();
    return fileUrl;
  }
}


/*





import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruit_hub_dash/core/service/storage_service.dart';
import 'package:path/path.dart' as p;

class SupabaseStorage implements StorageService {
  final SupabaseClient supabaseClient;

  SupabaseStorage({required this.supabaseClient});

  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      String fileName = p.basename(file.path);
      final fileBytes = await file.readAsBytes();

      // Upload the file to the specified path
      final response = await supabaseClient.storage.from(path).uploadBinary(
        fileName,
        fileBytes,
        fileOptions: FileOptions(upsert: true),
      );

      if (response.error != null) {
        throw Exception('Failed to upload file: ${response.error!.message}');
      }

      // Generate public URL
      final fileUrl = supabaseClient.storage.from(path).getPublicUrl(fileName);
      return fileUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }
}








* */
