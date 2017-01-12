part of query;

/// A 'logical and' expression of two or more expressions
class AndExpression extends Expression {
  /// List of expressions composing this 'logical and' expression
  final List<Expression> _expressions = [];

  AndExpression();

  /// List of expressions composing this 'logical and' expression
  List<Expression> get expressions => _expressions.toList();

  /// Number of expressions composing this 'logical and' expression
  int get length => _expressions.length;

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  AndExpression and(Expression exp) {
    if (exp is AndExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  OrExpression or(Expression exp) {
    OrExpression ret = new OrExpression();

    return ret.or(this).or(exp);
  }

  String toSql() => _expressions.map((Expression exp) {
        StringBuffer sb = new StringBuffer();

        if (exp.length != 1) {
          sb.write('(');
        }

        sb.write(exp.toSql());

        if (exp.length != 1) {
          sb.write(')');
        }

        return sb.toString();
      }).join(' ' + BinaryLogicalOperator.And.toSql() + ' ');
}
