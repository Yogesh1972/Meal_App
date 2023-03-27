import 'package:flutter/material.dart';
import '../screen/category_selected_screen.dart';

class category_item extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  category_item(this.title, this.color, this.id);

  void selected(ctx) {
    Navigator.of(ctx).pushNamed(
      // MaterialPageRoute(
      //   builder: (_) {
      //     return category_selected(id, title);
      //   },
      // ),
      '/catogary_selected', arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (selected(context)),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color.withOpacity(0.7),
                color.withOpacity(0.5),
                color.withOpacity(0.3)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
