part of '../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Manage all database connections
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class DatabaseX {
  static init() async {
    try {
      /// Here codes are added to configure anything within this section when the application starts
    } catch (e) {
      return Future.error(e);
    }
  }

  //============================================================================
  // Basic Get

  static Future<List<T>> getAll<T>(
      {required api, required Function(Map<String, dynamic>) fromJson}) async {
    try {
      var x = await ApiX.get(api, token: LocalDataX.token);
      List<T> objects = [];
      for (var obj in x[NameX.data] ?? []) {
        objects.add(fromJson(obj));
      }
      return objects;
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<List<T>> getAllByID<T>(
      {required int id,
      required api,
      required Function(Map<String, dynamic>) fromJson}) async {
    try {
      return await getAll<T>(api: api + id.toString(), fromJson: fromJson);
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<T> getObject<T>(
      {int? id,
      required api,
      required Function(Map<String, dynamic>) fromJson}) async {
    try {
      api += id != null ? id.toString() : '';
      return fromJson(
          (await ApiX.get(api, token: LocalDataX.token))[NameX.data] ?? {});
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // Basic Add

  static Future postObject({int? id, required api, Object? body}) async {
    try {
      api += id != null ? id.toString() : '';
      return await ApiX.post(api, token: LocalDataX.token, body: body);
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // Basic Update

  static Future updateObject(
      {int? id, required String api, required Map body}) async {
    try {
      api += id != null ? id.toString() : '';
      return await ApiX.post(api, body: body, token: LocalDataX.token);
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // Basic Delete

  static Future removeObjectByID({required String api, required int id}) async {
    try {
      return await ApiX.delete(api + id.toString(), token: LocalDataX.token);
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // Auth

  static Future<String> signUp({
    required String name,
    required int phone,
    required int countryCode,
  }) async {
    try {
      var data = await ApiX.post(
        DBEndPointX.postSignUp,
        body: {
          NameX.name: name,
          NameX.phone: phone,
          NameX.countryCode: countryCode
        },
      );
      if (data[NameX.message] != null) {
        return data[NameX.message];
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<String> loginByPhone({
    required int phone,
    required int countryCode,
  }) async {
    try {
      var data = await ApiX.post(
        DBEndPointX.postLoginByPhone,
        body: {NameX.phone: phone, NameX.countryCode: countryCode},
      );
      if (data[NameX.message] != null) {
        return data[NameX.message];
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<String> loginByEmail({required String email}) async {
    try {
      var data = await ApiX.post(DBEndPointX.postLoginByEmail,
          body: {NameX.email: email});
      if (data[NameX.message] != null) {
        return data[NameX.message];
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<UserX> otpByPhone(
      {required int otp, required int phone, required int countryCode}) async {
    try {
      var data = await ApiX.post(DBEndPointX.postVerifyOtpPhone, body: {
        NameX.phone: phone,
        NameX.countryCode: countryCode,
        NameX.otp: otp
      });
      if (data != null) {
        return UserX.fromJson(data[NameX.data], data[NameX.token]);
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<UserX> otpByEmail(
      {required int otp, required String email}) async {
    try {
      var data = await ApiX.post(DBEndPointX.postVerifyOtpEmail,
          body: {NameX.email: email, NameX.otp: otp.toString()});
      if (data != null) {
        return UserX.fromJson(data[NameX.data], data[NameX.token]);
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<UserX> completeDataSingUp(
      {required String gender, required String email}) async {
    try {
      var data = await ApiX.put(DBEndPointX.putCompleteDataSingUp,
          token: LocalDataX.token,
          body: {
            NameX.email: email.toLowerCase().trimLeft().trimRight(),
            NameX.gender: gender.toLowerCase().trimLeft().trimRight()
          });
      if (data != null) {
        return UserX.fromJson(data[NameX.data], LocalDataX.token);
      } else {
        return Future.error(data[NameX.error] ?? "error");
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<void> logout() async {
    try {
      return await ApiX.post(DBEndPointX.postLogout, token: LocalDataX.token);
    } catch (error) {
      if (error == 'Unauthenticated.') {
        return;
      }
      return Future.error(error);
    }
  }

  //============================================================================
  // Gold & Silver Price

  static Future getGoldPrice() async {
    try {
      var data = await ApiX.get(DBEndPointX.gold);
      if (data != null) {
        return data[NameX.price];
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future getSilverPrice() async {
    try {
      var data = await ApiX.get(DBEndPointX.silver);
      if (data != null) {
        return data[NameX.price];
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
