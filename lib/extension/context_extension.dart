import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_db/extension/media_query_extension.dart';

extension ContextExtension on BuildContext {
  bool get isMobile => getWindowType(this) == AdaptiveWindowType.xsmall;

  bool get isTablet => getWindowType(this) == AdaptiveWindowType.small;

  bool get isDesktop => !isMobile && !isTablet;

  /// Returns a boolean value whether the display has a hinge that splits the
  /// screen into two, left and right sub-screens. Horizontal splits (top and
  /// bottom sub-screens) are ignored for this application.
  bool get isFoldable {
    final hinge = MediaQuery.of(this).hinge;
    if (hinge == null) {
      return false;
    } else {
      // Vertical
      return hinge.bounds.size.aspectRatio < 1;
    }
  }
}
