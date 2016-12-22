part of query;

class InBetweenExpression<ValType extends V> extends Expression {
  final String field;

  final ValType low;

  final ValType high;

  const InBetweenExpression(this.field, this.low, this.high);

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

  String toSql() => '($field BETWEEN ${low.toSql()} AND ${high.toSql()})';
}