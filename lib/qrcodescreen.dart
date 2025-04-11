import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  QRCodeScreenState createState() => QRCodeScreenState();
}

class QRCodeScreenState extends State<QRCodeScreen> {
  bool isScanCompleted = false;
  bool isCameraPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() {
        isCameraPermissionGranted = true;
      });
    } else {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Permission refusée"),
        content: Text("L'accès à la caméra est requis pour scanner un QR Code."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcodeCapture) {
    if (!isScanCompleted) {
      isScanCompleted = true;
      String code = barcodeCapture.barcodes.first.rawValue ?? "";

      if (Uri.tryParse(code)?.hasAbsolutePath ?? false) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(url: code),
          ),
        ).then((_) {
          isScanCompleted = false;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("QR Code détecté"),
            content: Text(code),
            actions: [
              TextButton(
                onPressed: () {
                  isScanCompleted = false;
                  Navigator.pop(context);
                },
                child: Text("Fermer"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner un QR Code"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: isCameraPermissionGranted
          ? Stack(
              children: [
                MobileScanner(
                  onDetect: _foundBarcode,
                ),
                // Guide carré
                Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Texte en bas
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Placez un QR Code dans le carré",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

// WebViewPage pour afficher les liens scannés dans l’app
class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Web"),
      ),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
