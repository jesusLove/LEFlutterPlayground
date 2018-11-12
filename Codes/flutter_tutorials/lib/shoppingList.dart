
import 'package:flutter/material.dart';

// ===============示例二==================

// 定义一个商品类
class Product {
  const Product({this.name});
  final String name;
}
typedef void CartChangedCallBack(Product product, bool inChart);

class ShoppingListItem extends StatelessWidget {
  // 构造方法
  ShoppingListItem({Product product, this.inCart, this.onCartChanged}): product = product, super(key: new ObjectKey(product));
  // 三个成员变量，商品，是否在购物车中，回调方法，由于ListItem是无状态的Widget，需要回调给父Widget
  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  // 根据是否在购物车中，更改颜色
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  // 根据是否在哎购物车中，更改文本样式
  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {

    return new ListTile(
      // 回调方法，将点击的Product和是否在inCart传出去。
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
// 定义Shopping列表，有状态的。
class ShoppingList extends StatefulWidget {
  // 构造方法
  ShoppingList({Key key, this.products}):super(key: key);
  // 成员变量，是一个商品数组。
  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }

}
// ShoppingList的状态管理器
class _ShoppingListState extends State<ShoppingList> {
  // 一个集合
  Set<Product> _shoppingCart = new Set<Product>();
  // 处理购物车改变
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),
      body: new ListView(
        // 设置垂直方向的Padding为10.0
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        // 子Widget
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class ShopingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Shopping App',
//      home: new ShoppingList(
//        products: <Product>[
//          new Product(name: 'Eggs'),
//          new Product(name: 'Flour'),
//          new Product(name: 'Chocolate chips'),
//        ],
//      ),
//    );
      return new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      );
  }
}

