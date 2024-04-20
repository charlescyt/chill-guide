String buildFormatExceptionMessage(
  String objectName,
  String fieldName,
  String expectedType,
  dynamic value,
) {
  return 'Invalid JSON format for $objectName: '
      'the "$fieldName" field should be of type $expectedType, '
      'but was $value (${value.runtimeType})';
}
