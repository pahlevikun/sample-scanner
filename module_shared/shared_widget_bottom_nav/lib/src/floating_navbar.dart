import 'package:flutter/material.dart';
import 'package:shared_widget_bottom_nav/shared_widget_bottom_nav.dart';

typedef Widget ItemBuilder(BuildContext context, FloatingNavbarItem items);

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem>? items;
  final int? currentIndex;
  final void Function(int val)? onTap;
  final Color? selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;
  final double? fontSize;
  final double? iconSize;
  final double? itemBorderRadius;
  final double? borderRadius;
  final ItemBuilder? itemBuilder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double? elevation;

  FloatingNavbar({
    Key? key,
    @required this.items,
    @required this.currentIndex,
    @required this.onTap,
    this.itemBuilder,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize = 24.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.padding = const EdgeInsets.only(bottom: 8, top: 8),
    this.width = double.infinity,
    this.elevation = 0.0,
  })  : assert(items!.length > 1),
        assert(items!.length <= 5),
        assert(currentIndex! <= items!.length),
        assert(width > 50),
        super(key: key);

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar>
    with SingleTickerProviderStateMixin {
  List<FloatingNavbarItem> get items => widget.items!;
  late AnimationController _startAnimationController;

  @override
  void initState() {
    super.initState();
    _startAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _startAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ItemBuilder itemBuilder = widget.itemBuilder != null
        ? widget.itemBuilder!
        : _defaultItemBuilder(
            unselectedItemColor: widget.unselectedItemColor,
            selectedItemColor: widget.selectedItemColor,
            borderRadius: widget.borderRadius,
            fontSize: widget.fontSize,
            width: widget.width,
            backgroundColor: widget.backgroundColor,
            currentIndex: widget.currentIndex,
            iconSize: widget.iconSize,
            itemBorderRadius: widget.itemBorderRadius,
            items: widget.items,
            onTap: widget.onTap,
            selectedBackgroundColor: widget.selectedBackgroundColor,
          );

    return BottomAppBar(
      color: Colors.transparent,
      elevation: widget.elevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: widget.margin!,
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                color: widget.backgroundColor,
              ),
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: items.map((f) {
                    return itemBuilder(context, f);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ItemBuilder _defaultItemBuilder({
    Function(int val)? onTap,
    List<FloatingNavbarItem>? items,
    int? currentIndex,
    Color? selectedBackgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? backgroundColor,
    double width = double.infinity,
    double? fontSize,
    double? iconSize,
    double? itemBorderRadius,
    double? borderRadius,
  }) {
    return (BuildContext context, FloatingNavbarItem item) => Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _startAnimationController,
                builder: (BuildContext context, Widget? child) =>
                    AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: currentIndex == items!.indexOf(item)
                          ? selectedBackgroundColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(itemBorderRadius!)),
                  child: Bounce(
                    onPressed: () {
                      onTap!(items.indexOf(item));
                    },
                    duration: Duration(milliseconds: 100),
                    child: Container(
                      width: width.isFinite
                          ? (width / items.length - 8)
                          : MediaQuery.of(context).size.width / items.length -
                          24,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: item.title != null ? 4 : 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          item.customWidget == null
                              ? Image(
                            image: item.icon,
                            color: currentIndex == items.indexOf(item)
                                ? selectedItemColor
                                : unselectedItemColor,
                            width: iconSize! *
                                (_startAnimationController.value),
                            height: iconSize *
                                (_startAnimationController.value),
                          )
                              : item.customWidget!,
                          if (item.title != null)
                            Text(
                              '${item.title}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: currentIndex == items.indexOf(item)
                                    ? selectedItemColor
                                    : unselectedItemColor,
                                fontSize: fontSize,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
