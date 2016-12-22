part of query;

/// Condition encapsulates a conditional expression
///
/// (<field> <operation> <value>)
class C<ValType extends V> extends Expression {
  final String field;

  final ComparisonOperator op;

  final ValType value;

  const C(this.field, this.op, this.value);

  static C eq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Eq, value);

  static C ne<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Ne, value);

  static C gt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Gt, value);

  static C gtEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.GtEq, value);

  static C ltEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.LtEq, value);

  static C lt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Lt, value);

  static C like(String field, VString value) =>
      new C(field, ComparisonOperator.Like, value);

  static InBetweenExpression inBetween<ValType extends V>(
          String field, ValType low, ValType high) =>
      new InBetweenExpression<ValType>(field, low, high);

  int get length => 1;

  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();
    return ret.or(this).or(exp);
  }

  String toSql() => '$field ${op.toSql()} ${value.toSql()}';
}
