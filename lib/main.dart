import 'package:flutter/material.dart';
import 'package:flutter_dribbble/widgets/shots.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dribbble',
      home: new Main()
    );
  }
}

class Main extends StatefulWidget {
  @override
  createState() => new MainState();
}

class MainState extends State<Main> with SingleTickerProviderStateMixin {

  TabController _tabController;
  
  @override
    void initState() {
      super.initState();
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
      appBar: new AppBar(
        title: new Text('Dribbble'),
        elevation: 0.0,
        bottom: new TabBar(
          controller: _tabController,
          tabs: Tabs.map((TabItem tabItem) {
            return new Tab(text: tabItem.title);
          }).toList()
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: Tabs.map((TabItem tabItem) {
          return new Shots();
        }).toList(),
      )
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
