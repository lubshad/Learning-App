import 'dart:io';
import 'dart:ui';

import 'package:desktop_window/desktop_window.dart';

// Future testWindowFunctions() async {
//     Size size = await DesktopWindow.getWindowSize();
//     print(size);
//     await DesktopWindow.setWindowSize(Size(500,500));

//     await DesktopWindow.setMinWindowSize(Size(400,400));
//     await DesktopWindow.setMaxWindowSize(Size(800,800));

//     await DesktopWindow.resetMaxWindowSize();
//     await DesktopWindow.toggleFullScreen();
//     bool isFullScreen = await DesktopWindow.getFullScreen();
//     await DesktopWindow.setFullScreen(true);
//     await DesktopWindow.setFullScreen(false);
// }

setMinimumWindowSize({Size size = const Size(360, 600)}) async {
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await DesktopWindow.setMinWindowSize(size);
  }
}
