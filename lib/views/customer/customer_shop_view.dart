import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:flutter/material.dart';

class CustomerShopView extends StatefulWidget {
  const CustomerShopView({super.key});

  @override
  State<CustomerShopView> createState() => _CustomerShopViewState();
}

class _CustomerShopViewState extends State<CustomerShopView> {
  int? _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(textTheme, colorScheme),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextField(
        decoration: searchInputDecoration,
      ),
    );
  }

  Widget _buildBody(TextTheme textTheme, ColorScheme colorScheme) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text('customer_shop_view.title'.tr(), style: primaryTitleTextStyle),
        const SizedBox(height: 8.0),
        Text('customer_shop_view.categories_title'.tr()),
        const SizedBox(height: 8.0),
        _buildCategories(),
        const SizedBox(height: 16.0),
        Image.asset('assets/images/shop/banner.png'),
        const SizedBox(height: 16.0),
        Text('customer_shop_view.hot_selling_title'.tr(),
            style: textTheme.titleMedium),
        const SizedBox(height: 8.0),
        _buildHotSelling(textTheme, colorScheme),
        const SizedBox(height: 16.0),
        Text('customer_shop_view.recommends_title'.tr(),
            style: textTheme.titleMedium),
        const SizedBox(height: 8.0),
        _buildRecommended(textTheme, colorScheme)
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 86.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategory(
            0,
            Icons.checkroom,
            'customer_shop_view.categories.0'.tr(),
          ),
          _buildCategory(
            1,
            Icons.directions_walk,
            'customer_shop_view.categories.1'.tr(),
          ),
          _buildCategory(
            2,
            Icons.hiking,
            'customer_shop_view.categories.2'.tr(),
          ),
          _buildCategory(
            3,
            Icons.fitness_center,
            'customer_shop_view.categories.3'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(int index, IconData icon, String name) {
    return SizedBox(
      width: 128.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: RadioTile(
          value: index,
          groupValue: _selectedCategory,
          onChanged: _onCategoryChanged,
          addRadio: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32.0),
                const SizedBox(height: 4.0),
                Text(name, textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHotSelling(TextTheme textTheme, ColorScheme colorScheme) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildItem(
            'assets/images/shop/items/0.png',
            'customer_shop_view.items.0'.tr(),
            '\$50',
            '20% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
          _buildItem(
            'assets/images/shop/items/1.png',
            'customer_shop_view.items.1'.tr(),
            '\$50',
            '30% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
          _buildItem(
            'assets/images/shop/items/2.png',
            'customer_shop_view.items.2'.tr(),
            '\$100',
            '20% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommended(TextTheme textTheme, ColorScheme colorScheme) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildItem(
            'assets/images/shop/items/3.png',
            'customer_shop_view.items.3'.tr(),
            '\$38',
            '20% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
          _buildItem(
            'assets/images/shop/items/4.png',
            'customer_shop_view.items.4'.tr(),
            '\$35',
            '15% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
          _buildItem(
            'assets/images/shop/items/5.png',
            'customer_shop_view.items.5'.tr(),
            '\$50',
            '30% OFF',
            textTheme.bodySmall!,
            colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String image,
    String title,
    String price,
    String? discount,
    TextStyle textStyle,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 110.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            Text(title, style: textStyle),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '$price ', style: textStyle),
                  if (discount != null)
                    TextSpan(
                      text: discount,
                      style: textStyle.copyWith(
                        color: colorScheme.primary,
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCategoryChanged(int? index) {
    setState(() {
      _selectedCategory = index;
    });
  }
}
