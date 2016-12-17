// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:query/query.dart';

main() {
  /* TODO
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
  */

  FindStatement find = Sql.find
      .from('posts')
      .select('message')
      .where(C.gt('likes', new VInt(10)) & C.lt('replies', new VInt(5)))
      .where(C.eq('author', V.Str('teja')) | C.like('author', V.Str('kleak*')));

  print(find.toSql());

  InsertStatement insert = Sql.insert
      .into('posts')
      .setValue('message', V.Str('How are you?'))
      .setValue('author', V.Str('teja'))
      .setValues({'likes': V.Int(0), 'replies': V.Int(0)});

  print(insert.toSql());
}
