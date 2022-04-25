import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension MediaQueryDataExtension on MediaQueryData {
  DisplayFeature? get hinge {
    for (var element in displayFeatures) {
      if (element.type == DisplayFeatureType.hinge) {
        return element;
      }
    }
    return null;
  }
}
