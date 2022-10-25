import 'generator/icon_constant_gen.dart';
import 'icon_fetch.dart';

void main(List<String> args) async {
  bool update = args.contains('update');

  await IconFetch.fetch(update);

  final constantGenerator = IconConstantGen(IconFetch.svgFolder);
  constantGenerator.gen();
}
