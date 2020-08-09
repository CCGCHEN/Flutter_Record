import 'package:analyzer/analyzer.dart';

class MyAstVisitor extends SimpleAstVisitor<Map> {
  /// 遍历节点
  Map _safelyVisitNode(AstNode node) {
    if (node != null) {
      return node.accept(this);
    }
    return null;
  }

  /// 遍历节点列表
  List<Map> _safelyVisitNodeList(NodeList<AstNode> nodes) {
    List<Map> maps = [];
    if (nodes != null) {
      int size = nodes.length;
      for (int i = 0; i < size; i++) {
        var node = nodes[i];
        if (node != null) {
          var res = node.accept(this);
          print('canterDan---->> $res');
          if (res != null) {
            maps.add(res);
          }
        }
      }
    }
    return maps;
  }

  //构造根节点
  Map _buildAstRoot(List<Map> body) {
    if (body.isNotEmpty) {
      return {
        "type": "Program",
        "body": body,
      };
    } else {
      return null;
    }
  }

  //构造代码块Bloc 结构
  Map _buildBloc(List body) => {"type": "BlockStatement", "body": body};

  //构造运算表达式结构
  Map _buildBinaryExpression(Map left, Map right, String lexeme) => {
    "type": "BinaryExpression",
    "operator": lexeme,
    "left": left,
    "right": right
  };

  //构造变量声明
  Map _buildVariableDeclaration(Map id, Map init) => {
    "type": "VariableDeclarator",
    "id": id,
    "init": init,
  };

  //构造变量声明
  Map _buildVariableDeclarationList(
      Map typeAnnotation, List<Map> declarations) =>
      {
        "type": "VariableDeclarationList",
        "typeAnnotation": typeAnnotation,
        "declarations": declarations,
      };
  //构造标识符定义
  Map _buildIdentifier(String name) => {"type": "Identifier", "name": name};

  //构造数值定义
  Map _buildNumericLiteral(num value) =>
      {"type": "NumericLiteral", "value": value};

  //构造函数声明
  Map _buildFunctionDeclaration(Map id, Map expression) => {
    "type": "FunctionDeclaration",
    "id": id,
    "expression": expression,
  };

  //构造函数表达式
  Map _buildFunctionExpression(Map params, Map typeParameters, Map body) => {
    "type": "FunctionExpression",
    "parameters": params,
    "typeParameters": typeParameters,
    "body": body,
  };

  //构造函数参数
  Map _buildFormalParameterList(List<Map> parameterList) =>
      {"type": "FormalParameterList", "parameterList": parameterList};

  //构造函数参数
  Map _buildSimpleFormalParameter(Map type, String name) =>
      {"type": "SimpleFormalParameter", "paramType": type, "name": name};

  //构造函数参数类型
  Map _buildTypeName(String name) => {
    "type": "TypeName",
    "name": name,
  };

  //构造返回数据定义
  Map _buildReturnStatement(Map argument) => {
    "type": "ReturnStatement",
    "argument": argument,
  };

  @override
  Map visitCompilationUnit(CompilationUnit node) {
    return _buildAstRoot(_safelyVisitNodeList(node.declarations));
  }

  @override
  Map visitBlock(Block node) {
    return _buildBloc(_safelyVisitNodeList(node.statements));
  }

  @override
  Map visitBlockFunctionBody(BlockFunctionBody node) {
    return _safelyVisitNode(node.block);
  }

  @override
  Map visitVariableDeclaration(VariableDeclaration node) {
    return _buildVariableDeclaration(
        _safelyVisitNode(node.name), _safelyVisitNode(node.initializer));
  }

  @override
  Map visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    return _safelyVisitNode(node.variables);
  }

  @override
  Map visitVariableDeclarationList(VariableDeclarationList node) {
    return _buildVariableDeclarationList(
        _safelyVisitNode(node.type), _safelyVisitNodeList(node.variables));
  }

  @override
  Map visitSimpleIdentifier(SimpleIdentifier node) {
    return _buildIdentifier(node.name);
  }

  @override
  Map visitBinaryExpression(BinaryExpression node) {
    return _buildBinaryExpression(_safelyVisitNode(node.leftOperand),
        _safelyVisitNode(node.rightOperand), node.operator.lexeme);
  }

  @override
  Map visitIntegerLiteral(IntegerLiteral node) {
    return _buildNumericLiteral(node.value);
  }

  @override
  Map visitFunctionDeclaration(FunctionDeclaration node) {
    return _buildFunctionDeclaration(
        _safelyVisitNode(node.name), _safelyVisitNode(node.functionExpression));
  }

  @override
  Map visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    return _safelyVisitNode(node.functionDeclaration);
  }

  @override
  Map visitFunctionExpression(FunctionExpression node) {
    return _buildFunctionExpression(_safelyVisitNode(node.parameters),
        _safelyVisitNode(node.typeParameters), _safelyVisitNode(node.body));
  }

  @override
  Map visitSimpleFormalParameter(SimpleFormalParameter node) {
    return _buildSimpleFormalParameter(
        _safelyVisitNode(node.type), node.identifier.name);
  }

  @override
  Map visitFormalParameterList(FormalParameterList node) {
    return _buildFormalParameterList(_safelyVisitNodeList(node.parameters));
  }

  @override
  Map visitTypeName(TypeName node) {
    return _buildTypeName(node.name.name);
  }

  @override
  Map visitReturnStatement(ReturnStatement node) {
    return _buildReturnStatement(_safelyVisitNode(node.expression));
  }
}
