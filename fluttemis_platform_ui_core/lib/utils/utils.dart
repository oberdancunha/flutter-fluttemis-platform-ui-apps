String getFileNameFromPath(String filePath) {
  final pathPattern = RegExp(r'[\/\\]');
  if (filePath.contains(pathPattern)) {
    final filePathSplitted = filePath.split(pathPattern);
    final fileName = filePathSplitted.last;

    return fileName;
  }

  return filePath;
}
