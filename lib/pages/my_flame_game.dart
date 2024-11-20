import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector{
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);
    
    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) => s.setTujuan(info);
  //  void onTapDown(TapDownEvent event) {
  // //   s.position.add(Vector2(10, 0)); //bergerak ketika ditap di luar dan di gambar pesawat
  // // }
}