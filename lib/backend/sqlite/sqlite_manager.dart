import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'asobo_d_bv22',
      'AsoboDBv22.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetChatRow>> getChat({
    String? chatId,
  }) =>
      performGetChat(
        _database,
        chatId: chatId,
      );

  Future<List<GetAllMessagesInChatRow>> getAllMessagesInChat({
    String? chatId,
  }) =>
      performGetAllMessagesInChat(
        _database,
        chatId: chatId,
      );

  Future<List<GetAllChatsRow>> getAllChats() => performGetAllChats(
        _database,
      );

  Future<List<GetUnsentMessagesRow>> getUnsentMessages() =>
      performGetUnsentMessages(
        _database,
      );

  Future<List<ReadAllSyncStatusRow>> readAllSyncStatus() =>
      performReadAllSyncStatus(
        _database,
      );

  Future<List<GetAllMessagesRow>> getAllMessages() => performGetAllMessages(
        _database,
      );

  Future<List<GetUnreadMessagesInChatRow>> getUnreadMessagesInChat({
    String? chatId,
  }) =>
      performGetUnreadMessagesInChat(
        _database,
        chatId: chatId,
      );

  Future<List<GetAllUsersRow>> getAllUsers() => performGetAllUsers(
        _database,
      );

  Future<List<GetAllChatParticipantsRow>> getAllChatParticipants() =>
      performGetAllChatParticipants(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertOrUpdateChat({
    String? chatId,
    int? isGroup,
    String? chatName,
    String? chatImageUrl,
    String? chatImageBlurHash,
    String? lastMessage,
    int? lastMessageTime,
    String? lastMessageSenderId,
    String? lastMessageSenderFirstName,
  }) =>
      performInsertOrUpdateChat(
        _database,
        chatId: chatId,
        isGroup: isGroup,
        chatName: chatName,
        chatImageUrl: chatImageUrl,
        chatImageBlurHash: chatImageBlurHash,
        lastMessage: lastMessage,
        lastMessageTime: lastMessageTime,
        lastMessageSenderId: lastMessageSenderId,
        lastMessageSenderFirstName: lastMessageSenderFirstName,
      );

  Future insertMessage({
    String? messageId,
    String? chatId,
    String? senderId,
    int? createdAt,
    String? messageText,
    int? isSent,
    String? senderFirstName,
    int? isRead,
  }) =>
      performInsertMessage(
        _database,
        messageId: messageId,
        chatId: chatId,
        senderId: senderId,
        createdAt: createdAt,
        messageText: messageText,
        isSent: isSent,
        senderFirstName: senderFirstName,
        isRead: isRead,
      );

  Future readAllMessagesInChat({
    String? chatId,
  }) =>
      performReadAllMessagesInChat(
        _database,
        chatId: chatId,
      );

  Future setChatsLastSynced({
    int? newSyncTime,
  }) =>
      performSetChatsLastSynced(
        _database,
        newSyncTime: newSyncTime,
      );

  Future setChatParticipantsLastSynced({
    int? newSyncTime,
  }) =>
      performSetChatParticipantsLastSynced(
        _database,
        newSyncTime: newSyncTime,
      );

  Future setMessagesLastSynced({
    int? newSyncTime,
  }) =>
      performSetMessagesLastSynced(
        _database,
        newSyncTime: newSyncTime,
      );

  Future setUsersLastSynced({
    int? newSyncTime,
  }) =>
      performSetUsersLastSynced(
        _database,
        newSyncTime: newSyncTime,
      );

  Future insertOrReplaceChatParticipant({
    String? participantId,
    String? chatId,
    String? userId,
    String? participantRole,
  }) =>
      performInsertOrReplaceChatParticipant(
        _database,
        participantId: participantId,
        chatId: chatId,
        userId: userId,
        participantRole: participantRole,
      );

  Future insertOrReplaceUser({
    String? userId,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? profileImageBlurHash,
  }) =>
      performInsertOrReplaceUser(
        _database,
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        profileImageUrl: profileImageUrl,
        profileImageBlurHash: profileImageBlurHash,
      );

  Future deleteAllChats() => performDeleteAllChats(
        _database,
      );

  Future updateDraftMessage({
    String? chatId,
    String? draftMessage,
  }) =>
      performUpdateDraftMessage(
        _database,
        chatId: chatId,
        draftMessage: draftMessage,
      );

  /// END UPDATE QUERY CALLS
}
