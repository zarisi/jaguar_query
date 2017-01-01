part of query;

/// An interface for Literal value. Also contains static methods to
abstract class V implements ToSqlable {
  /// DSL to create integer literal values
  static VInt Int(int val) => new VInt(val);

  /// DSL to create string literal values
  static VString Str(String val) => new VString(val);

  /// DSL to create double literal values
  static VDateTime DateTime(core.DateTime val) => new VDateTime(val);

  /// DSL to create double literal values
  static VDouble Double(double val) => new VDouble(val);
}

/// Integer literal value
class VInt implements V {
  /// The literal value
  final int value;

  const VInt(this.value);

  String toSql() => '$value';
}

/// Double literal value
class VDouble implements V {
  /// The literal value
  final double value;

  const VDouble(this.value);

  String toSql() => '$value';
}

/// DateTime literal value
class VDateTime implements V {
  /// The literal value
  final DateTime value;

  const VDateTime(this.value);

  String toSql() => '$value'; //TODO
}

/// String literal value
class VString implements V {
  /// The literal value
  final String value;

  const VString(this.value);

  String toSql() => "'$value'";
}
