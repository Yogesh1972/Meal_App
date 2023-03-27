import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filter_screen';

  final Function save_Filters;
  final Map<String, bool> filters_given;

  FiltersScreen(this.save_Filters, this.filters_given);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _Vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _Vegan = widget.filters_given['vegan']!;
    _glutenFree == widget.filters_given['gluten']!;
    _lactoseFree = widget.filters_given['lactose']!;
    _vegetarian = widget.filters_given['vegetarian']!;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildLSwitchList(
      String title, String subtitle, bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade800),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.swap_vert_circle_sharp),
            onPressed: () {
              final Selectedfilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _Vegan,
                'vegetarian': _vegetarian,
              };
              widget.save_Filters(Selectedfilters);
            },
          )
        ],
      ),
      drawer: (Drawer_Main()),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            ' Meal Selections',
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w900,
                fontSize: 26),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildLSwitchList(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (newvalue) {
                  setState(
                    () {
                      _vegetarian = newvalue;
                    },
                  );
                },
              ),
              _buildLSwitchList(
                'vegan',
                'Only include vegan meals',
                _Vegan,
                (newvalue) {
                  setState(
                    () {
                      _Vegan = newvalue;
                    },
                  );
                },
              ),
              _buildLSwitchList(
                'Gluten',
                'Only include gluten-free meals',
                _glutenFree,
                (newvalue) {
                  setState(
                    () {
                      _glutenFree = newvalue;
                    },
                  );
                },
              ),
              _buildLSwitchList(
                'Lactose',
                'Only include Lactose-free meals',
                _lactoseFree,
                (newvalue) {
                  setState(
                    () {
                      _lactoseFree = newvalue;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
