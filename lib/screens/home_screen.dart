import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/screens/my_posts_list_screen.dart';
import 'package:bazartech/screens/my_profile_screen.dart';
import 'package:bazartech/screens/product_grid_screen.dart';
import 'package:bazartech/state/state.dart';
import 'package:bazartech/widgets/expandable_fab.dart';
import 'package:bazartech/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;
  User user = MockState().user;

  final List<Widget?> _tabs = [
    const ProductsGridScreen(),
    const MyPostsListScreen(),
    const MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Logo(),
          ],
        ),
      ),
      body: _tabs.elementAt(_tabIndex),
      floatingActionButton: _tabIndex != 2
          ? const ExpandableFab(
              initialOpen: false,
              distance: 120,
              children: [
                ActionButton(
                  icon: Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.white,
                  ),
                ),
                ActionButton(
                  icon: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                  ),
                ),
                ActionButton(
                  icon: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        backgroundColor: context.backgroundColor,
        unselectedItemColor: context.primaryColor.withOpacity(0.5),
        selectedItemColor: context.primaryColor.withOpacity(1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.store,
              size: 20,
            ),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.list,
              size: 20,
            ),
            label: 'Meus anúncios',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              size: 20,
            ),
            label: 'Meu perfil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
