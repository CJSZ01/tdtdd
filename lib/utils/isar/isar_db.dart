import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tdtdd/data/repositories/task/isar/isar_task_model.dart';

class IsarDb {
  Isar? _isar;
  IsarDb();
  Future<Isar> _getInstance() async {
    if (_isar != null) {
      return _isar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      IsarTaskModelSchema,
    ], directory: dir.path);
    return _isar!;
  }

  Future<List<IsarTaskModel>> getTasks() async {
    final isar = await _getInstance();
    return await isar.isarTaskModels.where().findAll();
  }

  Future<void> deleteAllTasks() async {
    final isar = await _getInstance();
    await isar.writeTxn(
      () => isar.isarTaskModels.where().deleteAll(),
    );
  }

  Future<void> putAllTasks({required List<IsarTaskModel> models}) async {
    final isar = await _getInstance();
    await isar.writeTxn(
      () => isar.isarTaskModels.putAll(models),
    );
  }
}
