import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_extentions.dart';
import 'package:elevate_online_exam/data/api/api_manager.dart';
import 'package:elevate_online_exam/data/api/models/subject_dto.dart';
import 'package:elevate_online_exam/data/contracts/subjects/subject_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/subject.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SubjectOnlineDatasource)
class SubjectOnlineDatasourceImpl implements SubjectOnlineDatasource {
  final ApiManager _apiManager;
  SubjectOnlineDatasourceImpl(this._apiManager);
  @override
  Future<Result<List<Subject?>>> getSubjects() async {
    return executeApi(() async {
      final response = await _apiManager.getSubjects();
      List<Subject> subjects = [];
      response?.subjects?.forEach((subject) {
        var dto =
            SubjectDto(id: subject.id, icon: subject.icon, name: subject.name);
        subjects.add(dto.toSubject());
      });
      return subjects;
    });
  }
}
