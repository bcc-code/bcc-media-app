// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:kids/screens/about.dart' as _i1;
import 'package:kids/screens/contact.dart' as _i2;
import 'package:kids/screens/device_info.dart' as _i3;
import 'package:kids/screens/faq.dart' as _i4;
import 'package:kids/screens/home.dart' as _i5;
import 'package:kids/screens/settings/settings.dart' as _i6;
import 'package:kids/screens/show/show.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AboutScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i1.AboutScreen(),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i2.ContactScreen(),
      );
    },
    DeviceInfoScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i3.DeviceInfoScreen(),
      );
    },
    FAQScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i4.FAQScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: const _i6.SettingsScreen(),
      );
    },
    ShowScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShowScreenRouteArgs>(
          orElse: () =>
              ShowScreenRouteArgs(showId: pathParams.getString('showId')));
      return _i8.AutoRoutePage<void>(
        routeData: routeData,
        child: _i7.ShowScreen(
          key: args.key,
          showId: args.showId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutScreen]
class AboutScreenRoute extends _i8.PageRouteInfo<void> {
  const AboutScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AboutScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ContactScreen]
class ContactScreenRoute extends _i8.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DeviceInfoScreen]
class DeviceInfoScreenRoute extends _i8.PageRouteInfo<void> {
  const DeviceInfoScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DeviceInfoScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceInfoScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FAQScreen]
class FAQScreenRoute extends _i8.PageRouteInfo<void> {
  const FAQScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FAQScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsScreenRoute extends _i8.PageRouteInfo<void> {
  const SettingsScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ShowScreen]
class ShowScreenRoute extends _i8.PageRouteInfo<ShowScreenRouteArgs> {
  ShowScreenRoute({
    _i9.Key? key,
    required String showId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ShowScreenRoute.name,
          args: ShowScreenRouteArgs(
            key: key,
            showId: showId,
          ),
          rawPathParams: {'showId': showId},
          initialChildren: children,
        );

  static const String name = 'ShowScreenRoute';

  static const _i8.PageInfo<ShowScreenRouteArgs> page =
      _i8.PageInfo<ShowScreenRouteArgs>(name);
}

class ShowScreenRouteArgs {
  const ShowScreenRouteArgs({
    this.key,
    required this.showId,
  });

  final _i9.Key? key;

  final String showId;

  @override
  String toString() {
    return 'ShowScreenRouteArgs{key: $key, showId: $showId}';
  }
}
