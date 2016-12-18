// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Example of building ORM query builder
import 'package:jaguar_query/jaguar_query.dart';

class Find {
  const Find();
}

class WhereEq {
  final Symbol field;

  const WhereEq(this.field);
}

class PrimaryKey {
  const PrimaryKey();
}

class Post {
  @PrimaryKey()
  String id;

  String author;

  String message;

  int likes;

  int replies;

  static String tableName = 'posts';
}

class Bean<Model> {
  const Bean();
}

class Comparable<ValType extends V> {
  final String name;

  const Comparable(this.name);

  C eq(ValType value) => C.eq(name, value);
}

class _$PostsBean {
  String find(String id) =>
      Sql.find.from(Post.tableName).where(C.eq('id', V.Str(id))).toSql();

  FindStatement get finder => Sql.find.from(Post.tableName);

  Comparable get author => new Comparable('author');

  String _findByAuthor(String auth) => finder.where(author.eq(auth)).toSql();
}

class PostsBean extends Object with _$PostsBean implements Bean<Post> {
  final String tableName;

  PostsBean(this.tableName);

  @Find()
  String findByAuthor(@WhereEq(#author) String auth) => _findByAuthor(auth);
}

main() {}
