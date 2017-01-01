part of query;

/// A relational conditional expression
class C<ValType extends V> extends Expression {
  /// The field/column of the condition
  final String field;

  /// The operator of the relational expression
  final ComparisonOperator op;

  /// The value of the relational expression the [field] is being compared against
  final ValType value;

  const C(this.field, this.op, this.value);

  /// DSL to create 'is equal to' relational condition
  static C eq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Eq, value);

  /// DSL to create 'is not equal to' relational condition
  static C ne<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Ne, value);

  /// DSL to create 'is greater than' relational condition
  static C gt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Gt, value);

  /// DSL to create 'is greater than or equal to' relational condition
  static C gtEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.GtEq, value);

  /// DSL to create 'is less than or equal to' relational condition
  static C ltEq<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.LtEq, value);

  /// DSL to create 'is less than' relational condition
  static C lt<ValType extends V>(String field, ValType value) => new C(
      field, ComparisonOperator.Lt, value);

  /// DSL to create 'is like' relational condition
  static C<VString> like(String field, VString value) =>
      new C<VString>(field, ComparisonOperator.Like, value);

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression inBetween<ValType extends V>(
          String field, ValType low, ValType high) =>
      new InBetweenExpression<ValType>(field, low, high);

  /// Always returns 1 because relational condition is not a composite expressions
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

  String toSql() => '$field ${op.toSql()} ${value.toSql()}';
}
