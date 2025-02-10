import 'dart:io';

import 'package:fruit_hub_dash/constans.dart';
import 'package:fruit_hub_dash/core/service/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStoargeService implements StorageService {

  static late Supabase _supabase;


  static Future<void> createBuckets(String bucketName) async {
    // الحصول على قائمة الـ Buckets
    var buckets = await _supabase.client.storage.listBuckets();

    // التحقق إذا كان الباكت موجودًا
    bool isBucketExists = false;

    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      // إنشاء الباكت إذا لم يكن موجودًا
      await _supabase.client.storage.createBucket(bucketName);
      print('Bucket "$bucketName" created successfully.');
    }
  }


  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
    print('$kSupabaseUrl');
    print('$kSupabaseKey');
  }


  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    String fullPath = '$path/$fileName$extensionName';

    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload(fullPath, file);

    print('File uploaded to: $fullPath');

    final String publicUrl = _supabase.client.storage.from('fruits_images')
        .getPublicUrl(fullPath);
    print('File uploaded to: $publicUrl');
    return publicUrl;
  }


//
// static Future<void> createBuckets(String bucketName) async {
//   try {
//     // الحصول على قائمة الـ Buckets
//     var buckets = await _supabase.client.storage.listBuckets();
//
//     // التحقق إذا كان الباكت موجودًا
//     bool isBucketExists = buckets.any((bucket) => bucket.id == bucketName);
//
//     if (!isBucketExists) {
//       // إنشاء الباكت إذا لم يكن موجودًا
//       await _supabase.client.storage.createBucket(bucketName);
//       print('Bucket "$bucketName" created successfully.');
//     } else {
//       print('Bucket "$bucketName" already exists.');
//     }
//   } catch (e) {
//     // طباعة أي أخطاء للحصول على مزيد من التفاصيل
//     print('Error in createBuckets: $e');
//   }
// }
//
// static initSupabase() async {
//   _supabase = await Supabase.initialize(
//     url: kSupabaseUrl,
//     anonKey: kSupabaseKey,
//   );
//   print('$kSupabaseUrl');
//   print('$kSupabaseKey');
// }
//
// @override
// Future<String> uploadFile(File file, String path) async {
//   String fileName = b.basename(file.path);
//   String extensionName = b.extension(file.path);
//   String fullPath = '$path/$fileName$extensionName';
//
//   var result = await _supabase.client.storage
//       .from('fruits_images')
//       .upload(fullPath, file);
//
//   print('File uploaded to: $fullPath');
//   return result;
// }
}
