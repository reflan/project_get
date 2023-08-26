import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_get/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => cAuth.logout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      //1. Menampilkan data tidak realtime
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.GetData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // mengambil data
      //       var listAllDocs = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: listAllDocs.length,
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text(
      //               "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
      //           subtitle: Text(
      //               "${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
      //         ),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      //2. Menampilkan data secara realtime
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // mengambil data
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
