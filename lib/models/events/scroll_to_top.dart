class ScrollToTopRequestEvent {
  String tab;
  ScrollToTopRequestEvent(this.tab);
}

enum Tab {
  home,
  search,
  live, 
  calendar
}