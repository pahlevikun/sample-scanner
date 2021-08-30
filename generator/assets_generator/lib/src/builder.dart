import 'dart:io';

import 'package:assets_generator/src/config_argument.dart';
import 'package:yaml/yaml.dart';

import 'model/resources.dart';
import 'parser/assets_parser.dart';
import 'parser/fonts_parser.dart';

Resources parseResources(ConfigArgument arguments) {
  final pubspecFile = File(arguments.pubSpecFileName ?? '').absolute;
  if (!pubspecFile.existsSync()) {
    exit(1);
  }

  final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;

  return Resources(
    fonts: parseFonts(yaml),
    assets: parseAssets(
      yaml,
      arguments.ignoreAssets,
      arguments.assetClasses,
      arguments.customPackage ?? '',
    ),
  );
}
