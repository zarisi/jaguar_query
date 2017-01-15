library jaguar_orm.field;

import 'package:jaguar_query/jaguar_query.dart';

/// Field is a convenience DSL used to construct queries in a concise and
/// understandable way.
class Field<ValType> {
  /// Name of the field
  final String name;

  const Field(this.name);

  /// Returns an "is equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> author = new Field<VInt>('age');
  ///     find.where(age.eq(20));
  Cond<ValType> eq(Valuable<ValType> value, {String tableAlias}) =>
      Cond.eq<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ne(20));
  Cond<ValType> ne(Valuable<ValType> value, {String tableAlias}) =>
      Cond.ne<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gt(20));
  Cond<ValType> gt(Valuable<ValType> value, {String tableAlias}) =>
      Cond.gt<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.gtEq(20));
  Cond<ValType> gtEq(Valuable<ValType> value, {String tableAlias}) =>
      Cond.gtEq<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.ltEq(20));
  Cond<ValType> ltEq(Valuable<ValType> value, {String tableAlias}) =>
      Cond.ltEq<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.lt(20));
  Cond<ValType> lt(Valuable<ValType> value, {String tableAlias}) =>
      Cond.lt<ValType>(C<ValType>(name, tableAlias), value);

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<String> author = new Field<String>('author');
  ///     find.where(author.like('%Mark%'));
  Cond<String> like(Valuable<String> value, {String tableAlias}) =>
      Cond.like(C<String>(name, tableAlias), value);

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<ValType> inBetween(
          Valuable<ValType> low, Valuable<ValType> high,
          {String tableAlias}) =>
      Cond.inBetween<ValType>(C<ValType>(name, tableAlias), low, high);

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     Field<VInt> age = new Field<VInt>('age');
  ///     update.set(age.set(20));
  SetColumn<L<ValType>> set(L<ValType> value) =>
      new SetColumn<L<ValType>>().column(name).set(value);
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
  Cond<int> eq(int value, {String tableAlias}) =>
      Cond.eq<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ne(20));
  Cond<int> ne(int value, {String tableAlias}) =>
      Cond.ne<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gt(20));
  Cond<int> gt(int value, {String tableAlias}) =>
      Cond.gt<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.gtEq(20));
  Cond<int> gtEq(int value, {String tableAlias}) =>
      Cond.gtEq<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.ltEq(20));
  Cond<int> ltEq(int value, {String tableAlias}) =>
      Cond.ltEq<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.lt(20));
  Cond<int> lt(int value, {String tableAlias}) =>
      Cond.lt<int>(C<int>(name, tableAlias), L.Int(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     IntField age = new IntField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<int> inBetween(int low, int high, {String tableAlias}) =>
      Cond.inBetween<int>(C<int>(name, tableAlias), L.Int(low), L.Int(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     IntField age = new IntField('age');
  ///     update.set(age.set(20));
  SetColumn<LInt> set(int value) =>
      new SetColumn<LInt>().column(name).set(L.Int(value));
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
  Cond<double> eq(double value, {String tableAlias}) =>
      Cond.eq<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ne(20));
  Cond<double> ne(double value, {String tableAlias}) =>
      Cond.ne<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gt(20));
  Cond<LDouble> gt(double value, {String tableAlias}) =>
      Cond.gt<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.gtEq(20));
  Cond<LDouble> gtEq(double value, {String tableAlias}) =>
      Cond.gtEq<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.ltEq(20));
  Cond<LDouble> ltEq(double value, {String tableAlias}) =>
      Cond.ltEq<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.lt(20));
  Cond<LDouble> lt(double value, {String tableAlias}) =>
      Cond.lt<double>(C<double>(name, tableAlias), L.Double(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     find.where(age.inBetween(20, 30));
  InBetweenExpression<double> inBetween(double low, double high,
          {String tableAlias}) =>
      Cond.inBetween<double>(
          C<double>(name, tableAlias), L.Double(low), L.Double(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     DoubleField age = new DoubleField('age');
  ///     update.set(age.set(20));
  SetColumn<LDouble> set(double value) =>
      new SetColumn<LDouble>().column(name).set(L.Double(value));
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
  Cond<String> eq(String value, {String tableAlias}) =>
      Cond.eq<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "not equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ne('Mark'));
  Cond<String> ne(String value, {String tableAlias}) =>
      Cond.ne<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "greater than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gt('Mark'));
  Cond<String> gt(String value, {String tableAlias}) =>
      Cond.gt<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "greater than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.gtEq('Mark'));
  Cond<String> gtEq(String value, {String tableAlias}) =>
      Cond.gtEq<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "less than equal to" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.ltEq('Mark'));
  Cond<String> ltEq(String value, {String tableAlias}) =>
      Cond.ltEq<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "less than" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.lt('Mark'));
  Cond<String> lt(String value, {String tableAlias}) =>
      Cond.lt<String>(C<String>(name, tableAlias), L.Str(value));

  /// Returns a "like" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.like('%Mark%'));
  Cond<String> like(String value, {String tableAlias}) =>
      Cond.like(C<String>(name, tableAlias), L.Str(value));

  /// Returns an "in between" condition
  ///
  ///     FindStatement find = new FindStatement();
  ///     StrField author = new StrField('author');
  ///     find.where(author.inBetween('C', 'M'));
  InBetweenExpression<String> inBetween(String low, String high,
          {String tableAlias}) =>
      Cond.inBetween<String>(
          C<String>(name, tableAlias), L.Str(low), L.Str(high));

  /// Returns a "set column" clause
  ///
  ///     UpdateStatement update = new UpdateStatement();
  ///     StrField author = new StrField('author');
  ///     update.set(author.set('Mark'));
  SetColumn<LStr> set(String value) =>
      new SetColumn<LStr>().column(name).set(L.Str(value));
}
