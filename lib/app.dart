import 'package:flutter/material.dart';
import 'package:flutter_dribbble/widgets/shots.dart';


class DribbbleApp extends StatefulWidget {
  @override
  DribbbleAppState createState() => new DribbbleAppState();
}

class DribbbleAppState extends State<DribbbleApp> with SingleTickerProviderStateMixin {

  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    print('[Main] initState');
    _tabController = new TabController(vsync: this, length: Tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: const Text('Tabs and scrolling'),
              pinned: true,
              floating: true,
              elevation: 0.0,
              forceElevated: innerBoxIsScrolled,
              bottom: new TabBar(
                controller: _tabController,
                tabs: Tabs.map((TabItem tabItem) {
                  return new Tab(text: tabItem.title);
                }).toList()
              )
            )
          ];
        },
        body: new TabBarView(
          controller: _tabController,
          children: Tabs.map((TabItem tabItem) {
            return new Shots(tabTitle: tabItem.title);
          }).toList()
        )
      ),
    );
  }
}

class TabItem {
  const TabItem({ this.title });
  final String title;
}

const List<TabItem> Tabs = const <TabItem>[
  const TabItem(title: 'POPLUAR'),
  const TabItem(title: 'RECENT'),
  const TabItem(title: 'TEAMS'),
];
