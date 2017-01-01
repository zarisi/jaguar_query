part of query;

/// A 'logical or' expression of two or more expressions
class OrExpression extends Expression {
  /// List of expressions composing this 'logical and' expression
  final List<Expression> _expressions = [];

  OrExpression();

  /// List of expressions composing this 'logical and' expression
  List<Expression> get expressions => _expressions.toList();

  /// Number of expressions composing this 'logical or' expression
  int get length => _expressions.length;

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  AndExpression and(Expression exp) {
    AndExpression ret = new AndExpression();
    return ret.and(this).and(exp);
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  OrExpression or(Expression exp) {
    if (exp is OrExpression) {
      _expressions.addAll(exp._expressions);
    } else {
      _expressions.add(exp);
    }

    return this;
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
      }).join(' ' + BinaryLogicalOperator.Or.toSql() + ' ');
}
