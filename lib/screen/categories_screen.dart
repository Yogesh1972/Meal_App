import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CatogeriesScreen extends StatelessWidget {
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(22),
      children: DUMMY_CATEGORIES
          .map((catedata) => category_item(
                catedata.title,
                catedata.color,
                catedata.id,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
