part of 'global_bloc.dart';

extension LandingMethods on GlobalBloc {
  FutureOr<void> _landingStatusRetrieved(
      RetrieveLandingStatusEvent event, Emitter<GlobalState> emit) async {
    final response = await _landingService.retrieveLandingStatus();

    if (response.isSuccess) {
      emit(state.success(
        isLandingCompleted: response.responseObject!,
      ));
    } else {
      emit(state.failure(
          isLandingCompleted: false,
          isAuthenticated: !response.isUnauthorized));
    }
  }

  FutureOr<void> _landingCompleted(
      CompleteLandingEvent event, Emitter<GlobalState> emit) async {
    final response = await _landingService.completeLanding();

    if (response.isSuccess) {
      emit(state.success(isLandingCompleted: true));
    } else {
      emit(state.failure(
          isLandingCompleted: false,
          isAuthenticated: !response.isUnauthorized));
    }
  }

  FutureOr<void> _landingNotCompleted(
      UncompleteLandingEvent event, Emitter<GlobalState> emit) async {
    final response = await _landingService.unCompleteLanding();

    if (response.isSuccess) {
      emit(state.success(isLandingCompleted: false));
    } else {
      emit(state.failure(
          isLandingCompleted: true, isAuthenticated: !response.isUnauthorized));
    }
  }
}
