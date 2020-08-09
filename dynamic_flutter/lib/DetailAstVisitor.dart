import 'dart:io';

import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/ast/ast.dart';

/**
 * 详细输出AST NODE 节点内容
 */
class DetailAstVisitor extends GeneralizingAstVisitor<Map> {
  @override
  Map visitNode(AstNode node) {
    //输出遍历AST Node 节点内容
    stdout.writeln("${node.runtimeType}<---->${node.toSource()}");
    return super.visitNode(node);
  }
}