import 'dart:async';
import 'dart:math' as math;

import 'package:flame/game.dart';
import 'package:sensors_plus/sensors_plus.dart';

final Stream<GyroscopeEvent> _gyroscopeStream = gyroscopeEventStream();

final StreamController<Vector2> _directionVectorStreamController =
    StreamController<Vector2>.broadcast();

// A cartesian vector representing the direction of the gyroscope
final Stream<Vector2> directionVectorStream =
    _directionVectorStreamController.stream;

// The last known direction vector from directionVectorStream
Vector2 directionVectorCache = Vector2(1, 0);

// This has to be stored somewhere in order for stream to be listened to
StreamSubscription registerGyroscope() => _gyroscopeSubscription;

const _minimumDz = 0.03;
const _twoPi = 2 * math.pi;

double _radianPosition = 0;

double calculateRadianPosition(double x, double dx) {
  x += dx;
  if (x > _twoPi || x < -_twoPi) return 0;
  return x;
}

final StreamSubscription _gyroscopeSubscription = _gyroscopeStream.listen(
  (GyroscopeEvent event) {
    final double dz = -event.z / (((4 / 3) * math.pi));
    if (dz.abs() < _minimumDz) return;

    _radianPosition = calculateRadianPosition(_radianPosition, dz);

    const r = 1;
    final theta = _radianPosition;

    final cartesianVector = Vector2(r * math.cos(theta), r * math.sin(theta));
    cartesianVector.normalizeInto(cartesianVector);

    _directionVectorStreamController.add(cartesianVector);
    directionVectorCache = cartesianVector;
  },
);
