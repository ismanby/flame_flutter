import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks{
  late Vector2 tujuan; //untuk menyimpan koordinat ketika kita mengklik/tap bagian dari layar, yang akan menjadi tujuan akhir dari ship
  late Vector2 arah;
  double speed = 3.0;

  Ship() {
    arah = Vector2(0, 0); //memberikan nilai awal arah, jika tidak diberi maka akan muncu error
    tujuan= position;
  }

  void setTujuan(DragUpdateInfo info){
    tujuan = info.eventPosition.global; //proses penyimpanan koordinat
    lookAt(tujuan); //untuk pesawat memutar arahnya sesuai dengan kursor
    angle += pi;
    arah = tujuan - position;
    arah = arah.normalized(); //membuat pergerakannnya per satuan
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 100); //untuk mengatur posisi gambar
    angle = -pi / 2;
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    if((tujuan-position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }
  // @override
  // void onTapDown(TapDownEvent event) {
  //   position += Vector2(10, 0); //ketika ditap, gambar akan bergerak sesuai value yang ditambahkan
  // }
}