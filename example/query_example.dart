// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:query/query.dart';

main() {
  BinaryExpression exp1 = new BinaryExpression(
      new ScalarExpression(new QItem('age', ComparisonOperator.GtEq, 20)),
      BinaryLogicalOperator.And,
      new ScalarExpression(new QItem('age', ComparisonOperator.LtEq, 50)));
  BinaryExpression exp2 = new BinaryExpression(
      new ScalarExpression(new QItem('experience', ComparisonOperator.GtEq, 20)),
      BinaryLogicalOperator.And,
      new ScalarExpression(new QItem('experience', ComparisonOperator.GtEq, 20)));
  BinaryExpression exp = new BinaryExpression(
      exp1,
      BinaryLogicalOperator.And,
      exp2);

  QuerySet query = new QuerySet(exp);
  print(query.toSql());
}
