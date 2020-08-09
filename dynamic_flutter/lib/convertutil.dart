import 'dart:convert';
import 'dart:io';
import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:args/args.dart';
import 'package:dynamic_flutter/DetailAstVisitor.dart';
import 'package:dynamic_flutter/MyAstVisitor.dart';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag("file", negatable: false, abbr: 'f');

  var argResults = parser.parse(arguments);
  final paths = argResults.rest;
  if (paths.isEmpty) {
    stdout.writeln('No file found');
  } else {
    generate(paths[0]);
  }
}

//生成AST
Future generate(String path) async {
  if (path.isEmpty) {
    stdout.writeln("No file found");
  } else {
    await _handleError(path);
    if (exitCode == 2) {
      try {
        var parseResult =
        parseFile(path: path, featureSet: FeatureSet.fromEnableFlags([]));
        var compilationUnit = parseResult.unit;
        //遍历AST
        var astData = compilationUnit.accept(DetailAstVisitor());
        stdout.writeln(jsonEncode(astData));
      } catch (e) {
        stdout.writeln('Parse file error: ${e.toString()}');
      }
    }
  }
}

Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}

