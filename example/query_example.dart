// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:query/query.dart';

main() {
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
