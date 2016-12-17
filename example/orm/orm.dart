// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:query/query.dart';

class Find {
  const Find();
}

class WhereEq {
  final Symbol field;

  const WhereEq(this.field);
}

class Posts {
  String id;

  String author;

  String message;

  int likes;

  int replies;
}

class Bean<Model> {}

class PostsBean implements Bean<Posts> {
  final String tableName;

  PostsBean(this.tableName);

  @Find()
  Posts findById(@WhereEq(#id) String id) {
    FindStatement find = Sql.find.from(tableName).where(C.eq('id', V.Str(id)));

    return new Posts(); //TODO dummy
  }
}

main() {}
