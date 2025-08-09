import 'package:book_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const BookApp());
}

mixin AppLocale {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  static const Map<String, dynamic> EN = {
    title: 'Localization',
    thisIs: 'This is %a package, version %a.',
  };
  static const Map<String, dynamic> KM = {
    title: 'ការធ្វើមូលដ្ឋានីយកម្ម',
    thisIs: 'នេះគឺជាកញ្ចប់%a កំណែ%a.',
  };
  static const Map<String, dynamic> JA = {
    title: 'ローカリゼーション',
    thisIs: 'これは%aパッケージ、バージョン%aです。',
  };
}
//
// import 'package:book_app/app/app.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:device_preview/device_preview.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterLocalization.instance.ensureInitialized();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) {
//         return const BookApp();
//       },
//     ),
//   );
// }
//
// mixin AppLocale {
//   static const String title = 'title';
//   static const String thisIs = 'thisIs';
//
//   static const Map<String, dynamic> EN = {
//     title: 'Localization',
//     thisIs: 'This is %a package, version %a.',
//   };
//   static const Map<String, dynamic> KM = {
//     title: 'ការធ្វើមូលដ្ឋានីយកម្ម',
//     thisIs: 'នេះគឺជាកញ្ចប់%a កំណែ%a.',
//   };
//   static const Map<String, dynamic> JA = {
//     title: 'ローカリゼーション',
//     thisIs: 'これは%aパッケージ、バージョン%aです。',
//   };
// }
