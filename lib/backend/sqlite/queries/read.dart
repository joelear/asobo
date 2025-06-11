import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETCHAT
Future<List<GetChatRow>> performGetChat(
  Database database, {
  String? chatId,
}) {
  final query = '''
SELECT 
    chat_id, 
    is_group, 
    chat_name, 
    chat_image_url, 
    chat_image_blur_hash, 
    last_message, 
    last_message_time,
    draft_message,
    last_message_sender_id,
    last_message_sender_first_name
FROM chats
WHERE chat_id = '${chatId}';
''';
  return _readQuery(database, query, (d) => GetChatRow(d));
}

class GetChatRow extends SqliteRow {
  GetChatRow(Map<String, dynamic> data) : super(data);

  String get chatId => data['chat_id'] as String;
  int get isGroup => data['is_group'] as int;
  String get chatName => data['chat_name'] as String;
  String? get chatImageUrl => data['chat_image_url'] as String?;
  String? get chatImageBlurHash => data['chat_image_blur_hash'] as String?;
  String? get lastMessage => data['last_message'] as String?;
  int? get lastMessageTime => data['last_message_time'] as int?;
  String? get draftMessage => data['draft_message'] as String?;
  String? get lastMessageSenderId => data['last_message_sender_id'] as String?;
  String? get lastMessageSenderFirstName =>
      data['last_message_sender_first_name'] as String?;
}

/// END GETCHAT

/// BEGIN GETALLMESSAGESINCHAT
Future<List<GetAllMessagesInChatRow>> performGetAllMessagesInChat(
  Database database, {
  String? chatId,
}) {
  final query = '''
SELECT 
    message_id, 
    created_at, 
    sender_id, 
    message_text,
    sender_first_name,
    is_read
FROM messages
WHERE chat_id = '${chatId}'
ORDER BY created_at DESC;

''';
  return _readQuery(database, query, (d) => GetAllMessagesInChatRow(d));
}

class GetAllMessagesInChatRow extends SqliteRow {
  GetAllMessagesInChatRow(Map<String, dynamic> data) : super(data);

  String get messageId => data['message_id'] as String;
  int get createdAt => data['created_at'] as int;
  String get senderId => data['sender_id'] as String;
  String get messageText => data['message_text'] as String;
  String? get senderFirstName => data['sender_first_name'] as String?;
  int? get isRead => data['is_read'] as int?;
}

/// END GETALLMESSAGESINCHAT

/// BEGIN GETALLCHATS
Future<List<GetAllChatsRow>> performGetAllChats(
  Database database,
) {
  final query = '''
SELECT 
    chat_id, 
    is_group, 
    chat_name, 
    chat_image_url, 
    chat_image_blur_hash, 
    last_message, 
    last_message_time,
    last_message_sender_id,
    last_message_sender_first_name
FROM 
    chats
ORDER BY last_message_time DESC;

''';
  return _readQuery(database, query, (d) => GetAllChatsRow(d));
}

class GetAllChatsRow extends SqliteRow {
  GetAllChatsRow(Map<String, dynamic> data) : super(data);

  String get chatId => data['chat_id'] as String;
  int get isGroup => data['is_group'] as int;
  String? get chatName => data['chat_name'] as String?;
  String? get chatImageUrl => data['chat_image_url'] as String?;
  String? get chatImageBlurHash => data['chat_image_blur_hash'] as String?;
  String? get lastMessage => data['last_message'] as String?;
  int? get lastMessageTime => data['last_message_time'] as int?;
  String? get lastMessageSenderId => data['last_message_sender_id'] as String?;
  String? get lastMessageSenderFirstName =>
      data['last_message_sender_first_name'] as String?;
}

/// END GETALLCHATS

/// BEGIN GETUNSENTMESSAGES
Future<List<GetUnsentMessagesRow>> performGetUnsentMessages(
  Database database,
) {
  final query = '''
SELECT *
FROM messages
WHERE is_sent = 0;

''';
  return _readQuery(database, query, (d) => GetUnsentMessagesRow(d));
}

class GetUnsentMessagesRow extends SqliteRow {
  GetUnsentMessagesRow(Map<String, dynamic> data) : super(data);
}

/// END GETUNSENTMESSAGES

