import 'dart:io';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as path_helper;
import 'package:recase/recase.dart';

class IconConstantGen {
  static File output = File('../elm_icons/lib/src/icons.dart');
  static File outputLib = File('../elm_icons/lib/elm_icons.dart');

  static final _emitter = DartEmitter();
  static final _formatter = DartFormatter();

  IconConstantGen(this.input);
  final Directory input;

  Future gen() async {
    final bf = StringBuffer();
    final libBf = StringBuffer();

    final lib = Library((l) {
      l.name = 'elm_icons';
    });
    libBf.writeln(lib.accept(_emitter));

    final importWidget = Directive.import('package:flutter/widgets.dart');
    final importSvg = Directive.import('package:flutter_svg/flutter_svg.dart');
    final importIcons = Directive.part('src/icons.dart');
    libBf.writeln(importWidget.accept(_emitter));
    libBf.writeln(importSvg.accept(_emitter));
    libBf.writeln(importIcons.accept(_emitter));

    libBf.writeln('''
    class ElmIcon extends StatelessWidget {
  const ElmIcon(
    this.icon, {
    super.key,
    this.width,
    this.height,
  });
  final ElmIcons icon;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon.text,
      width: width,
      height: height,
    );
  }
}
''');

    final partOf = Directive.partOf('../elm_icons.dart');
    bf.writeln(partOf.accept(_emitter));
    final files = await getFiles();
    final model = Class((c) {
      c.name = 'ElmIcons';
      c.fields.add(Field((f) {
        f.name = 'text';
        f.type = Reference('String');
        f.modifier = FieldModifier.final$;
      }));
      c.constructors.add(Constructor((con) {
        con.name = '_';
        con.constant = true;
        con.requiredParameters.add(Parameter((p) {
          p.name = 'text';
          p.toThis = true;
        }));
      }));
      final fieldList = <Field>[];
      final iconNameList = <String>[];

      for (var file in files) {
        final name = path_helper.basenameWithoutExtension(file.path).camelCase;
        iconNameList.add(nameCheck(name));
        final text = file.readAsStringSync();

        final field = Field((f) {
          f.modifier = FieldModifier.constant;
          f.name = nameCheck(name);
          f.assignment = Code('ElmIcons._(r\'\'\'$text\'\'\')');
          f.static = true;
        });
        fieldList.add(field);
      }
      c.fields.addAll(fieldList);
      c.fields.add(Field((f) {
        f.name = 'values';
        f.modifier = FieldModifier.constant;
        f.type = Reference('List<ElmIcons>');
        f.assignment = Code('[${iconNameList.join(',')}]');
        f.static = true;
        f.docs
            .add('/// use with care, will break the flutter\'s three shaking.');
      }));
    });
    bf.writeln(model.accept(_emitter));

    final result = _formatter.format(bf.toString());
    final libResult = _formatter.format(libBf.toString());
    if (!await output.exists()) {
      await output.create(recursive: true);
    } else {
      output.writeAsString('');
    }
    await output.writeAsString(result);
    await outputLib.writeAsString(libResult);
  }

  Future<List<File>> getFiles() async {
    final items = input.listSync(recursive: true);
    final result = <File>[];
    for (var element in items) {
      if (await FileSystemEntity.isFile(element.path) &&
          path_helper.extension(element.path) == '.svg') {
        result.add(element as File);
      }
    }
    return result;
  }

  String nameCheck(String name) {
    if (name == 'switch') return '${name}Icon';
    return name;
  }
}
