enum AppTheme {
  system(1, "system"),
  light(2, "light"),
  dark(3, "dark"),;

  final int id;
  final String text;
  const AppTheme(
    this.id,
    this.text,
  );
}