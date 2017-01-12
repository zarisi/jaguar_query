part of query;

/// An interface for Literal value. Also contains static methods to
abstract class L<ValType> implements Valuable<ValType> {
  /// DSL to create integer literal values
  static LInt Int(int val) => new LInt(val);

  /// DSL to create string literal values
  static LStr Str(String val) => new LStr(val);

  /// DSL to create double literal values
  static LDateTime DateTime(core.DateTime val) => new LDateTime(val);

  /// DSL to create double literal values
  static LDouble Double(double val) => new LDouble(val);
}

class Column<ValType> implements Valuable<ValType> {
  final String field;

  final String tableName;

  const Column(this.field, [this.tableName]);

  String toSql() => (tableName != null ? tableName + '.' : '') + '$field';
}

Column<ValType> C<ValType>(String field, [String tableName]) =>
    new Column<ValType>(field, tableName);

/// Integer literal value
class LInt implements L<int> {
  /// The literal value
  final int value;

  const LInt(this.value);

  String toSql() => '$value';

  /// DSL to create 'is equal to' relational condition
  static Cond<int> eq(Valuable<int> lhs, int rhs) =>
      q.eq<int>(lhs, new LInt(rhs));

  /* TODO
  /// DSL to create 'is not equal to' relational condition
  static Cond<LInt> ne(String field, int value) =>
      q.ne<VInt>(field, new LInt(value));

  /// DSL to create 'is greater than' relational condition
  static Cond<LInt> gt(String field, int value) =>
      q.gt<VInt>(field, new LInt(value));

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<LInt> gtEq(String field, int value) =>
      q.gtEq<VInt>(field, new LInt(value));

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<LInt> ltEq(String field, int value) =>
      q.ltEq<VInt>(field, new LInt(value));

  /// DSL to create 'is less than' relational condition
  static Cond<LInt> lt(String field, int value) =>
      q.lt<VInt>(field, new LInt(value));

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<LInt> inBetween(String field, int low, int high) =>
      q.inBetween<VInt>(field, new LInt(low), new LInt(high));
      */
}

/// Double literal value
class LDouble implements L {
  /// The literal value
  final double value;

  const LDouble(this.value);

  String toSql() => '$value';

  /// DSL to create 'is equal to' relational condition
  static Cond<double> eq(Valuable<double> field, double value) =>
      q.eq<double>(field, new LDouble(value));

  /* TODO
  /// DSL to create 'is not equal to' relational condition
  static Cond<LDouble> ne(String field, double value) =>
      q.ne<VDouble>(field, new LDouble(value));

  /// DSL to create 'is greater than' relational condition
  static Cond<LDouble> gt(String field, double value) =>
      q.gt<VDouble>(field, new LDouble(value));

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<LDouble> gtEq(String field, double value) =>
      q.gtEq<VDouble>(field, new LDouble(value));

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<LDouble> ltEq(String field, double value) =>
      q.ltEq<VDouble>(field, new LDouble(value));

  /// DSL to create 'is less than' relational condition
  static Cond<LDouble> lt(String field, double value) =>
      q.lt<VDouble>(field, new LDouble(value));

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<LDouble> inBetween(
          String field, double low, double high) =>
      q.inBetween<VDouble>(field, new LDouble(low), new LDouble(high));
      */
}

/// DateTime literal value
class LDateTime implements L {
  /// The literal value
  final DateTime value;

  const LDateTime(this.value);

  String toSql() => '$value'; //TODO

  /// DSL to create 'is equal to' relational condition
  static Cond<DateTime> eq(Valuable<DateTime> field, DateTime value) =>
      q.eq<DateTime>(field, new LDateTime(value));

  /* TODO
  /// DSL to create 'is not equal to' relational condition
  static Cond<LDateTime> ne(String field, DateTime value) =>
      q.ne<VDateTime>(field, new LDateTime(value));

  /// DSL to create 'is greater than' relational condition
  static Cond<LDateTime> gt(String field, DateTime value) =>
      q.gt<VDateTime>(field, new LDateTime(value));

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<LDateTime> gtEq(String field, DateTime value) =>
      q.gtEq<VDateTime>(field, new LDateTime(value));

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<LDateTime> ltEq(String field, DateTime value) =>
      q.ltEq<VDateTime>(field, new LDateTime(value));

  /// DSL to create 'is less than' relational condition
  static Cond<LDateTime> lt(String field, DateTime value) =>
      q.lt<VDateTime>(field, new LDateTime(value));

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<LDateTime> inBetween(
          String field, DateTime low, DateTime high) =>
      q.inBetween<VDateTime>(field, new LDateTime(low), new LDateTime(high));
      */
}

/// String literal value
class LStr implements L {
  /// The literal value
  final String value;

  const LStr(this.value);

  String toSql() => "'$value'";

  /// DSL to create 'is equal to' relational condition
  static Cond<String> eq(Valuable<String> field, String value) =>
      q.eq<String>(field, new LStr(value));

  /* TODO
  /// DSL to create 'is not equal to' relational condition
  static Cond<LStr> ne(String field, String value) =>
      q.ne<VString>(field, new LStr(value));

  /// DSL to create 'is greater than' relational condition
  static Cond<LStr> gt(String field, String value) =>
      q.gt<VString>(field, new LStr(value));

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<LStr> gtEq(String field, String value) =>
      q.gtEq<VString>(field, new LStr(value));

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<LStr> ltEq(String field, String value) =>
      q.ltEq<VString>(field, new LStr(value));

  /// DSL to create 'is less than' relational condition
  static Cond<LStr> lt(String field, String value) =>
      q.lt<VString>(field, new LStr(value));

  /// DSL to create 'is like' relational condition
  static Cond<LStr> like(String field, String value) =>
      q.like(field, new LStr(value));

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<LStr> inBetween(
          String field, String low, String high) =>
      q.inBetween<VString>(field, new LStr(low), new LStr(high));
      */
}
