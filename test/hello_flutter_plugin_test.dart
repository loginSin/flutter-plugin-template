import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter_plugin/hello_flutter_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('hello_flutter_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await HelloFlutterPlugin.platformVersion, '42');
  });
}
