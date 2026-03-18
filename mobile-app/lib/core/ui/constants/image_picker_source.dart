enum ImagePickerSourceEnum {
  camera(1, "Camera"),
  gallery(2, "Gallery"),
  file(2, "File");

  final int status;
  final String text;
  const ImagePickerSourceEnum(
    this.status,
    this.text,
  );
}