// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../common/prefs_manager.dart' as _i298;
import '../data/api/api_manager.dart' as _i93;
import '../data/contracts/auth/auth_online_datasource.dart' as _i62;
import '../data/contracts/Exam/exam_online_datasource.dart' as _i855;
import '../data/contracts/exams/exams_online_datasource.dart' as _i522;
import '../data/contracts/subjects/subject_online_datasource.dart' as _i847;
import '../data/datasource/auth/auth_online_datasource_impl.dart' as _i567;
import '../data/datasource/Exam/exam_online_datasource_impl.dart' as _i397;
import '../data/datasource/exams/exams_online_datasource_impl.dart' as _i827;
import '../data/datasource/subjects/subject_online_datasource_impl.dart'
    as _i514;
import '../data/responseimpl/auth/auth_repo_impl.dart' as _i253;
import '../data/responseimpl/exam_questions_repo.dart/exam_questions_repo_impl.dart'
    as _i914;
import '../data/responseimpl/exam_repo_impl/exams_repo_impl.dart' as _i1043;
import '../data/responseimpl/subject_repo/subject_repo_impl.dart' as _i833;
import '../domain/repos/authentication_repo.dart' as _i1053;
import '../domain/repos/exam_questions_repo.dart' as _i241;
import '../domain/repos/exams_repo.dart' as _i536;
import '../domain/repos/subject_repo.dart' as _i144;
import '../domain/usecases/authentication/forget_password_usecase.dart'
    as _i228;
import '../domain/usecases/authentication/login_usecase.dart' as _i827;
import '../domain/usecases/authentication/register_usecase.dart' as _i796;
import '../domain/usecases/examQuestions/get_exam_questions_usecase.dart'
    as _i846;
import '../domain/usecases/exams/get_exams_bySubject_usecase.dart' as _i267;
import '../domain/usecases/subject/get_subjects_usecase.dart' as _i424;
import '../presentaion/views/exams/exams_viewmodel/exams_viewmodel.dart'
    as _i390;
import '../presentaion/views/forget_password/foreget_password_viewmodel.dart'
    as _i138;
import '../presentaion/views/forget_password/forget_password_validator/forget_password_validator.dart'
    as _i322;
import '../presentaion/views/home/home_viewModel.dart' as _i52;
import '../presentaion/views/login/login_validator/login_validator.dart'
    as _i788;
import '../presentaion/views/login/login_viewmodel.dart' as _i668;
import '../presentaion/views/questions/questions_viewmodel.dart' as _i433;
import '../presentaion/views/register/register_validator/register_validator.dart'
    as _i928;
import '../presentaion/views/register/register_viewmodel.dart' as _i52;
import '../presentaion/views/subject/view_model/subject_viewModel.dart'
    as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i298.CacheHelper>(() => _i298.CacheHelper());
    gh.factory<_i788.LoginValidator>(() => _i788.LoginValidator());
    gh.factory<_i322.ForgetPasswordValidator>(
        () => _i322.ForgetPasswordValidator());
    gh.factory<_i52.HomeViewmodel>(() => _i52.HomeViewmodel());
    gh.factory<_i928.RegisterValidator>(() => _i928.RegisterValidator());
    gh.lazySingleton<_i93.ApiManager>(() => _i93.ApiManager());
    gh.factory<_i522.ExamsOnlineDatasource>(
        () => _i827.ExamsOnlineDatasourceImpl(gh<_i93.ApiManager>()));
    gh.factory<_i855.ExamOnlineDatasource>(
        () => _i397.ExamOnlineDatasourceImpl(gh<_i93.ApiManager>()));
    gh.factory<_i847.SubjectOnlineDatasource>(
        () => _i514.SubjectOnlineDatasourceImpl(gh<_i93.ApiManager>()));
    gh.factory<_i241.ExamQuestionsRepo>(
        () => _i914.ExamQuestionsRepoImpl(gh<_i855.ExamOnlineDatasource>()));
    gh.factory<_i536.ExamRepo>(
        () => _i1043.ExamRepoImpl(gh<_i522.ExamsOnlineDatasource>()));
    gh.factory<_i144.SubjectRepo>(
        () => _i833.SubjectRepoImpl(gh<_i847.SubjectOnlineDatasource>()));
    gh.factory<_i62.AuthOnlineDatasource>(() => _i567.AuthOnlineDatasourceImpl(
          apiManager: gh<_i93.ApiManager>(),
          cacheHelper: gh<_i298.CacheHelper>(),
        ));
    gh.factory<_i846.GetExamQuestionsUsecase>(
        () => _i846.GetExamQuestionsUsecase(gh<_i241.ExamQuestionsRepo>()));
    gh.factory<_i267.GetExamsBySubjectUsecase>(
        () => _i267.GetExamsBySubjectUsecase(gh<_i536.ExamRepo>()));
    gh.factory<_i424.GetSubjectsUsecase>(
        () => _i424.GetSubjectsUsecase(gh<_i144.SubjectRepo>()));
    gh.factory<_i1053.AuthenticationRepo>(
        () => _i253.AuthRepoImpl(gh<_i62.AuthOnlineDatasource>()));
    gh.factory<_i827.LoginUsecase>(
        () => _i827.LoginUsecase(gh<_i1053.AuthenticationRepo>()));
    gh.factory<_i796.RegisterUsecase>(
        () => _i796.RegisterUsecase(gh<_i1053.AuthenticationRepo>()));
    gh.factory<_i433.QuestionsViewmodel>(
        () => _i433.QuestionsViewmodel(gh<_i846.GetExamQuestionsUsecase>()));
    gh.factory<_i390.ExamsViewmodel>(
        () => _i390.ExamsViewmodel(gh<_i267.GetExamsBySubjectUsecase>()));
    gh.factory<_i784.SubjectViewmodel>(
        () => _i784.SubjectViewmodel(gh<_i424.GetSubjectsUsecase>()));
    gh.factory<_i52.RegisterViewmodel>(() => _i52.RegisterViewmodel(
          gh<_i796.RegisterUsecase>(),
          gh<_i928.RegisterValidator>(),
        ));
    gh.factory<_i668.LoginViewModel>(
        () => _i668.LoginViewModel(gh<_i827.LoginUsecase>()));
    gh.factory<_i228.ForgetPasswordUsecase>(
        () => _i228.ForgetPasswordUsecase(gh<_i1053.AuthenticationRepo>()));
    gh.factory<_i138.ForegetPasswordViewmodel>(
        () => _i138.ForegetPasswordViewmodel(
              gh<_i228.ForgetPasswordUsecase>(),
              gh<_i322.ForgetPasswordValidator>(),
            ));
    return this;
  }
}
