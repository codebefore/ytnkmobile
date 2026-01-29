part of 'global_bloc.dart';

//todo: language code can be obtained from db profile.languageCode

extension MatchMethods on GlobalBloc {
  FutureOr<void> _getUsersMatches(
      RetrieveUsersMatchesEvent event, Emitter<GlobalState> emit) async {
    var response = await _matchRepository.getProfileMatches(event.profileId, state.profile.languageCode);

    if (response.isSuccess) {
      emit(
        state.success(
          matches: response.responseObject!,
        ),
      );
    } else {
      emit(state.failure(
          isAuthenticated: !response.isUnauthorized, matches: List.empty()));
    }
  }
}
