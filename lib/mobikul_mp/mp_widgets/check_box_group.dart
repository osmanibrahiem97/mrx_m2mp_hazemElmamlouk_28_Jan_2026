/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'package:flutter/material.dart';

import '../../mobikul_mp/mp_models/add_new_product_mp_model/categories.dart';

class CheckboxGroupMp extends StatefulWidget {
  final List<Categories>? category;
  final List<bool>? checked;

  final void Function(
    bool isChecked,
    String label,
    int index,
    Key? key,
  )? onChange;

  final void Function(List<String> selected)? onSelected;
  final TextStyle? labelStyle;
  final Color? activeColor;
  final Color checkColor;
  final bool tristate;
  final bool isDisable;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CheckboxGroupMp({
    Key? key,
    @required this.category,
    this.checked,
    this.onChange,
    this.onSelected,
    this.labelStyle = const TextStyle(),
    this.activeColor, //defaults to toggleableActiveColor,
    this.checkColor = const Color(0xFFFFFFFF),
    this.tristate = false,
    this.isDisable = false,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroupMp> {
  List<Widget> checkBoxContent = [];
  int spacingOfCheck = 0;
  List<String> _selected = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < (widget.category?.length ?? 0); i++) {
      drawList(widget.category![i], i);
      spacingOfCheck = 0;
    }

    return Container(
      color: Theme.of(context).cardColor,
      padding: widget.padding,
      margin: widget.margin,
      child: Column(children: checkBoxContent),
    );
  }

  drawList(Categories category, int i) {
    checkBoxContent.add(checkboxView(category, spacingOfCheck, i));
    if (category.children!.isNotEmpty) {
      spacingOfCheck = spacingOfCheck + 10;
      category.children!.forEach((element) {
        drawList(element, i);
      });
    }
  }

  checkboxView(Categories categories, int spacing, i) {
    Categories? item = widget.category?[i];
    List<bool> checkedList = List<bool>.filled(
        widget.category?.length ?? 0, widget.category?[i].isChecked ?? false);
    Checkbox cb = Checkbox(
      value: checkedList[i],
      onChanged: (newValue) {
        setState(() {
          item?.isChecked = newValue;
        });
      },
      //(bool? isChecked) => onChanged(isChecked ?? false, i),
      checkColor: widget.checkColor,
      activeColor:
          widget.activeColor ?? Theme.of(context).colorScheme.onPrimary,
      tristate: widget.tristate,
    );

    Text t = Text(categories.name ?? '', style: widget.labelStyle);

    return Padding(
      padding: EdgeInsets.only(left: double.parse((spacing.toString()))),
      child: Row(children: <Widget>[
        cb,
        t,
        // Column(children: content)
      ]),
    );
  }

  void onChanged(bool isChecked, int i) {
    bool isAlreadyContained = _selected.contains(widget.category?[i].name);
    // Categories? item = widget.category?[i];
    // _selected = List<String>.filled(
    //     widget.category?.length ?? 0, widget.category?[i].name ?? '');
    if (mounted) {
      setState(() {
        if (!isChecked && isAlreadyContained) {
          _selected.remove(widget.category?[i].name);
        } else if (isChecked && !isAlreadyContained) {
          _selected.add(widget.category?[i].name ?? '');
        }
        if (widget.onChange != null) {
          widget.onChange!(
              isChecked, widget.category?[i].name ?? '', i, widget.key);
          if (widget.onSelected != null) widget.onSelected!(_selected);
        }
      });
    }
  }
}
