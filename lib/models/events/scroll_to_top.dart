class ScrollToTopRequestEvent {
  final NavTab tab;
  const ScrollToTopRequestEvent(this.tab);
}

enum NavTab {
  home,
  search,
  live,
  calendar,
}
