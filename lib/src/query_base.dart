// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library query;

import 'package:meta/meta.dart';

part 'expression/expressions.dart';

part 'operators/comparision.dart';
part 'operators/logical.dart';

part 'statement/statements.dart';
part 'statement/find_statement.dart';

part 'table/table.dart';

part 'values/values.dart';

abstract class ToSqlable {
  String toSql();
}

class Sql {
  static FindStatement get find => new FindStatement();
}