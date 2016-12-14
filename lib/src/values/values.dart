part of query;

abstract class V implements ToSqlable {}

class VInt implements ToSqlable {
  final int value;

  const VInt(this.value);

  String toSql() => '$value';
}
