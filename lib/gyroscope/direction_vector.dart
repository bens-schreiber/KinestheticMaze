import 'dart:async';
import 'dart:math' as math;

import 'package:flame/game.dart';
import 'package:sensors_plus/sensors_plus.dart';

const twoPi = 2 * math.pi;

double _radianPosition = 0;

double radianPositionCalc(double x, double dx) {
  x += dx;
  if (x > twoPi || x < -twoPi) return 0;
  return x;
}

final Stream<GyroscopeEvent> _gyroscopeStream = gyroscopeEventStream();

final StreamController<Vector2> _directionVectorStreamController =
    StreamController<Vector2>.broadcast();

// A cartesian vector representing the direction of the gyroscope
final Stream<Vector2> directionVectorStream =
    _directionVectorStreamController.stream;

// This has to be stored somewhere in order for stream to be listened to
StreamSubscription registerGyroscope() => _gyroscopeSubscription;

final StreamSubscription _gyroscopeSubscription = _gyroscopeStream.listen(
  (GyroscopeEvent event) {
    _radianPosition =
        radianPositionCalc(_radianPosition, -event.z / ((3 / 2) * math.pi));

    const r = 1;
    final theta = _radianPosition;

    final cartesianVector = Vector2(r * math.cos(theta), r * math.sin(theta));
    cartesianVector.normalizeInto(cartesianVector);

    _directionVectorStreamController.add(cartesianVector);
  },
);
