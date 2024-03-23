// ignore_for_file: file_names, non_constant_identifier_names

import '../models/RecordSetting.dart';
import '../repository/abs/RecordSettingRepo.dart';
import '../repository/firebase/RecordSettingFireRepo.dart';
import 'abs/RecordSettingSv.dart';

class RecordSettingService implements RecordSettingSv {
  final RecordSettingRepo _RecordSettingRepo;

  RecordSettingService([RecordSettingRepo? RecordSettingRepo])
      : _RecordSettingRepo = RecordSettingRepo ?? RecordSettingFireRepo();

  @override
  Future<void> createRecordSetting(RecordSetting RecordSetting) async {
    await _RecordSettingRepo.createRecordSetting(RecordSetting);
  }

  @override
  Future<void> deleteRecordSetting(int id) async {
    await _RecordSettingRepo.deleteRecordSetting(id);
  }

  @override
  Future<RecordSetting?> getRecordSetting() async {
    return await _RecordSettingRepo.getRecordSetting();
  }

  @override
  Future<void> updateRecordSetting(RecordSetting recordSetting) async {
    await _RecordSettingRepo.updateRecordSetting(recordSetting);
  }
}
