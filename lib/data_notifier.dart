//  Import flutter packages.
import 'package:flutter/material.dart';

/// [_DataNotifierService] provides the mechanism by which [DataNotifier]
/// is able to pass [data] down the widget tree.
class _DataNotifierService extends InheritedWidget {
  _DataNotifierService({
    required Key? key,
    required Widget child,
    required this.context,
    this.data,
  }) : super(key: key, child: child);

  /// [data] can be of any type and so var is used here. It is possible to
  /// define a generic _DataNotifierService<T>, but this adds complications
  /// when using the [of] method bound to [DataNotifier].
  var data;

  /// [context] is used when passing on the search for further instances of
  /// [_DataNotifierService] up the widget tree.
  final BuildContext context;

  @override
  bool updateShouldNotify(_DataNotifierService old) => data != old.data;
}

/// [DataNotifier] provides a StatelessWidget wrapper for
/// [_DataNotifierService]. The associated build method ensures that
/// only one instance of _DataNotifierService exists per each level of context.
class DataNotifier extends StatelessWidget {
  DataNotifier({
    required Key? key,
    required this.child,
    this.data,
  }) : super(key: key);

  /// [data] can be of any type and so var is used here. It is possible to
  /// define a generic DataNotifier<T>, but this adds complications
  /// when using the [of] method bound to [DataNotifier].
  var data;

  /// The widget immediately below this instance of [DataNotifier] in the
  /// widget tree.
  final Widget child;

  /// [of] returns a copy of [_DataNotifierService] which matches the key
  /// provided, or passes the search on up the widget tree if not.
  static _DataNotifierService of(BuildContext context, Key key) {
    //  Get instance of [_DataNotifierService] immediately above this
    //  instance of [DataNotifier] in the widget tree.
    _DataNotifierService? result =
        context.dependOnInheritedWidgetOfExactType<_DataNotifierService>();

    //  Using 'is' promotes result to type _DataNotifierService in what
    //  follows so that the comparison 'key != result.key' can be made.
    if (result is _DataNotifierService) {
      if (key != result.key) {
        //  If keys do not match then continue search up the widget tree.
        return DataNotifier.of(result.context, key);
      } else {
        //  If key matches the search criterion then return 'result'.
        return result;
      }
    } else {
      //  No instance of _DataNotifierService can be found in the widget tree
      //  so force the following assert to fail and provide a message to the
      //  user.
      assert(result is _DataNotifierService,
        'No DataNotifier with key $key found in context: '
        'Try wrapping the call to [of] in a builder.'
      );
      return result!;
    }
  }

  //  Wrapping the instance of _DataNotifierService in a build method
  //  ensures that only one instance of DataNotifier is present at each
  //  level in the widget tree.
  @override
  Widget build(BuildContext context) {
    return _DataNotifierService(
      key: key,
      child: child,
      context: context,
      data: data,
    );
  }
}

