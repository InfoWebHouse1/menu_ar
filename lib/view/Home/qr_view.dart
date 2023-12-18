import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/result_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({super.key});

  @override
  State<QRViewScreen> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? _controller;

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController? controller) {
    _controller = controller;
    controller!.scannedDataStream.listen((scanData) {
      if (isValidQRCode(scanData.code)) {
        Navigator.pushNamed(context, AppRoutes.resultScreen);
        if (kDebugMode) {
          print("Valid QR Code: $scanData");
        }
      } else {
        Utils.toastMessage("Not Valid QR Code");
      }
    });
  }

  bool isValidQRCode(String? qrData) {
    return qrData == Utils.qrScanCode;
  }

// bool isScanDetected = false;
//
// closeScreen() {
//   isScanDetected = false;
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: MobileScanner(
//       // fit: BoxFit.contain,
//       controller: MobileScannerController(
//         detectionSpeed: DetectionSpeed.normal,
//         facing: CameraFacing.back,
//       ),
//       onDetect: (capture) {
//         final List<Barcode> barcodes = capture.barcodes;
//         debugPrint('Barcode found! ${barcodes[0].rawValue}');
//         if (!isScanDetected) {
//           isScanDetected = true;
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => ARViewScreen(
//           //       closeScreen: () {
//           //         closeScreen();
//           //       },
//           //     ),
//           //   ),
//           // );
//         }
//       },
//     ),
//   );
// }
}
