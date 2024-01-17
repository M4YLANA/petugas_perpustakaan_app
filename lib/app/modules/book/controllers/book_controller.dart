import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:petugas_perpustakaan_app/app/model/response_book.dart';

class BookController extends GetxController with StateMixin<List<DataBook>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    // Your initialization code here
  }

  @override
  void onReady() {
    super.onReady();
    // Your onReady code here
  }

  @override
  void onClose() {
    super.onClose();
    // Your onClose code here
  }

  void increment() => count.value++;

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final response = await ApiProvider.instance().get(Endpoint.book);

      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);

        if (responseBook.data!.isEmpty) {
          change(responseBook.data as List<DataBook>?, status: RxStatus.empty());
        } else {
          change(responseBook.data as List<DataBook>?, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioError catch (e) {
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      change(null, status: RxStatus.error("Error $e"));
    }
  }
}
