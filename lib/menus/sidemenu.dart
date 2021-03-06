import 'package:flutter/material.dart';
import 'package:hello_world/models/SideMenuModel.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buidMenus(context);
  }

  List<SideMenuModel> menus() {
    var menus = new List.of([
      new SideMenuModel(
          title: "Checkout",
          icon: Icons.shopping_basket,
          page: "PaymentMethodPage"),
      new SideMenuModel(
          title: "Order History",
          icon: Icons.history,
          page: "OrderHistoryPage"),
          new SideMenuModel(
          title: "Logout", icon: Icons.exit_to_app, page: "LogoutPage"),
    
    ]);
    return menus;
  }

  Widget _buidMenus(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Emmanuel Ogoma"),
            accountEmail: Text("ogoma.emmanuel@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.eatingdisorderhope.com/wp-content/uploads/2016/01/young-woman-429733_640x426.jpg")),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.eatingdisorderhope.com/wp-content/uploads/2016/01/young-woman-429733_640x426.jpg"),
              )
            ],
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Column(
              children: menus().map((menu) {
            return ListTile(
              title: Text(menu.title),
              leading: Icon(menu.icon),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menu.route));
              },
            );
          }).toList()),
          Divider(),
          ListTile(
            title: Text("About Us"),
            leading: Icon(Icons.help),
          )
        ],
      ),
    );
  }
}
