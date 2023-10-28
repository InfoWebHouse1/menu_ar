import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/view/Home/ar_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRView extends StatefulWidget {
  const QRView({super.key});

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  bool isScanDetected = false;

  closeScreen() {
    isScanDetected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        // fit: BoxFit.contain,
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.back,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          debugPrint('Barcode found! ${barcodes[0].rawValue}');
          if (!isScanDetected) {
            isScanDetected = true;
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ARViewScreen(
            //       closeScreen: () {
            //         closeScreen();
            //       },
            //     ),
            //   ),
            // );
          }
        },
      ),
    );
  }
}
