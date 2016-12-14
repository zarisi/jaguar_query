part of query;

class C implements ToSqlable {
  final String name;

  C(this.name);

  String toSql() => this.name;
}

abstract class T implements ToSqlable {}

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
