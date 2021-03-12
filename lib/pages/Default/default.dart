import 'package:facebook_chat_app/data/data.dart';
import 'package:facebook_chat_app/models/models.dart';
import 'package:facebook_chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  final String title;

  const DefaultScreen({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: icons.length,
        child: Scaffold(
          appBar: !Responsive.isMobile(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100.0),
                  child: isDesktop
                      ? CustomAppBar(
                          title: this.widget.title,
                          currentUser: currentUser,
                          icons: icons,
                          selectedIndex: _selectedIndex,
                          onTap: (index) =>
                              setState(() => _selectedIndex = index),
                        )
                      : TabletAppBar(
                          title: this.widget.title,
                          currentUser: currentUser,
                        ),
                )
              : null,
          body: Responsive(
            mobile: DefaultScreenMobile(title: this.widget.title),
            tablet: DefaultScreenDesktop(selectedIndex: _selectedIndex),
            desktop: DefaultScreenDesktop(selectedIndex: _selectedIndex),
          ),
          bottomNavigationBar: !isDesktop
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomTabBar(
                    icons: icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class DefaultScreenMobile extends StatelessWidget {
  final String title;

  const DefaultScreenMobile({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            this.title,
            style: TextStyle(
              color: Color.fromARGB(255, 56, 88, 152),
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print("Search"),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          sliver: SliverToBoxAdapter(
            child: SearchProfile(
              onChange: (value) => print(value),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: OnlineContacts(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Message chat = chats[index];
              return RecentChats(chat: chat);
            },
            childCount: chats.length,
          ),
        ),
      ],
    );
  }
}

class DefaultScreenDesktop extends StatelessWidget {
  final int selectedIndex;

  const DefaultScreenDesktop({
    Key key,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: this.selectedIndex,
      children: screens,
    );
  }
}
