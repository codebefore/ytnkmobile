part of 'global_bloc.dart';

class RetrieveUsersMatchesEvent extends GlobalEvent {
  final String profileId;

  RetrieveUsersMatchesEvent({required this.profileId});
}

class AcceptMatchEvent extends GlobalEvent {
  final String matchId;

  AcceptMatchEvent({required this.matchId});
}

class RejectMatchEvent extends GlobalEvent {
  final String matchId;
  final bool alsoRefer;
  final String email;

  RejectMatchEvent({
    required this.matchId,
    this.alsoRefer = false,
    this.email = "",
  });
}
