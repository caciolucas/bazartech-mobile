import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/screens/my_posts_list_screen.dart';
import 'package:bazartech/screens/my_profile_screen.dart';
import 'package:bazartech/screens/product_grid_screen.dart';
import 'package:bazartech/services/products_service.dart';
import 'package:bazartech/services/user_service.dart';
import 'package:bazartech/state/logged_user.dart';
import 'package:bazartech/state/product_list.dart';
import 'package:bazartech/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  final List<Widget?> _tabs = [
    const ProductsGridScreen(),
    const MyPostsListScreen(),
    const MyProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      fetchProducts(context);
    });
  }

  Future<void> fetchUser(BuildContext context) async {
    final user = await UserService().getCurrentUser();
    Provider.of<LoggedUser>(context, listen: false)
        .setUser(User.fromMap(user['body']));
    UserService().registerDevice();
  }

  Future<void> fetchProducts(BuildContext context) async {
    ProductService().getProducts().then(
      (data) {
        if (data['ok']) {
          Provider.of<ProductList>(context, listen: false).setProducts(
            data['body'],
          );
        } else {
          throw Exception(data['message']);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<LoggedUser>(context).user;
    bool showFavorites = Provider.of<ProductList>(context).showFavorites;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Logo(),
            const Spacer(),
            _tabIndex == 0
                ? GestureDetector(
                    child: Icon(
                        showFavorites ? Icons.favorite : Icons.favorite_border),
                    onTap: () {
                      Provider.of<ProductList>(context, listen: false)
                          .toggleShowFavorites();
                    },
                  )
                : Container()
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([fetchProducts(context), fetchUser(context)]);
        },
        child: _tabs.elementAt(_tabIndex) ?? const SizedBox.shrink(),
      ),
      floatingActionButton: _tabIndex != 2
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/add-product");
              },
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
