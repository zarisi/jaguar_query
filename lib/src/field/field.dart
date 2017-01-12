library jaguar_orm.field;

import 'package:jaguar_query/jaguar_query.dart';
import 'package:jaguar_query/src/operators/operators.dart' as q;

/// Field is a convenience DSL used to construct queries in a concise and
/// understandable way.
class Field<ValType extends L> {
  /// Name of the field
  final String name;

  const Field(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> author = new Field<VInt>('age');
  ///     find.where(age.eq(20));
  Cond<ValType> eq(Valuable<ValType> value, {String tableAlias}) =>
      q.eq<ValType>(C(name, tableAlias), value);

  /* TODO
  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ne(20));
  Cond<ValType> ne(ValType value) => q.ne<ValType>(name, value);

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gt(20));
  Cond<ValType> gt(ValType value) => q.gt<ValType>(name, value);

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gtEq(20));
  Cond<ValType> gtEq(ValType value) => q.gtEq<ValType>(name, value);

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ltEq(20));
  Cond<ValType> ltEq(ValType value) => q.ltEq<ValType>(name, value);

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.lt(20));
  Cond<ValType> lt(ValType value) => q.lt<ValType>(name, value);

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<String> author = new Field<String>('author');
  ///     find.where(author.like('%Mark%'));
  Cond<LStr> like(LStr value) => q.like(name, value);

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression inBetween(ValType low, ValType high) =>
      q.inBetween<ValType>(name, low, high);

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     update.set(age.set(20));
  SetColumn set(ValType value) =>
      new SetColumn<ValType>().column(name).set(value);
      */
}

/// IntField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class IntField {
  /// Name of the field
  final String name;

  const IntField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.eq(20));
  Cond<int> eq(Valuable<int> value, {String tableAlias}) =>
      q.eq<int>(C(name, tableAlias), value);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.eq(20));
  Cond<int> eqL(int value, {String tableAlias}) =>
      q.eq<int>(C(name, tableAlias), L.Int(value));

  /* TODO
  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ne(20));
  Cond<LInt> ne(int value) => q.ne<VInt>(name, L.Int(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gt(20));
  Cond<LInt> gt(int value) => q.gt<VInt>(name, L.Int(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gtEq(20));
  Cond<LInt> gtEq(int value) => q.gtEq<VInt>(name, L.Int(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ltEq(20));
  Cond<LInt> ltEq(int value) => q.ltEq<VInt>(name, L.Int(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.lt(20));
  Cond<LInt> lt(int value) => q.lt<VInt>(name, L.Int(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<LInt> inBetween(int low, int high) =>
      q.inBetween<VInt>(name, L.Int(low), L.Int(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     IntField age = new IntField('age');
  ///     update.set(age.set(20));
  SetColumn<LInt> set(int value) =>
      new SetColumn<LInt>().column(name).set(L.Int(value));
      */
}

/// DoubleField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class DoubleField {
  /// Name of the field
  final String name;

  const DoubleField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.eq(20));
  Cond<double> eq(Valuable<double> value, {String tableAlias}) =>
      q.eq<double>(C(name, tableAlias), value);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.eq(20));
  Cond<double> eqL(double value, {String tableAlias}) =>
      q.eq<double>(C(name, tableAlias), L.Double(value));

  /* TODO
  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ne(20));
  Cond<LDouble> ne(double value) => q.ne<VDouble>(name, L.Double(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gt(20));
  Cond<LDouble> gt(double value) => q.gt<VDouble>(name, L.Double(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gtEq(20));
  Cond<LDouble> gtEq(double value) => q.gtEq<VDouble>(name, L.Double(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ltEq(20));
  Cond<LDouble> ltEq(double value) => q.ltEq<VDouble>(name, L.Double(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.lt(20));
  Cond<LDouble> lt(double value) => q.lt<VDouble>(name, L.Double(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<LDouble> inBetween(double low, double high) =>
      q.inBetween<VDouble>(name, L.Double(low), L.Double(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     update.set(age.set(20));
  SetColumn<LDouble> set(double value) =>
      new SetColumn<LDouble>().column(name).set(L.Double(value));
      */
}

/// StrField is a convenience DSL used to construct queries in a concise and
/// understandable way.
class StrField {
  /// Name of the field
  final String name;

  const StrField(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.eq('Mark'));
  Cond<String> eq(Valuable<String> value, {String tableAlias}) =>
      q.eq<String>(C(name, tableAlias), value);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.eq('Mark'));
  Cond<String> eqL(String value, {String tableAlias}) =>
      q.eq<String>(C(name, tableAlias), L.Str(value));

  /* TODO
  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ne('Mark'));
  Cond<LStr> ne(String value) => q.ne<VString>(name, L.Str(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gt('Mark'));
  Cond<LStr> gt(String value) => q.gt<VString>(name, L.Str(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gtEq('Mark'));
  Cond<LStr> gtEq(String value) => q.gtEq<VString>(name, L.Str(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ltEq('Mark'));
  Cond<LStr> ltEq(String value) => q.ltEq<VString>(name, L.Str(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.lt('Mark'));
  Cond<LStr> lt(String value) => q.lt<VString>(name, L.Str(value));

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.like('%Mark%'));
  Cond<LStr> like(String value) => q.like(name, L.Str(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.inBetween('C', 'M'));
  InBetweenExpression<LStr> inBetween(String low, String high) =>
      q.inBetween<VString>(name, L.Str(low), L.Str(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     StrField author = new StrField('author');
  ///     update.set(author.set('Mark'));
  SetColumn<LStr> set(String value) =>
      new SetColumn<LStr>().column(name).set(L.Str(value));
      */
}
