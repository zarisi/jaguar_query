// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar_query/jaguar_query.dart';

main() {
  FindStatement find = Sql.find
      .from('posts')
      .select('message')
      .where(gtInt('likes', 10) & ltInt('replies', 5))
      .where(eq('author', L.Str('teja')) | like('author', L.Str('kleak*')))
      .orderBy('author', true)
      .limit(10)
      .groupByMany(['message', 'likes']);

  print(find.toSql());

  InsertStatement insert = Sql.insert
      .into('posts')
      .setValue('message', L.Str('How are you?'))
      .setValue('author', L.Str('teja'))
      .setValues({'likes': L.Int(0), 'replies': L.Int(0)});

  print(insert.toSql());

  UpdateStatement update = Sql.update
      .into('posts')
      .where(eq('author', L.Str('teja')))
      .setValue('likes', L.Int(1));

  print(update.toSql());

  DeleteStatement delete =
      Sql.delete.from('posts').where(eq('author', L.Str('teja')));

  print(delete.toSql());
}
