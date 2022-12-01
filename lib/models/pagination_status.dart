class PaginationStatus<T> {
  bool reachedMax;
  int currentOffset;
  List<T> items;
  PaginationStatus({required this.currentOffset, required this.items, this.reachedMax = false});
}
