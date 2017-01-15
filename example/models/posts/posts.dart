import 'dart:io';
import 'package:jaguar_query_postgresql/jaguar_query_postgresql.dart';

class Author {
  Author();

  int id;

  String name;

  String penName;

  static String tableName = 'author';
}

class Post {
  int id;

  int authorId;

  String message;

  int likes;

  int replies;

  static String tableName = 'posts';
}

main() async {
  PgAdapter adapter =
      new PgAdapter('postgres://postgres:dart_jaguar@localhost/postgres');
  await adapter.connect();

  /* TODO
  {
    final ins = new InsertStatement();
    ins.into(Author.tableName).setValues(<String, V>{
      "id": V.Int(3),
      "name": V.Str("Ho"),
      "penName": V.Str("HoHo")
    });
    await adapter.insert(ins);
  }
  */

  /*
  {
    final ins = new InsertStatement();
    ins.into(Post.tableName).setValues(<String, V>{
      "id": V.Int(9),
      "authorid": V.Int(3),
      "message": V.Str("Message 9 from 3!"),
      "likes": V.Int(13),
      "replies": V.Int(45)
    });
    await adapter.insert(ins);
  }
  */

  {
    FindStatement st = new FindStatement();
    st
        .from(Post.tableName)
        .leftJoin(Author.tableName)
        .joinOn(LInt.eq('author.id', 1))
        .where(eq('posts.authorid', C('id', 'author')));

    List<Map> res = await (await adapter.find(st)).toList();
    print(res);
  }

  exit(0);
}
