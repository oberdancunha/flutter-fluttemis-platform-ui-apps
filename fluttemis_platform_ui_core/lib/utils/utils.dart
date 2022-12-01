String getFileNameFromPath(String filePath) {
  const pathPattern = '/';
  if (filePath.contains(pathPattern)) {
    final filePathSplitted = filePath.split(pathPattern);
    final fileName = filePathSplitted.last;

    return fileName;
  }

  return filePath;
}
