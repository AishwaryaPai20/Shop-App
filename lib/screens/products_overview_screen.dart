import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../widgets/products_item.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(
    //   context,
    //   listen: false,
    // );
    return Scaffold(
      appBar: AppBar(title: Text('MyShop'), actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Favorites) {
                _showOnlyFavorites = true;
                // productsContainer.showFavoritesOnly();
                //... Show only favorites
              } else {
                _showOnlyFavorites = false;
                // productsContainer.showAll();
              }
            });
          },
          icon: Icon(
            Icons.more_vert,
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Only Favorites'),
              value: FilterOptions.Favorites,
            ),
            PopupMenuItem(
              child: Text('Show All'),
              value: FilterOptions.All,
            ),
          ],
        )
      ]),
      // body: new ProductsGrid(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
