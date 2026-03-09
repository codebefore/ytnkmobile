part of 'global_bloc.dart';

//todo: language code can be obtained from db profile.languageCode

extension MatchMethods on GlobalBloc {
  FutureOr<void> _getUsersMatches(
      RetrieveUsersMatchesEvent event, Emitter<GlobalState> emit) async {
    var response = await _matchRepository.getProfileMatches(
        event.profileId, state.profile.languageCode);

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

  FutureOr<void> _acceptMatch(
      AcceptMatchEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.acceptMatch));

    final response = await _matchRepository.acceptMatch(event.matchId);
    if (!response.isSuccess) {
      emit(state.failure(
        infoMessage: response.message,
        isAuthenticated: !response.isUnauthorized,
        lastOperation: Operations.acceptMatch,
      ));
      return;
    }

    final refreshResponse = await _matchRepository.getProfileMatches(
        state.profile.id, state.profile.languageCode);

    if (refreshResponse.isSuccess) {
      emit(state.success(
        matches: refreshResponse.responseObject!,
        lastOperation: Operations.acceptMatch,
      ));
      return;
    }

    emit(state.failure(
      infoMessage: refreshResponse.message,
      isAuthenticated: !refreshResponse.isUnauthorized,
      lastOperation: Operations.acceptMatch,
    ));
  }

  FutureOr<void> _rejectMatch(
      RejectMatchEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.rejectMatch));

    final response = await _matchRepository.rejectMatch(
      event.matchId,
      alsoRefer: event.alsoRefer,
      email: event.email,
    );
    if (!response.isSuccess) {
      emit(state.failure(
        infoMessage: response.message,
        isAuthenticated: !response.isUnauthorized,
        lastOperation: Operations.rejectMatch,
      ));
      return;
    }

    final refreshResponse = await _matchRepository.getProfileMatches(
        state.profile.id, state.profile.languageCode);

    if (refreshResponse.isSuccess) {
      emit(state.success(
        matches: refreshResponse.responseObject!,
        lastOperation: Operations.rejectMatch,
      ));
      return;
    }

    emit(state.failure(
      infoMessage: refreshResponse.message,
      isAuthenticated: !refreshResponse.isUnauthorized,
      lastOperation: Operations.rejectMatch,
    ));
  }
}
