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

  final String tableAlias;

  const Column(this.field, [this.tableAlias]);

  String toSql() => (tableAlias != null ? tableAlias + '.' : '') + '$field';

  /// DSL to create 'is equal to' relational condition
  Cond<int> eqC(Column<ValType> rhs) => Cond.eq<ValType>(this, rhs);

  /// DSL to create 'is equal to' relational condition
  Cond<int> eqV(Valuable<ValType> rhs) => Cond.eq<ValType>(this, rhs);
}

class IntC extends Column<int> {
  const IntC(String field, [String tableAlias]) : super(field, tableAlias);

  String toSql() => (tableAlias != null ? tableAlias + '.' : '') + '$field';

  /// DSL to create 'is equal to' relational condition
  Cond<int> eq(int rhs) => Cond.eq<int>(this, L.Int(rhs));

  static Cond<int> eqL(String field, int rhs) =>
      Cond.eq<int>(C<int>(field), L.Int(rhs));
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
  static Cond<int> eq(String field, int rhs) => q.eqInt(field, rhs);

  /// DSL to create 'is not equal to' relational condition
  static Cond<int> ne(String field, int value) => q.neInt(field, value);

  /// DSL to create 'is greater than' relational condition
  static Cond<int> gt(String field, int value) => q.gtInt(field, value);

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<int> gtEq(String field, int value) => q.gtEqInt(field, value);

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<int> ltEq(String field, int value) => q.ltEqInt(field, value);

  /// DSL to create 'is less than' relational condition
  static Cond<int> lt(String field, int value) => q.ltInt(field, value);

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<int> inBetween(String field, int low, int high) =>
      q.inBetweenInt(field, low, high);

  /// DSL to create 'is equal to' relational condition
  static Cond<int> eqC(String field, Column<int> column) =>
      q.eqC<int>(field, column);
}

/// Double literal value
class LDouble implements L<double> {
  /// The literal value
  final double value;

  const LDouble(this.value);

  String toSql() => '$value';

  /// DSL to create 'is equal to' relational condition
  static Cond<double> eq(String field, double value) =>
      q.eq<double>(field, new LDouble(value));

  /// DSL to create 'is not equal to' relational condition
  static Cond<double> ne(String field, double value) =>
      q.ne<double>(field, new LDouble(value));

  /// DSL to create 'is greater than' relational condition
  static Cond<double> gt(String field, double value) =>
      q.gt<double>(field, new LDouble(value));

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond<double> gtEq(String field, double value) =>
      q.gtEq<double>(field, new LDouble(value));

  /// DSL to create 'is less than or equal to' relational condition
  static Cond<double> ltEq(String field, double value) =>
      q.ltEq<double>(field, new LDouble(value));

  /// DSL to create 'is less than' relational condition
  static Cond<double> lt(String field, double value) =>
      q.lt<double>(field, new LDouble(value));

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<double> inBetween(
          String field, double low, double high) =>
      q.inBetween<double>(field, new LDouble(low), new LDouble(high));
}

/// DateTime literal value
class LDateTime implements L<DateTime> {
  /// The literal value
  final DateTime value;

  const LDateTime(this.value);

  String toSql() => '$value'; //TODO

  /// DSL to create 'is equal to' relational condition
  static Cond<DateTime> eq(String field, DateTime value) =>
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
class LStr implements L<String> {
  /// The literal value
  final String value;

  const LStr(this.value);

  String toSql() => "'$value'";

  /// DSL to create 'is equal to' relational condition
  static Cond<String> eq(String field, String value) =>
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
