part of query;

class C implements ToSqlable {
  final String name;

  final String alias;

  C(this.name, [this.alias]);

  String toSql() {
    String ret = this.name;

    if(alias is String) {
      ret += ' as ${this.alias}';
    }

    return ret;
  }
}

class JoinType implements ToSqlable {
  final int id;

  final String string;

  const JoinType._(this.id, this.string);

  String toSql() => string;

  static const JoinType InnerJoin = const JoinType._(0, 'INNER JOIN');

  static const JoinType LeftJoin = const JoinType._(1, 'LEFT JOIN');

  static const JoinType RightJoin = const JoinType._(2, 'RIGHT JOIN');

  static const JoinType FullJoin = const JoinType._(3, 'FULL JOIN');

  static const JoinType CrossJoin = const JoinType._(4, 'CROSS JOIN');
}

/// Table selector
abstract class T implements ToSqlable {}

/// Simple table selector with no joins
class SimT implements T {
  final String tableName;

  final String alias;

  SimT(this.tableName, [this.alias]);

  String toSql() {
    String ret = '$tableName';
    if (alias is String) {
      ret += ' $alias';
    }
    return ret;
  }
}

class JoinedT implements T {
  final SimT from;

  final JoinType type;

  final SimT to;

  final Expression on;

  JoinedT(this.from, this.type, this.to, this.on);

  String toSql() => '${from.toSql()} ${type.toSql()} ${to.toSql()} ON ${on.toSql()}';
}

abstract class Statement implements ToSqlable {}

class SimpSel implements Statement {
  final List<C> column = [];

  T from;

  final W where = new W();

  SimpSel();

  String toSql() {
    StringBuffer sb = new StringBuffer();
    sb.write('SELECT ');

    if (column.length == 0) {
      sb.write('* ');
    } else {
      sb.write(column.map((C col) => col.toSql()).toList().join(', '));
    }

    sb.write(' FROM ');
    sb.write(from.toSql());

    if (where is W) {
      sb.write(' WHERE ');
      sb.write(where.toSql());
    }

    sb.write(';');

    return sb.toString();
  }
}
