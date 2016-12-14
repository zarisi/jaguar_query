// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:query/query.dart';

main() {
  final exp1 = new BExp(
      new SExp(new Q('age', ComparisonOperator.GtEq, new VInt(20))),
      BinaryLogicalOperator.And,
      new SExp(new Q('age', ComparisonOperator.LtEq, new VInt(50))));
  final exp2 = new BExp(
      new SExp(new Q('experience', ComparisonOperator.GtEq, new VInt(5))),
      BinaryLogicalOperator.And,
      new SExp(new Q('experience', ComparisonOperator.GtEq, new VInt(50))));
  final exp = new BExp(exp1, BinaryLogicalOperator.And, exp2);

  W where = new W();
  where.e = exp;
  print(where.toSql());

  SimpSel st = new SimpSel();
  st.column.addAll([new C('age')]);
  st.from = new SimT('people');
  st.where.e = exp;
  print(st.toSql());
}
