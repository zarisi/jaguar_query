part of query;

class Column implements ToSqlable {
  final String name;

  final String alias;

  Column(this.name, [this.alias]);

  String toSql() {
    String ret = this.name;

    if(alias is String) {
      ret += ' as ${this.alias}';
    }

    return ret;
  }
}

abstract class Statement implements ToSqlable {}
