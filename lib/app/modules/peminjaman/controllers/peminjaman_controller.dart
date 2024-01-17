import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_app/app/data/provider/api_provider.dart';

import 'package:petugas_perpustakaan_app/app/model/response_pinjam.dart';

class PeminjamanController extends GetxController  with StateMixin<List<Data>> {
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final response = await ApiProvider.instance().get(Endpoint.pinjam);

      if (response.statusCode == 200) {
        final ResponsePinjam responsepinjam = ResponsePinjam.fromJson(response.data);

        if (responsepinjam.data!.isEmpty) {
          change(responsepinjam.data , status: RxStatus.empty());
        } else {
          change(responsepinjam.data , status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      change(null, status: RxStatus.error("Error $e"));
    }
  }
}
