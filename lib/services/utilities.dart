import 'dart:typed_data';

import 'package:chronos/services/dio_client.dart';
import 'package:flutter/services.dart';

Future<Uint8List> getNetworkImageUint8List(String url) async {
  Uint8List bytes =
      (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
  return bytes;
}
