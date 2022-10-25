import 'dart:io';
import 'package:path/path.dart' as path_helper;

class IconFetch {
  IconFetch._();
  static Directory folder = Directory('.cache/element-plus-icons');
  static Directory get svgFolder {
    final path = path_helper.join(folder.path, 'packages', 'svg');
    final dir = Directory(path);
    if (!dir.existsSync()) throw Exception('NOT FOUND');
    return dir;
  }

  static Future<bool> fetch(bool update) async {
    final cacheDirectory = Directory('.cache');

    if (!await cacheDirectory.exists()) {
      await cacheDirectory.create();
    }

    if (update) {
      folder.deleteSync(recursive: true);
      return await _clone();
    }

    if (!folder.existsSync()) {
      return await _clone();
    }

    return true;
  }

  static Future _clone() async {
    final res = await Process.run(
      'git',
      [
        'clone',
        'https://github.com/element-plus/element-plus-icons',
        '.cache/element-plus-icons',
        '--depth',
        '1',
      ],
    );
    return res.exitCode == 0;
  }
}
