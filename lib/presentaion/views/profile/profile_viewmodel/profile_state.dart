
sealed class ProfileState {}
class ProfileInitialState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class EditProfileLoadingState extends ProfileState{}
class ProfileSuccessState extends ProfileState{
}
class EditProfileSuccessState extends ProfileState{
}
class ProfileErrorState extends ProfileState{
final Exception?exception;

ProfileErrorState(this.exception);
}