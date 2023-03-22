import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/util/scrollbar.dart';

part 'sidebar.g.dart';

Drawer appDrawer(BuildContext ctx){
  return const Drawer(child: _AppDrawer());
}

@hcwidget
Widget __appDrawer(){
  final controller= useScrollController();
  return scroll(
    controller: controller,
      child: ListView(
        physics: physics,
        controller: controller,
      ));
}