part of query;

/// An SQL expression
abstract class Expression implements ToSqlable {
  const Expression();

  /// Returns the number of sub-expressions this expression has if this expression
  /// is a composite expression
  int get length;

  /// Creates a 'logical and' expression of this expression and the [other]
  AndExpression operator &(Expression other) {
    return and(other);
  }

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  AndExpression and(Expression exp);

  /// Creates a 'logical or' expression of this expression and the [other]
  OrExpression operator |(Expression other) {
    return or(other);
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  OrExpression or(Expression exp);
}
