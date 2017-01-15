part of query;

class SelColumn implements ToSqlable {
  final String name;

  final String alias;

  SelColumn(this.name, [this.alias]);

  String toSql() {
    String ret = this.name;

    if (alias is String) {
      ret += ' as ${this.alias}';
    }

    return ret;
  }
}

class SetColumn<ValType extends L> {
  String _column;

  ValType _value;

  SetColumn();

  SetColumn<ValType> column(String column) {
    _column = column;
    return this;
  }

  SetColumn<ValType> set(ValType value) {
    _value = value;
    return this;
  }
}

abstract class Statement implements ToSqlable {}
