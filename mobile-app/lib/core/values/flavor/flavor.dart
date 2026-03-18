enum AppFlavor {
  dev(1, "dev"),
  test(2, "test"),
  staging(3, "staging"),
  prod(4, "prod"),
  demo(5, "demo");

  final int id;
  final String text;
  const AppFlavor(
    this.id,
    this.text,
  );
}