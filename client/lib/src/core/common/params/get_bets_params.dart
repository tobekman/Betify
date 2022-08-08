class GetBetsParams {
  final int? pageNumber;
  final int? pageSize;
  final DateTime? startDate;
  final DateTime? endDate;

  GetBetsParams({
    this.pageNumber,
    this.pageSize,
    this.startDate,
    this.endDate,
  });
}
