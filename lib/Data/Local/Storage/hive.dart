part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Data storage and management via Hive technology
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class HiveX {
  //============================================================================
  // Variables

  static late Box box;
  static const String _boxName='app';

  //============================================================================
  // Functions

  static initialize()async{
    /// The web does not require configuration, only in the case of the phone
    if(!kIsWeb){
      Directory path = await getApplicationDocumentsDirectory();
      Hive.init(path.path);
      box=await Hive.openBox(_boxName);
    }
  }

  static put({required var val, required String kay}) {
    Hive.box(_boxName).put(kay, val);
  }
  static get(String kay, {var defaultValue}){
    return box.get(kay,defaultValue: defaultValue??[]);
  }

  static remove(String kay){
    Hive.box(_boxName).delete(kay);
  }
}
