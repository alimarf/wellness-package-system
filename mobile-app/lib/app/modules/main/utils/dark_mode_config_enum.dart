enum DarkModeConfigEnum {
  system(name: 'System', enumValue: 0),
  dark(name: 'Dark', enumValue: 1),
  light(name: 'Light', enumValue: 2);
  
  final int enumValue;
  final String name;
  
  const DarkModeConfigEnum({
    required this.enumValue,
    required this.name
  });

  static List<DarkModeConfigEnum> getAllEnums() {
    return DarkModeConfigEnum.values;
  }
}