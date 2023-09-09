import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("products").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String harga, String id) async {
    DocumentReference productById = firestore.collection("products").doc(id);

    try {
      await productById.update({
        "name": nama,
        "price": harga,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data product.",
        onConfirm: () {
          cNama.clear();
          cHarga.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Product.",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}
