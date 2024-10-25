import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/contracts/subjects/subject_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/subject.dart';
import 'package:elevate_online_exam/domain/repos/subject_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SubjectRepo)
class SubjectRepoImpl implements SubjectRepo{
 final SubjectOnlineDatasource _subjectOnlineDatasource;
 SubjectRepoImpl(this._subjectOnlineDatasource);
  @override
  Future<Result<List<Subject?>>> getSubjects() async{
    var result= await _subjectOnlineDatasource.getSubjects();
    return result;
  }
  

  
}
