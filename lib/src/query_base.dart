// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library query;

part 'expression/expressions.dart';

part 'operators/comparision.dart';
part 'operators/logical.dart';

part 'statement/statements.dart';

part 'values/values.dart';

abstract class ToSqlable {
  String toSql();
}

/// QItem encapsulates a query expression
class Q<ValType extends V> implements ToSqlable {
  final String field;

  final ComparisonOperator op;

  final ValType value;

  const Q(this.field, this.op, this.value);

  String toSql() => '$field ${op.toSql()} ${value.toSql()}';
}

/// QuerySet encapsulates a query
class W {
  Expression _expression;

  W();

  String toSql() => _expression.toSql();

  set e(Expression exp) {
    _expression = exp;
  }
}
