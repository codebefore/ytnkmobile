import 'dart:math';
import 'dart:typed_data';

class IDGenerator {
  static final Random _random = Random();
  static final int _machineId = _random.nextInt(0xFFFFFF);
  static int _counter = _random.nextInt(0xFFFFFF);

  static String generateGUID() {
    Random random = Random(DateTime.now().millisecond);

    const String hexDigits = "0123456789abcdef";
    final List<String> uuid = List.filled(36, '', growable: true);

    for (int i = 0; i < 36; i++) {
      final int hexPos = random.nextInt(16);
      uuid[i] = (hexDigits.substring(hexPos, hexPos + 1));
    }

    int pos = (int.parse(uuid[19], radix: 16) & 0x3) |
        0x8; // bits 6-7 of the clock_seq_hi_and_reserved to 01

    uuid[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    uuid[19] = hexDigits.substring(pos, pos + 1);

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }

  static String generateObjectId() {
    final int timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000);

    final Uint8List objectId = Uint8List(12);
    final ByteData byteData = ByteData.sublistView(objectId);

    // 4-byte timestamp
    byteData.setUint32(0, timestamp, Endian.big);

    // 5-byte machine identifier
    byteData.setUint8(4, (_machineId >> 16) & 0xFF);
    byteData.setUint8(5, (_machineId >> 8) & 0xFF);
    byteData.setUint8(6, _machineId & 0xFF);

    // 3-byte incrementing counter
    _counter = (_counter + 1) & 0xFFFFFF;
    byteData.setUint8(7, (_counter >> 16) & 0xFF);
    byteData.setUint8(8, (_counter >> 8) & 0xFF);
    byteData.setUint8(9, _counter & 0xFF);

    // 2-byte process identifier (not used, so set to random value)
    byteData.setUint8(10, _random.nextInt(0xFF));
    byteData.setUint8(11, _random.nextInt(0xFF));

    final StringBuffer buffer = StringBuffer();
    for (final int byte in objectId) {
      buffer.write(byte.toRadixString(16).padLeft(2, '0'));
    }
    return buffer.toString();
  }
}
