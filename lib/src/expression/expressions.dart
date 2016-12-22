part of query;

abstract class Expression implements ToSqlable {
  const Expression();

  int get length;

  AndExpression operator &(Expression other) {
    return and(other);
  }

  @checked
  AndExpression and(Expression exp);

  OrExpression operator |(Expression other) {
    return or(other);
  }

  @checked
  OrExpression or(Expression exp);
}
