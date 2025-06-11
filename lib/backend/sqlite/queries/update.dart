import 'package:sqflite/sqflite.dart';

/// BEGIN INSERTORUPDATECHAT
Future performInsertOrUpdateChat(
  Database database, {
  String? chatId,
  int? isGroup,
  String? chatName,
  String? chatImageUrl,
  String? chatImageBlurHash,
  String? lastMessage,
  int? lastMessageTime,
  String? lastMessageSenderId,
  String? lastMessageSenderFirstName,
}) {
  final query = '''
INSERT OR REPLACE INTO chats (
    chat_id,
    is_group,
    chat_name,
    chat_image_url,
    chat_image_blur_hash,
    last_message,
    last_message_time,
    last_message_sender_id,
    last_message_sender_first_name
) VALUES (
    '${chatId}',
    ${isGroup},
    '${chatName}',
    '${chatImageUrl}',
    '${chatImageBlurHash}',
    '${lastMessage}',
    ${lastMessageTime},
    '${lastMessageSenderId}',
    '${lastMessageSenderFirstName}'
);

''';
  return database.rawQuery(query);
}

/// END INSERTORUPDATECHAT

/// BEGIN INSERTMESSAGE
Future performInsertMessage(
  Database database, {
  String? messageId,
  String? chatId,
  String? senderId,
  int? createdAt,
  String? messageText,
  int? isSent,
  String? senderFirstName,
  int? isRead,
}) {
  final query = '''
INSERT INTO messages (
    message_id, chat_id, sender_id, created_at, message_text, is_sent, sender_first_name, is_read
) 
VALUES (
    '${messageId}', 
    '${chatId}',
    '${senderId}', 
    ${createdAt},
    '${messageText}',
    ${isSent},
    '${senderFirstName}',
    ${isRead}
)
ON CONFLICT(message_id) DO UPDATE SET
    chat_id = excluded.chat_id,
    sender_id = excluded.sender_id,
    created_at = excluded.created_at,
    message_text = excluded.message_text,
    is_sent = excluded.is_sent,
    sender_first_name = excluded.sender_first_name
-- 👇 Don't overwrite local is_read!
-- is_read = messages.is_read
;

''';
  return database.rawQuery(query);
}

/// END INSERTMESSAGE

/// BEGIN READALLMESSAGESINCHAT
Future performReadAllMessagesInChat(
  Database database, {
  String? chatId,
}) {
  final query = '''
UPDATE messages
SET is_read = 1
WHERE chat_id = '${chatId}'
''';
  return database.rawQuery(query);
}

/// END READALLMESSAGESINCHAT

/// BEGIN SETCHATSLASTSYNCED
Future performSetChatsLastSynced(
  Database database, {
  int? newSyncTime,
}) {
  final query = '''
UPDATE sync_status
SET chats_last_synced = ${newSyncTime}
WHERE rowid = 1;

''';
  return database.rawQuery(query);
}

/// END SETCHATSLASTSYNCED

/// BEGIN SETCHATPARTICIPANTSLASTSYNCED
Future performSetChatParticipantsLastSynced(
  Database database, {
  int? newSyncTime,
}) {
  final query = '''
UPDATE sync_status
SET chat_participants_last_synced = ${newSyncTime}
WHERE rowid = 1;

''';
  return database.rawQuery(query);
}

/// END SETCHATPARTICIPANTSLASTSYNCED

/// BEGIN SETMESSAGESLASTSYNCED
Future performSetMessagesLastSynced(
  Database database, {
  int? newSyncTime,
}) {
  final query = '''
UPDATE sync_status
SET messages_last_synced = ${newSyncTime}
WHERE rowid = 1;

''';
  return database.rawQuery(query);
}

/// END SETMESSAGESLASTSYNCED

/// BEGIN SETUSERSLASTSYNCED
Future performSetUsersLastSynced(
  Database database, {
  int? newSyncTime,
}) {
  final query = '''
UPDATE sync_status
SET users_last_synced = ${newSyncTime}
WHERE rowid = 1;

''';
  return database.rawQuery(query);
}

/// END SETUSERSLASTSYNCED

/// BEGIN INSERTORREPLACECHATPARTICIPANT
Future performInsertOrReplaceChatParticipant(
  Database database, {
  String? participantId,
  String? chatId,
  String? userId,
  String? participantRole,
}) {
  final query = '''
INSERT OR REPLACE INTO chat_participants (
    participant_id,
    chat_id,
    user_id,
    participant_role
) VALUES (
    '${participantId}',
    '${chatId}',
    '${userId}',
    '${participantRole}'
);

''';
  return database.rawQuery(query);
}

/// END INSERTORREPLACECHATPARTICIPANT

/// BEGIN INSERTORREPLACEUSER
Future performInsertOrReplaceUser(
  Database database, {
  String? userId,
  String? firstName,
  String? lastName,
  String? profileImageUrl,
  String? profileImageBlurHash,
}) {
  final query = '''
INSERT OR REPLACE INTO users_table (
    user_id,
    first_name,
    last_name,
    profile_image_url,
    profile_image_blur_hash
) VALUES (
    '${userId}',
    '${firstName}',
    '${lastName}',
    '${profileImageUrl}',
    '${profileImageBlurHash}'
);

''';
  return database.rawQuery(query);
}

/// END INSERTORREPLACEUSER

/// BEGIN DELETEALLCHATS
Future performDeleteAllChats(
  Database database,
) {
  final query = '''
DELETE FROM chats;

''';
  return database.rawQuery(query);
}

/// END DELETEALLCHATS

/// BEGIN UPDATEDRAFTMESSAGE
Future performUpdateDraftMessage(
  Database database, {
  String? chatId,
  String? draftMessage,
}) {
  final query = '''
UPDATE chats
SET draft_message = '${draftMessage}'
WHERE chat_id = '${chatId}';
''';
  return database.rawQuery(query);
}

/// END UPDATEDRAFTMESSAGE
