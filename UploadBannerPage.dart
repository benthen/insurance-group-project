import 'package:flutter/material.dart';

class UploadBannerPageWidget extends StatefulWidget {
  const UploadBannerPageWidget({Key? key}) : super(key: key);

  @override
  _UploadBannerPageWidgetState createState() => _UploadBannerPageWidgetState();
}

class _UploadBannerPageWidgetState extends State<UploadBannerPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 410,
              height: 286,
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Upload Banner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/336/600',
                  width: 454,
                  height: 229,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text('Choose Banner'),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text('Upload Banner'),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Text('Remove Banner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
