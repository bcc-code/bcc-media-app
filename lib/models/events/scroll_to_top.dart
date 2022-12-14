class ScrollToTopRequestEvent {
  String tab;
  ScrollToTopRequestEvent(this.tab);
}

enum TabsPage {
  home,
  search,
  live, 
  calendar
}