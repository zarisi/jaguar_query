part of query;

abstract class Valuable<ValType> implements ToSqlable {}

/// A relational conditional expression
class Cond<ValType> extends Expression {
  /// The field/column of the condition
  final Valuable lhs;

  /// The operator of the relational expression
  final ComparisonOperator op;

  /// The value of the relational expression the [field] is being compared against
  final Valuable rhs;

  const Cond(this.lhs, this.op, this.rhs);

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

  String toSql() => '${lhs.toSql()} ${op.toSql()} ${rhs.toSql()}';

  /// DSL to create 'is equal to' relational condition
  static Cond eq<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.Eq, value);

  /// DSL to create 'is not equal to' relational condition
  static Cond ne<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.Ne, value);

  /// DSL to create 'is greater than' relational condition
  static Cond gt<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.Gt, value);

  /// DSL to create 'is greater than or equal to' relational condition
  static Cond gtEq<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.GtEq, value);

  /// DSL to create 'is less than or equal to' relational condition
  static Cond ltEq<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.LtEq, value);

  /// DSL to create 'is less than' relational condition
  static Cond lt<ValType>(
          Valuable<ValType> field, Valuable<ValType> value) =>
      new Cond<ValType>(field, ComparisonOperator.Lt, value);

  /// DSL to create 'is like' relational condition
  static Cond<String> like(Valuable<String> field, Valuable<String> value) =>
      new Cond<String>(field, ComparisonOperator.Like, value);

  /// DSL to create 'in-between' relational condition
  static InBetweenExpression<ValType> inBetween<ValType>(
          Valuable<ValType> field,
          Valuable<ValType> low,
          Valuable<ValType> high) =>
      new InBetweenExpression<ValType>(field, low, high);
}
