part of query;

abstract class V implements ToSqlable {
  static VInt Int(int val) => new VInt(val);

  static VString Str(String val) => new VString(val);
}

class VInt implements V {
  final int value;

  const VInt(this.value);

  String toSql() => '$value';
}

class VString implements V {
  final String value;

  const VString(this.value);

  String toSql() => "'$value'";
}
