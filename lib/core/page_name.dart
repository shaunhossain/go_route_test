enum PagesName{
  splashPage("Splash Page","/"),
  homePage("Home Page","/home"),
  authPage("Auth Page","/auth"),
  detailsPage("Details Page","details"),
  profilePage("Profile Page","/profile"),
  settingPage("Settings Page","/settings");

  const PagesName(this.title,this.path);
  final String title;
  final String path;
}


enum TabPagesName{
  tabPageView1("Tap Page One","/tab/tab1"),
  tabPageView2("Tap Page Two","/tab/tab2"),
  tabPageView3("Tap Page Three","/tab/tab3"),
  tabPageView4("Tap Page Four","/tab/tab4"),
  tabPageView5("Tap Page Five","/tab/tab5"),
  tabPageView6("Tap Page Six","/tab/tab6");

  const TabPagesName(this.title,this.path);
  final String title;
  final String path;
}