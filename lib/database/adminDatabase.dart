import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AdminDatabase {
  late File file;

  DateTime now = DateTime.now();

  Future downloadCert(filename) async {
    String url = await FirebaseStorage.instance
        .ref()
        .child('certification/$filename')
        .getDownloadURL();
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = '${appDirectory.path}/certification/$filename';
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  Future<String> chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      UploadTask? uploadTask;

      final ref =
          FirebaseStorage.instance.ref().child('banner/${basename(file.path)}');

      uploadTask = ref.putFile(file);

      await uploadTask.whenComplete(() {});

      FirebaseFirestore.instance
          .collection('banner')
          .doc('banner')
          .set({'name': basename(file.path)});
          
      return basename(file.path);
    } else
      return 'No image';
  }

  Future<bool> adminLogin(id, password) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('admin').doc(id);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      if (data['password'] == password) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteImage(filename) async {
    final path = 'banner/$filename';
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.delete();
  }

  Future<List<Map>> checkIfImagesExist() async {
    List<Map> files = [];

    final ListResult result =
        await FirebaseStorage.instance.ref().child('banner').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final String fileType = file.name.split('.').last.toLowerCase();
      if (fileType == 'jpg' || fileType == 'jpeg' || fileType == 'png') {
        files.add({"url": fileUrl, "path": file.fullPath});
      }
    });

    return files;
  }

  Future uploadTNC(tnc, category) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("tnc");

    reference.doc(category).set({'category': category, 'tnc': tnc});
  }

  Future updateTNC(tnc, category) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("tnc");

    reference.doc(category).update({'tnc': tnc});
  }

  Future<String> loadTNC(category) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('tnc').doc(category);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data['tnc'];
    } catch (e) {
      return '';
    }
  }

  Future uploadCash(value, point) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("gift");

    reference.doc(value).set({
      "value": value,
      "point": point,
    });
  }

  Future<String> uploadGiftImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);

      FirebaseStorage.instance
          .ref()
          .child('cash/${basename(file.path)}')
          .putFile(file);

      return basename(file.path);
    } else {
      return 'Fail to upload';
    }
  }

  Future deleteGift(value) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('gift');

    await collectionRef.doc(value).delete();
  }

  Future<QuerySnapshot> getAllGift() async {
    return await FirebaseFirestore.instance.collection('gift').get();
  }

  Future assignConsultantAndCustomer(mykad, id) async {
    final CollectionReference customer =
        FirebaseFirestore.instance.collection("customer");
    final CollectionReference consultant =
        FirebaseFirestore.instance.collection("consultant");

    customer.doc(mykad).update({'consultant': id, 'status': 'Assigned'});
    consultant.doc(id).update({'customer': mykad, 'status': 'Assigned'});
  }

  Future<QuerySnapshot> getRedemptionRequest() async {
    return await FirebaseFirestore.instance.collection('redemption').get();
  }

  Future updateCustomerPoint(mykad, point) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;

    int num = int.parse(data['reward point']) - int.parse(point);
    FirebaseFirestore.instance
        .collection('customer')
        .doc(mykad)
        .update({'reward point': '$num'});
  }

  Future updateConsultantPoint(id, point) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('consultant').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;

    int num = int.parse(data['reward point']) - int.parse(point);
    FirebaseFirestore.instance
        .collection('consultant')
        .doc(id)
        .update({'reward point': '$num'});
  }

  Future deleteRedemption(id) async {
    FirebaseFirestore.instance.collection('redemption').doc(id).delete();
  }

  Future changeTransactionStatus(id, status) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('transaction').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;

    final status = data['status'].split(',');
    final date = data['date'].split(',');
    date[0] = '${now.year}-${now.month}-${now.day}';
    status[0] = 'Approved';
    String fullStatus = '';
    String fullDate = '';
    for (int i = 0; i < status.length; i++) {
      if ((i + 1) != status.length) {
        fullStatus = '$fullStatus${status[i]},';
        fullDate = '$fullDate${date[i]},';
      } else {
        fullStatus = '$fullStatus${status[i]}';
        fullDate = '$fullDate${date[i]}';
      }
    }
    await FirebaseFirestore.instance
        .collection('transaction')
        .doc(id)
        .update({'status': fullStatus, 'date': fullDate});
  }

  Future createRedemptionRequest(category, id, value, point) async {
    final CollectionReference redemption =
        FirebaseFirestore.instance.collection("redemption");
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection("transaction");

    redemption.doc(id).set({
      'category': category,
      'id': id,
      'value': value,
      'point': point,
      'date': "${now.year}-${now.month}-${now.day}"
    });

    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('transaction').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    try {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      String status = '';
      String date = '';
      String fullValue = '$value,${data['value']}';
      String fullPoint = '$point,${data['point']}';
      status = 'Pending,${data['status']}';
      date = '${now.year}-${now.month}-${now.day},${data['date']}';

      transaction.doc(id).update({
        'date': date,
        'status': status,
        'value': fullValue,
        'point': fullPoint,
      });
    } catch (e) {
      transaction.doc(id).set({
        'category': category,
        'id': id,
        'value': value,
        'point': point,
        'date': "${now.year}-${now.month}-${now.day}",
        'status': 'Pending'
      });
    }
  }

  Future redeemedItem(category, id, value) async {
    final CollectionReference redeemed =
        FirebaseFirestore.instance.collection("redeemed item");
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('redeemed item').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    try {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      String status = '';
      String date = '';
      String fullValue = '$value,${data['value']}';
      status = 'Delivering,${data['status']}';
      date = '${now.year}-${now.month}-${now.day},${data['date']}';

      redeemed.doc(id).update({
        'date': date,
        'status': status,
        'value': fullValue,
      });
    } catch (e) {
      redeemed.doc(id).set({
        'category': category,
        'id': id,
        'value': value,
        'date': "${now.year}-${now.month}-${now.day}",
        'status': 'Delivering'
      });
    }
  }

  Future<Map<String, dynamic>> getAllTransaction(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('transaction').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    try {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> getAllRedeemedItem(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('redeemed item').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    try {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future changeRedeemedItemStatus(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('redeemed item').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    final status = data['status'].split(',');
    status[0] = 'Delivered';
    String fullStatus = '';

    for (int i = 0; i < status.length; i++) {
      if ((i + 1) != status.length) {
        fullStatus = '$fullStatus${status[i]},';
      } else {
        fullStatus = '$fullStatus${status[i]}';
      }
    }

    FirebaseFirestore.instance
        .collection('redeemed item')
        .doc(id)
        .update({'status': fullStatus});
  }
}
