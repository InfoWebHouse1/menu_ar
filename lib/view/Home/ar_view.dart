import 'dart:io';
import 'dart:math';

import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vector_math/vector_math_64.dart';

class ARViewScreen extends StatefulWidget {
  String? valueItem;
  //bool? closeScreen;

  ARViewScreen({super.key, this.valueItem});

  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
    widget.valueItem! == '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR View'),
        leading: GestureDetector(
          onTap: () {
            // widget.closeScreen == false;
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: onRemoveEverything, child: const Text("Remove Everything")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onARViewCreated(ARSessionManager arSessionManager, ARObjectManager arObjectManager, ARAnchorManager arAnchorManager, ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(showPlanes: true, showWorldOrigin: true, handlePans: true, handleRotation: true, handleTaps: true);
    this.arObjectManager!.onInitialize();

    this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager!.onNodeTap = onNodeTapped;

    this.arObjectManager!.onPanStart = onPanStarted;
    this.arObjectManager!.onPanChange = onPanChanged;
    this.arObjectManager!.onPanEnd = onPanEnded;
    this.arObjectManager!.onRotationStart = onRotationStarted;
    this.arObjectManager!.onRotationChange = onRotationChanged;
    this.arObjectManager!.onRotationEnd = onRotationEnded;
  }

  Future<void> onRemoveEverything() async {
    for (var anchor in anchors) {
      arAnchorManager!.removeAnchor(anchor);
    }
    anchors = [];
  }

  Future<void> onNodeTapped(List<String> nodes) async {
    var number = nodes.length;
    arSessionManager!.onError("Tapped $number node(s)");
  }

  Future<void> onPlaneOrPointTapped(List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere((hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    var newAnchor = ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
    bool? didAddAnchor = await arAnchorManager!.addAnchor(newAnchor);
    if (didAddAnchor!) {
      anchors.add(newAnchor);
      // Add note to anchor
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri: widget.valueItem!,
          //uri: "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/burger_model.glb?alt=media&token=2cba7d11-4767-444b-965c-c1159886bcae&_gl=1*psxapo*_ga*MTM4MTM5OTYzNi4xNjk1MzEyMjAy*_ga_CW55HF8NVT*MTY5ODE2OTEzNC45LjEuMTY5ODE2OTIzMi4zNy4wLjA.",
          scale: Vector3(0.2, 0.2, 0.2),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddNodeToAnchor = await arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
      if (didAddNodeToAnchor!) {
        nodes.add(newNode);
      }
    }
  }

  onPanStarted(String nodeName) {
    if (kDebugMode) {
      print("Started panning node $nodeName");
    }
  }

  onPanChanged(String nodeName) {
    if (kDebugMode) {
      print("Continued panning node $nodeName");
    }
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    if (kDebugMode) {
      print("Ended panning node $nodeName");
    }
    final pannedNode = nodes.firstWhere((element) => element.name == nodeName);
    pannedNode.transform = newTransform;
  }

  onRotationStarted(String nodeName) {
    if (kDebugMode) {
      print("Started rotating node $nodeName");
    }
  }

  onRotationChanged(String nodeName) {
    if (kDebugMode) {
      print("Continued rotating node $nodeName");
    }
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    if (kDebugMode) {
      print("Ended rotating node $nodeName");
    }
    final rotatedNode = nodes.firstWhere((element) => element.name == nodeName);
    rotatedNode.transform = newTransform;
  }
}
