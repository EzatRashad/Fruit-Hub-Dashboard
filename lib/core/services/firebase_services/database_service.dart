
abstract class DatabaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data,String? docId});
  Future<Map<String, dynamic>> getData(
      {required String docId, required String path});

      Future<bool> checkDataExists({required String docId, required String path});
}
