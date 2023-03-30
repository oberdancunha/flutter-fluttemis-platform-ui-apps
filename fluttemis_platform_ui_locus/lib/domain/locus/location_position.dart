import 'package:flutter/foundation.dart';

@immutable
class LocationPosition {
  final int start;
  final int end;

  const LocationPosition({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(covariant LocationPosition other) {
    if (identical(this, other)) {
      return true;
    }

    return other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