/// BEGIN READALLSYNCSTATUS
Future<List<ReadAllSyncStatusRow>> performReadAllSyncStatus(
  Database database,
) {
  final query = '''
SELECT *
FROM sync_status;
''';
  return _readQuery(database, query, (d) => ReadAllSyncStatusRow(d));
}

class ReadAllSyncStatusRow extends SqliteRow {
  ReadAllSyncStatusRow(Map<String, dynamic> data) : super(data);

  int get chatsLastSynced => data['chats_last_synced'] as int;
  int get chatParticipantsLastSynced =>
      data['chat_participants_last_synced'] as int;
  int get messagesLastSynced => data['messages_last_synced'] as int;
  int get usersLastSynced => data['users_last_synced'] as int;
}

/// END READALLSYNCSTATUS

/// BEGIN GETALLMESSAGES
Future<List<GetAllMessagesRow>> performGetAllMessages(
  Database database,
) {
  final query = '''
SELECT 
    message_id, 
    created_at, 
    sender_id, 
    message_text,
    sender_first_name,
    is_read
FROM messages
ORDER BY created_at DESC;

''';
  return _readQuery(database, query, (d) => GetAllMessagesRow(d));
}

class GetAllMessagesRow extends SqliteRow {
  GetAllMessagesRow(Map<String, dynamic> data) : super(data);

  String? get messageId => data['message_id'] as String?;
  int? get createdAt => data['created_at'] as int?;
  String? get senderId => data['sender_id'] as String?;
  String? get messageText => data['message_text'] as String?;
  int? get isRead => data['is_read'] as int?;
}

/// END GETALLMESSAGES

/// BEGIN GETUNREADMESSAGESINCHAT
Future<List<GetUnreadMessagesInChatRow>> performGetUnreadMessagesInChat(
  Database database, {
  String? chatId,
}) {
  final query = '''
SELECT 
    message_id, 
    created_at, 
    sender_id, 
    message_text,
    sender_first_name,
    is_read
FROM messages
WHERE chat_id = '${chatId}'
AND is_read = 0
ORDER BY created_at DESC;

''';
  return _readQuery(database, query, (d) => GetUnreadMessagesInChatRow(d));
}

class GetUnreadMessagesInChatRow extends SqliteRow {
  GetUnreadMessagesInChatRow(Map<String, dynamic> data) : super(data);

  String? get messageId => data['message_id'] as String?;
  int? get createdAt => data['created_at'] as int?;
  String? get senderId => data['sender_id'] as String?;
  String? get messageText => data['message_text'] as String?;
  String? get senderFirstName => data['sender_first_name'] as String?;
  int? get isRead => data['is_read'] as int?;
}

/// END GETUNREADMESSAGESINCHAT

/// BEGIN GETALLUSERS
Future<List<GetAllUsersRow>> performGetAllUsers(
  Database database,
) {
  final query = '''
SELECT 
    user_id,
    first_name,
    last_name,
    profile_image_url,
    profile_image_blur_hash
FROM users_table;

''';
  return _readQuery(database, query, (d) => GetAllUsersRow(d));
}

class GetAllUsersRow extends SqliteRow {
  GetAllUsersRow(Map<String, dynamic> data) : super(data);

  String? get userId => data['user_id'] as String?;
  String? get firstName => data['first_name'] as String?;
  String? get lastName => data['last_name'] as String?;
  String? get profileImageUrl => data['profile_image_url'] as String?;
  String? get profileImageBlurHash =>
      data['profile_image_blur_hash'] as String?;
}

/// END GETALLUSERS

/// BEGIN GETALLCHATPARTICIPANTS
Future<List<GetAllChatParticipantsRow>> performGetAllChatParticipants(
  Database database,
) {
  final query = '''
SELECT 
    participant_id,
    chat_id,
    user_id,
    participant_role
FROM chat_participants;

''';
  return _readQuery(database, query, (d) => GetAllChatParticipantsRow(d));
}

class GetAllChatParticipantsRow extends SqliteRow {
  GetAllChatParticipantsRow(Map<String, dynamic> data) : super(data);

  String? get participantId => data['participant_id'] as String?;
  String? get chatId => data['chat_id'] as String?;
  String? get userId => data['user_id'] as String?;
  String? get participantRole => data['participant_role'] as String?;
}

/// END GETALLCHATPARTICIPANTS
