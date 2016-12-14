// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

abstract class ToSqlable {
  String toSql();
}

class ComparisonOperator implements ToSqlable {
  final int id;

  final String string;

  const ComparisonOperator._(this.id, this.string);

  String toSql() => string;

  static const Eq = const ComparisonOperator._(0, '=');

  static const Ne = const ComparisonOperator._(1, '<>');

  static const Gt = const ComparisonOperator._(2, '>');

  static const GtEq = const ComparisonOperator._(3, '>=');

  static const LtEq = const ComparisonOperator._(4, '<=');

  static const Lt = const ComparisonOperator._(5, '<');
}

class BinaryLogicalOperator implements ToSqlable {
  final int id;

  final String string;

  const BinaryLogicalOperator._(this.id, this.string);

  String toSql() => string;

  static const BinaryLogicalOperator And = const BinaryLogicalOperator._(0, 'AND');

  static const BinaryLogicalOperator Or = const BinaryLogicalOperator._(1, 'OR');
}

/// QItem encapsulates a query expression
class QItem implements ToSqlable {
  final String field;

  final ComparisonOperator op;

  final dynamic value;

  const QItem(this.field, this.op, this.value);

  String toSql() => '$field ${op.toSql()} $value';
}

abstract class Expression implements ToSqlable {
}

class ScalarExpression implements Expression {
  final QItem item;

  ScalarExpression(this.item);

  String toSql() => item.toSql();
}

class BinaryExpression implements Expression {
  final Expression lh;

  final BinaryLogicalOperator op;

  final Expression rh;

  BinaryExpression(this.lh, this.op, this.rh);

  String toSql() => '(${lh.toSql()}) ${op.toSql()} (${rh.toSql()})';
}

/// QuerySet encapsulates a query
class QuerySet {
  final Expression expression;

  QuerySet(this.expression);

  String toSql() => expression.toSql();
}

