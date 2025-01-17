enum SupaBaseRequestType { noFiltering, filterOnce, towFilter, threeFilter }

class RequestQueryModel {
  ///the type of the request is with filters or not
  final SupaBaseRequestType type;

  ///name of the table the want data from it
  final String tableName;

  ///the data that we want form the request
  ///like id and name
  ///write it like that 'id , name '
  final String? queryResponse;

  /// the name of column from the table that we need to filter by it
  final String? columnName;

  /// the value of the column from the table that we need to filter by it
  final Object? valueColumnFilter;

  /// the name of column from the table that we need to filter by it second filter
  final String? columnName2;

  /// the value of the column from the table that we need to filter by it second filter
  final Object? valueColumnFilter2;

  ///
  final int limit;

  RequestQueryModel(
      {this.type = SupaBaseRequestType.noFiltering,
      required this.tableName,
      this.queryResponse,
      this.columnName,
      this.valueColumnFilter,
      this.columnName2,
      this.valueColumnFilter2,
      this.limit = 10});
}
