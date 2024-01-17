import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.judulController,
              decoration: InputDecoration(
                hintText: "Masukkan Judul",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Judul Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.penulisController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan penulis",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "penulis Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.penerbitController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan penerbit",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "penerbit Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.tahunController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan tahunterbit",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "tahun terbit Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loadingBook.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.addBook();
                },
                child: Text("Login")))
          ],
        ),
      ),
    );
  }
}