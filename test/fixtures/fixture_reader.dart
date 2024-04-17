import 'dart:io';

abstract final class FixtureReader {
  static String read(String fileName) => File('test/fixtures/$fileName').readAsStringSync();
}
