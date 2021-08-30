import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_product_registry/main_product_registry.dart';
import 'package:main_product_registry/src/presentation/home.dart';
import 'package:main_product_registry/src/presentation/view/content/home_lower_layer.dart';
import 'package:shared_manifest/manifest.dart';
import 'package:shared_utilities/utilities.dart';
import 'package:shared_widget_bottom_nav/shared_widget_bottom_nav.dart';
import 'package:shared_widget_bottom_sheet/shared_widget_bottom_sheet.dart';

import 'content/home_upper_layer.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  int _index = 0;
  RubberAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = RubberAnimationController(
      vsync: this,
      upperBoundValue: AnimationControllerValue(percentage: 0.8),
      halfBoundValue: AnimationControllerValue(percentage: 0.4),
      lowerBoundValue: AnimationControllerValue(percentage: 0.8),
      duration: Duration(milliseconds: 200),
      springDescription: SpringDescription.withDampingRatio(
        mass: 1.0,
        stiffness: 500.0,
        ratio: 0.7,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManifest.PRIMARY.toColor(),
      extendBody: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => RubberBottomSheet(
            scrollController: _scrollController,
            animationController: _controller!,
            headerHeight: DimensionsManifest.UNIT_20,
            dragFriction: DimensionsManifest.UNIT_2,
            lowerLayer: BackdropLowerLayer(),
            upperLayer: BackdropUpperLayer(),
          ),
        ),
      ),
    );
  }

  FloatingNavbar _buildBottomNavigationBar() {
    return FloatingNavbar(
      onTap: (int index) {
        setState(() => _index = index);
      },
      currentIndex: _index,
      backgroundColor: ColorManifest.WHITE.toColor(),
      selectedBackgroundColor: ColorManifest.ACCENT.toColor().withOpacity(0.25),
      selectedItemColor: ColorManifest.PRIMARY_DARK.toColor(),
      unselectedItemColor: ColorManifest.PRIMARY_LIGHT.toColor(),
      iconSize: DimensionsManifest.UNIT_28,
      fontSize: DimensionsManifest.FONT_H5,
      borderRadius: DimensionsManifest.UNIT_36,
      elevation: DimensionsManifest.UNIT_24,
      itemBorderRadius: DimensionsManifest.UNIT_20,
      padding: EdgeInsets.symmetric(
        vertical: DimensionsManifest.UNIT_20,
        horizontal: DimensionsManifest.UNIT_12,
      ),
      items: bottomMenuTiles
          .map((e) => FloatingNavbarItem(
                icon: e.menuIcon.image,
                title: e.menuTitle,
              ))
          .toList()
            // TODO: Remove this later if menus already fixed
            ..add(
              FloatingNavbarItem(
                  icon: ImageManifest.lanscape, title: "Explore"),
            )
            ..add(
              FloatingNavbarItem(icon: ImageManifest.lanscape, title: "Chat"),
            )
            ..add(
              FloatingNavbarItem(
                  icon: ImageManifest.lanscape, title: "Settings"),
            ),
    );
  }
}