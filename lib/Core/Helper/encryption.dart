part of '../core.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this Helper }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Data encryption operations
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class EncryptionX{
  /// Encryption via md5 algorithm
  static String toMd5(String value) {
    return md5.convert(utf8.encode(value)).toString();
  }
}