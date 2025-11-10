enum GameSprites {
  building1('building_1.png'),
  building2('building_2.png'),
  building3('building_3.png'),
  city('city.png'),
  dash('dash.png'),
  dashJumping('dash_jumping.png'),
  explosion('explosion.png'),
  obstacle1('obstacle_1.png'),
  obstacle2('obstacle_2.png'),
  obstacle3('obstacle_3.png');

  const GameSprites(this.filename);

  final String filename;
}
