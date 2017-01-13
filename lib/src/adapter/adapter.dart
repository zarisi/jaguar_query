library jaguar_orm.adapter;

import 'dart:async';
import 'package:jaguar_query/jaguar_query.dart';

/// Adapter interface that must be implemented to support new databases
abstract class Adapter<ConnType> {
  /// Makes a new connection to database
  Future<Null> connect();

  /// Closes the connection
  Future<Null> close();

  ConnType get connection;

  /// Returns a row found by executing [statement]
  Future<Map> findOne(FindStatement statement);

  /// Returns a list of rows found by executing [statement]
  Future<Stream<Map>> find(FindStatement statement);

  /// Executes the insert statement and returns the primary key of
  /// inserted row
  Future<dynamic> insert(InsertStatement statement);

  /// Updates the row and returns the number of rows updated
  Future<int> update(UpdateStatement statement);

  /// Deletes the requested row
  Future<int> delete(DeleteStatement statement);

  /// Creates the table
  //TODO Future<Null> createTable(CreateTableStatement statement);
}
