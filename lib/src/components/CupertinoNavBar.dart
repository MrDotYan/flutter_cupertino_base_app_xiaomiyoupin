import 'package:flutter/cupertino.dart';

const double kMinInteractiveDimensionCupertino = 44.0;

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  bottom: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

// There's a single tag for all instances of navigation bars because they can
// all transition between each other (per Navigator) via Hero transitions.
const _HeroTag _defaultHeroTag = _HeroTag(null);

class _HeroTag {
  const _HeroTag(this.navigator);

  final NavigatorState navigator;

  // Let the Hero tag be described in tree dumps.
  @override
  String toString() =>
      'Default Hero tag for Cupertino navigation bars with navigator $navigator';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _HeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode {
    return identityHashCode(navigator);
  }
}

class CupertinoNavBar extends CupertinoNavigationBar {
  /// Creates a navigation bar in the iOS style.
  /// CupertinoNavBar 继承于 CupertinoNavigationBar
  const CupertinoNavBar({
    Key key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.border = _kDefaultNavBarBorder,
    this.backgroundColor,
    this.brightness,
    this.padding,
    this.actionsForegroundColor,
    this.transitionBetweenRoutes = false,
    // 这里修改了transitionBetweenRoutes的默认值为false
    this.heroTag = _defaultHeroTag,
  })  : assert(automaticallyImplyLeading != null),
        assert(automaticallyImplyMiddle != null),
        assert(transitionBetweenRoutes != null),
        assert(
            heroTag != null,
            'heroTag cannot be null. Use transitionBetweenRoutes = false to '
            'disable Hero transition on this navigation bar.'),
        assert(
            !transitionBetweenRoutes || identical(heroTag, _defaultHeroTag),
            'Cannot specify a heroTag override if this navigation bar does not '
            'transition due to transitionBetweenRoutes = false.'),
        super(key: key);
  final Widget leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyMiddle;

  final String previousPageTitle;

  final Widget middle;

  final Widget trailing;

  final Color backgroundColor;

  final Brightness brightness;

  final EdgeInsetsDirectional padding;

  final Border border;

  @Deprecated('Use CupertinoTheme and primaryColor to propagate color. '
      'This feature was deprecated after v1.1.2.')
  final Color actionsForegroundColor;

  final bool transitionBetweenRoutes;

  final Object heroTag;
}
