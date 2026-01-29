part of 'global_bloc.dart';

class RetrieveUsersMatchesEvent extends GlobalEvent {
  final String profileId;

  RetrieveUsersMatchesEvent({required this.profileId});
}
