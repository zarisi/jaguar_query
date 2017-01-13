part of query;

/// An in-between conditional expression
class InBetweenExpression<ValType> extends Expression {
  /// The field/column of the condition
  final Valuable<ValType> field;

  /// The low value of the in-between condition
  final Valuable<ValType> low;

  /// The high value of the in-between condition
  final Valuable<ValType> high;

  const InBetweenExpression(this.field, this.low, this.high);

  /// Always returns 1 because in-between is not a composite expression
  int get length => 1;

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();
    return ret.or(this).or(exp);
  }

  String toSql() =>
      '(${field.toSql()} BETWEEN ${low.toSql()} AND ${high.toSql()})';
}
