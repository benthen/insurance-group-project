import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class CustomerDatabase {
  late File file;

  DateTime now = DateTime.now();

  Future<Map<String, dynamic>> getFile() async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('banner').doc('banner');

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    try {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future customerRegister(mykad, phone, password, name, email, address) async {
    final CollectionReference reference =
        FirebaseFirestore.instance.collection("customer");

    reference.doc(mykad).set({
      'mykad': mykad,
      'phone': phone,
      'password': password,
      "status": "Not active",
      "name": name,
      "email": email,
      "consultant": "None",
      "address": address,
      "reward point": "0",
      "filename": "None/Not active"
    });
  }

  Future<bool> checkCustomer(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return documentSnapshot.exists;
  }

  Future<bool> customerLogin(mykad, password) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

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

  Future<Map<String, dynamic>> getCustomerName(mykad) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<QuerySnapshot> getCustomerList() async {
    return await FirebaseFirestore.instance.collection('customer').get();
  }

  Future<Map<String, dynamic>> getCustomerDetail(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);

    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data;
  }

  Future uploadPolicy(mykad) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      final storageRef = FirebaseStorage.instance.ref();
      String base = basename(file.path);
      base = 'policy.pdf';
      storageRef.child('policy/$mykad/$base').putFile(file);

      // check whether there is policy
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(mykad);

      final DocumentSnapshot documentSnapshot = await documentReference.get();

      final CollectionReference reference =
          FirebaseFirestore.instance.collection("customer");

      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      if (data['filename'] != 'None/Not active') {
        // add the new policy to old policy
        String policy = '$base/Unreviewed,${data['filename']}';

        reference
            .doc(mykad)
            .update({'filename': policy, 'status': 'Unassigned'});
      } else {
        reference
            .doc(mykad)
            .update({'filename': '$base/Unreviewed', 'status': 'Unassigned'});
      }
    }
  }

  Future updateRewardPoint(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    int point = int.parse(data['reward point']) + 20;
    FirebaseFirestore.instance
        .collection('customer')
        .doc(mykad)
        .update({'reward point': '$point'});
  }

  Future<String> getAllPolicy(mykad) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('customer').doc(mykad);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    if (data['filename'] != "None/Not active") {
      return data['filename'];
    } else {
      return '';
    }
  }

  Future<String> getPoint(id) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('customer').doc(id);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return '${data['reward point']}/customer';
    } catch (e) {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('consultant').doc(id);

      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      return '${data['reward point']}/consultant';
    }
  }

  Future<Map<String, dynamic>> getReport(filechange) async {
    final DocumentReference documentReference =
        FirebaseFirestore.instance.collection('review report').doc(filechange);
    final DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =
        documentSnapshot.data()! as Map<String, dynamic>;
    return data;
  }

  Future<bool> checkRedemptionRequest(id) async {
    try {
      final DocumentReference documentReference =
          FirebaseFirestore.instance.collection('redemption').doc(id);
      final DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      if (data['value'] != "") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
