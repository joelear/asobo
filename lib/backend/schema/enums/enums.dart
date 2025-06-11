import 'package:collection/collection.dart';

enum SearchType {
  users,
  connections,
}

enum ConnectionStatus {
  pending,
  accepted,
  rejected,
  blocked,
  removed,
}

enum NotificationType {
  connection_request,
}

enum ChatParticipantRole {
  owner,
  admin,
  member,
}

enum ChatInviteStatus {
  owner,
  invited,
  accepted,
  declined,
  removed,
}

enum CircleImageSize {
  small32,
  medium48,
  large64,
  xxl96,
}

enum UserListItemType {
  connection,
  user,
}

enum ExplorePageTabs {
  Network,
  Clubs,
}

enum TimeFormat {
  twelveHour,
  twentyFourHour,
}

enum RoundFormat {
  strokePlay,
  stableford,
  matchPlay,
  scramble,
}

enum RoundParticipantStatus {
  invited,
  accepted,
  declined,
}

enum RoundParticipantRole {
  creator,
  player,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SearchType):
      return SearchType.values.deserialize(value) as T?;
    case (ConnectionStatus):
      return ConnectionStatus.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (ChatParticipantRole):
      return ChatParticipantRole.values.deserialize(value) as T?;
    case (ChatInviteStatus):
      return ChatInviteStatus.values.deserialize(value) as T?;
    case (CircleImageSize):
      return CircleImageSize.values.deserialize(value) as T?;
    case (UserListItemType):
      return UserListItemType.values.deserialize(value) as T?;
    case (ExplorePageTabs):
      return ExplorePageTabs.values.deserialize(value) as T?;
    case (TimeFormat):
      return TimeFormat.values.deserialize(value) as T?;
    case (RoundFormat):
      return RoundFormat.values.deserialize(value) as T?;
    case (RoundParticipantStatus):
      return RoundParticipantStatus.values.deserialize(value) as T?;
    case (RoundParticipantRole):
      return RoundParticipantRole.values.deserialize(value) as T?;
    default:
      return null;
  }
}
