part of jaguary_query.operators;

/// DSL to create 'is equal to' relational condition
Cond<int> eqInt(String field, int rhs) =>
    new Cond<int>(C<int>(field), ComparisonOperator.Eq, L.Int(rhs));

/// DSL to create 'is not equal to' relational condition
Cond<int> neInt(String field, int value) =>
    new Cond<int>(C<int>(field), ComparisonOperator.Ne, L.Int(value));

/// DSL to create 'is greater than' relational condition
Cond<int> gtInt(String field, int rhs) =>
    new Cond<int>(C<int>(field), ComparisonOperator.Gt, L.Int(rhs));

/// DSL to create 'is greater than or equal to' relational condition
Cond<int> gtEqInt(String field, int rhs) =>
    new Cond<int>(C<int>(field), ComparisonOperator.GtEq, L.Int(rhs));

/// DSL to create 'is less than or equal to' relational condition
Cond<int> ltEqInt(String field, int rhs) =>
    new Cond<int>(C<int>(field), ComparisonOperator.LtEq, L.Int(rhs));

/// DSL to create 'is less than' relational condition
Cond<int> ltInt(String field, int rhs) =>
    new Cond<int>(C<int>(field), ComparisonOperator.Lt, L.Int(rhs));

/// DSL to create 'in-between' relational condition
InBetweenExpression<int> inBetweenInt(String field, int low, int high) =>
    new InBetweenExpression<int>(C<int>(field), L.Int(low), L.Int(high));
