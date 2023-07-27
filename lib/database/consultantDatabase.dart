import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ConsultantDatabase {
  late File file;

  DateTime now = DateTime.now();


  Future consultantRegister(
      id, code, agency, password, filename, address, phone, email) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("consultant");

    reference.doc(id).set({
      'agent id': id,
      'national code': code,
      'agency': agency,
      'password': password,
      'cert': filename,
      'phone': phone,
      'email': email,
      'address': address,
      'status': 'false',
      'reward point': "0",
    });
  }

  Future uploadCert(filename) async {
    final storageRef = FirebaseStorage.instance.ref();
    storageRef.child('certification/$filename').putFile(file);
  }

  Future<String> getCertBasename() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      String name = basename(file.path);
      name = 'cert.pdf';
      return name;
    } else
      return '';
  }

  Future<String> getReportBasename() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      String name = basename(file.path);
      name = 'report.pdf';
      return name;
    } else
      return '';
  }

  Future<bool> consultantLogin(id, password) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('consultant').doc(id);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      if (data['password'] == password && data['status'] != 'false') {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future uploadReviewReport(mykad) async {
    final storageRef = FirebaseStorage.instance.ref();
    storageRef
        .child('review report/$mykad/${basename(file.path)}')
        .putFile(file);
  }

  Future changePolicyStatus(mykad, recommend, benefit) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;

    List<String> filename = data['filename'].split(',');
    String filechange = '';
    String full = '';
    for (int i = filename.length - 1; i >= 0; i--) {
      if (filename[i].split('/')[1] == "Unreviewed") {
        List<String> change = filename[i].split('/');
        change[1] = "Reviewed";
        filename[i] = '${change[0]}/${change[1]}';
        filechange = change[0];
        break;
      }
    }

    for (int i = 0; i < filename.length; i++) {
      if ((i + 1) != filename.length) {
        full = '$full${filename[i]},';
      } else {
        full = '$full${filename[i]}';
      }
    }

    FirebaseFirestore.instance
        .collection('customer')
        .doc(mykad)
        .update({"filename": full});

    FirebaseFirestore.instance.collection('review report').doc(filechange).set({
      'mykad': mykad,
      'benefit': benefit,
      'recommend': recommend,
      'policy': filechange,
      'report': basename(file.path)
    });
  }

  Future<bool> checkConsultant(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('consultant').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return documentSnapshot.exists;
  }

  Future<QuerySnapshot> getConsultantList() async {
    return await FirebaseFirestore.instance.collection('consultant').get();
  }

  Future<Map<String, dynamic>> getConsultantDetail(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('consultant').doc(id);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data;
  }

  Future changeStatus(id) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("consultant");

    reference.doc(id).update({'status': "Unassigned"});
  }

  Future createRedemptionRequest(id, value, point) async {
    final CollectionReference redemption =
        FirebaseFirestore.instance.collection("redemption");
    final CollectionReference transaction =
        FirebaseFirestore.instance.collection("transaction");

    redemption.doc(id).set({
      'category': 'consultant',
      'agent id': id,
      'value': value,
      'point': point,
      'date': "${now.year}-${now.month}-${now.day}",
    });
    transaction.doc(id).set({
      'category': 'consultant',
      'agent id': id,
      'value': value,
      'point': point,
      'date': "${now.year}-${now.month}-${now.day}",
      'status': 'Pending'
    });
  }

  Future updateRewardPoint(id) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('consultant').doc(id);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    int point = int.parse(data['reward point']) + 20;
    FirebaseFirestore.instance
        .collection('consultant')
        .doc(id)
        .update({'reward point': '$point'});
  }
}
