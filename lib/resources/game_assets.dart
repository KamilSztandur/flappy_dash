enum GameAssets {
  city('city.jpg'),
  dash('dash.png'),
  dashJumping('dash_jumping.png'),
  explosion('explosion.png'),
  obstacle1('obstacle_1.png'),
  obstacle2('obstacle_2.png'),
  obstacle3('obstacle_3.png'),
  road('road.jpg');

  const GameAssets(this.filename);

  final String filename;
}
