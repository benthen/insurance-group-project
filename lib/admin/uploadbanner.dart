import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/database/adminDatabase.dart';
import 'package:path/path.dart';

class UploadBannerPageWidget extends StatefulWidget {
  const UploadBannerPageWidget({Key? key}) : super(key: key);

  @override
  _UploadBannerPageWidgetState createState() => _UploadBannerPageWidgetState();
}

class _UploadBannerPageWidgetState extends State<UploadBannerPageWidget> {
  String filename = 'No image';
  String url = '';
  List<Map> files = [];
  UploadTask? uploadTask;
  AdminDatabase database = AdminDatabase();

  @override
  void initState() {
    super.initState();
    checkFile();
  }

  Future<void> checkFile() async {
    final file = await database.checkIfImagesExist();
    setState(() {
      files = file;
      url = files[0]['url'];
      filename = basename(files[0]['path']);
    });
    print(filename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 430,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFFFF0000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 90, 0, 0),
                child: Text("Upload Banner",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
            ),
            Expanded(
                child: filename == "No image"
                    ? Container(
                        color: Colors.blue[100],
                        child: Center(
                          child: Text(filename),
                        ),
                      )
                    : FutureBuilder(
                        future: FirebaseStorage.instance
                            .ref()
                            .child('banner/$filename')
                            .getDownloadURL(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(snapshot.data!);
                          } else {
                            return Container(
                              color: Colors.blue[100],
                              child: Center(
                                child: Text(filename),
                              ),
                            );
                          }
                        },
                      )),
            const SizedBox(height: 32),
            ElevatedButton(
                child: const Text('Choose Banner'),
                onPressed: () async {
                  final filepick = await database.chooseImage();
                  setState(() {
                    filename = filepick;
                  });
                }),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('Upload Banner'),
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content:
                              const Text('The image is uploaded successfully!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Delete Banner'),
              onPressed: () async {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: const Text(
                              'Are you sure you want to remove the chosen image?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                await database.deleteImage(filename);
                                setState(() {
                                  filename = 'No image';
                                });
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          content: const Text(
                                              'The chosen image is removed successfully!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UploadBannerPageWidget())),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ));
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'No'),
                              child: const Text('No'),
                            ),
                          ],
                        ));
              },
            ),
            const SizedBox(height: 32),
            buildProgress(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminHomePageWidget()));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }

  Widget buildProgress() {
    if (uploadTask != null) {
      return StreamBuilder<TaskSnapshot>(
        stream: uploadTask!.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            final double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(progress * 100).toStringAsFixed(1)}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(height: 50);
          }
        },
      );
    } else {
      return const SizedBox(height: 50);
    }
  }
}
