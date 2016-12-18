part of query;

abstract class V implements ToSqlable {
  static VInt Int(int val) => new VInt(val);

  static VString Str(String val) => new VString(val);

  static VDouble Double(double val) => new VDouble(val);
}

class VInt implements V {
  final int value;

  const VInt(this.value);

  String toSql() => '$value';
}

class VDouble implements V {
  final double value;

  const VDouble(this.value);

  String toSql() => '$value';
}

class VDateTime implements V {
  final DateTime value;

  const VDateTime(this.value);

  String toSql() => '$value'; //TODO
}

class VString implements V {
  final String value;

  const VString(this.value);

  String toSql() => "'$value'";
}
