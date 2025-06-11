import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';

Future openNewOrExistingChat(
  BuildContext context, {
  required String? userToChatWith,
}) async {
  ApiCallResponse? newChatCreation;
  ApiCallResponse? chatDetails;

  newChatCreation = await SupabaseProdGroup.createOrGetIndividualChatCall.call(
    user1Id: currentUserUid,
    user2Id: userToChatWith,
    createdBy: currentUserUid,
  );

  if ((newChatCreation.succeeded ?? true)) {
    // Get chat details
    chatDetails = await SupabaseProdGroup.fetchChatDetailsCall.call(
      inputChatId:
          NewChatResponseStruct.maybeFromMap((newChatCreation.jsonBody ?? ''))
              ?.chatId,
      currentUserId: currentUserUid,
    );

    if ((chatDetails.succeeded ?? true)) {
      // updateChat
      await SQLiteManager.instance.insertOrUpdateChat(
        chatId: ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))?.chatId,
        chatName:
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))?.chatName,
        chatImageUrl: ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))
            ?.chatImageUrl,
        chatImageBlurHash:
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))
                ?.chatImageBlurHash,
        lastMessage:
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))?.lastMessage,
        lastMessageTime: ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))
            ?.lastMessageTimeUnixMilli,
        isGroup: 0,
        lastMessageSenderFirstName:
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))
                ?.lastMessageSenderFirstName,
        lastMessageSenderId:
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))
                ?.lastMessageSenderId,
      );
      if (Navigator.of(context).canPop()) {
        context.pop();
      }
      context.pushNamed(
        ChatWidget.routeName,
        queryParameters: {
          'chatId': serializeParam(
            ChatStruct.maybeFromMap((chatDetails.jsonBody ?? ''))?.chatId,
            ParamType.String,
          ),
        }.withoutNulls,
      );
    }
  }
}

Future fetchNewMessages(BuildContext context) async {
  List<ReadAllSyncStatusRow>? lastSynced;
  ApiCallResponse? newMessagesFromSupabase;

  lastSynced = await SQLiteManager.instance.readAllSyncStatus();
  FFAppState().messagesFetchTime = getCurrentTimestamp;
  newMessagesFromSupabase =
      await SupabaseProdGroup.fetchUserMessagesSinceCall.call(
    inputUserId: currentUserUid,
    inputSinceMilli: valueOrDefault<int>(
      lastSynced.firstOrNull?.messagesLastSynced,
      0,
    ),
  );

  if (((newMessagesFromSupabase.jsonBody ?? '')
              .toList()
              .map<MessageStruct?>(MessageStruct.maybeFromMap)
              .toList() as Iterable<MessageStruct?>)
          .withoutNulls
          .length >
      0) {
    FFAppState().newMessagesIndex = 0;
    while (FFAppState().newMessagesIndex <
        ((newMessagesFromSupabase.jsonBody ?? '')
                .toList()
                .map<MessageStruct?>(MessageStruct.maybeFromMap)
                .toList() as Iterable<MessageStruct?>)
            .withoutNulls
            .length) {
      await SQLiteManager.instance.insertMessage(
        messageId: ((newMessagesFromSupabase.jsonBody ?? '')
                .toList()
                .map<MessageStruct?>(MessageStruct.maybeFromMap)
                .toList() as Iterable<MessageStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().newMessagesIndex)!
            .messageId,
        chatId: ((newMessagesFromSupabase.jsonBody ?? '')
                .toList()
                .map<MessageStruct?>(MessageStruct.maybeFromMap)
                .toList() as Iterable<MessageStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().newMessagesIndex)!
            .chatId,
        senderId: ((newMessagesFromSupabase.jsonBody ?? '')
                .toList()
                .map<MessageStruct?>(MessageStruct.maybeFromMap)
                .toList() as Iterable<MessageStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().newMessagesIndex)!
            .senderId,
        createdAt: valueOrDefault<int>(
          (((newMessagesFromSupabase.jsonBody ?? '')
                      .toList()
                      .map<MessageStruct?>(MessageStruct.maybeFromMap)
                      .toList() as Iterable<MessageStruct?>)
                  .withoutNulls
                  .elementAtOrNull(FFAppState().newMessagesIndex))
              ?.createdAtUnixMilli,
          1,
        ),
        messageText: ((newMessagesFromSupabase.jsonBody ?? '')
                .toList()
                .map<MessageStruct?>(MessageStruct.maybeFromMap)
                .toList() as Iterable<MessageStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().newMessagesIndex)!
            .messageText,
        isSent: 1,
        senderFirstName: (((newMessagesFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<MessageStruct?>(MessageStruct.maybeFromMap)
                    .toList() as Iterable<MessageStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().newMessagesIndex))
            ?.senderFirstName,
        isRead: 0,
      );
      FFAppState().newMessagesIndex = FFAppState().newMessagesIndex + 1;
    }
    FFAppState().newMessagesIndex = 0;
    await SQLiteManager.instance.setMessagesLastSynced(
      newSyncTime: FFAppState().messagesFetchTime!.millisecondsSinceEpoch,
    );
    FFAppState().messagesFetchTime =
        DateTime.fromMillisecondsSinceEpoch(1704067200000);
  }
}

Future fetchNewChats(BuildContext context) async {
  List<ReadAllSyncStatusRow>? lastSynced;
  ApiCallResponse? newChatsFromSupabase;

  lastSynced = await SQLiteManager.instance.readAllSyncStatus();
  FFAppState().fetchTime = getCurrentTimestamp;
  newChatsFromSupabase = await SupabaseProdGroup.fetchUserChatsSinceCall.call(
    inputUserId: currentUserUid,
    sinceTimeUnix: valueOrDefault<int>(
      lastSynced.firstOrNull?.chatsLastSynced,
      0,
    ),
  );

  if (((newChatsFromSupabase.jsonBody ?? '')
              .toList()
              .map<ChatStruct?>(ChatStruct.maybeFromMap)
              .toList() as Iterable<ChatStruct?>)
          .withoutNulls
          .length >
      0) {
    FFAppState().syncIndex = 0;
    while (FFAppState().syncIndex <
        ((newChatsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatStruct?>(ChatStruct.maybeFromMap)
                .toList() as Iterable<ChatStruct?>)
            .withoutNulls
            .length) {
      await SQLiteManager.instance.insertOrUpdateChat(
        chatId: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.chatId,
        isGroup: (((newChatsFromSupabase.jsonBody ?? '')
                            .toList()
                            .map<ChatStruct?>(ChatStruct.maybeFromMap)
                            .toList() as Iterable<ChatStruct?>)
                        .withoutNulls
                        .elementAtOrNull(FFAppState().syncIndex))
                    ?.isGroup ==
                true
            ? 1
            : 0,
        chatName: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.chatName,
        chatImageUrl: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.chatImageUrl,
        chatImageBlurHash: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.chatImageBlurHash,
        lastMessage: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.lastMessage,
        lastMessageTime: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.lastMessageTimeUnixMilli,
        lastMessageSenderId: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.lastMessageSenderId,
        lastMessageSenderFirstName: (((newChatsFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<ChatStruct?>(ChatStruct.maybeFromMap)
                    .toList() as Iterable<ChatStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.lastMessageSenderFirstName,
      );
      FFAppState().syncIndex = FFAppState().syncIndex + 1;
    }
    FFAppState().syncIndex = 0;
    await SQLiteManager.instance.setChatsLastSynced(
      newSyncTime: FFAppState().fetchTime!.millisecondsSinceEpoch,
    );
    FFAppState().fetchTime = DateTime.fromMillisecondsSinceEpoch(1704067200000);
  }
}

Future messageAndChatRefresher(BuildContext context) async {}

Future fetchNewUsers(BuildContext context) async {
  List<ReadAllSyncStatusRow>? lastSynced;
  ApiCallResponse? newUsersFromSupabase;

  lastSynced = await SQLiteManager.instance.readAllSyncStatus();
  FFAppState().fetchTime = getCurrentTimestamp;
  newUsersFromSupabase =
      await SupabaseProdGroup.fetchUserChatsUsersSinceCall.call(
    inputUserId: currentUserUid,
    inputSinceMilli: 0,
  );

  if (((newUsersFromSupabase.jsonBody ?? '')
              .toList()
              .map<UserStruct?>(UserStruct.maybeFromMap)
              .toList() as Iterable<UserStruct?>)
          .withoutNulls
          .length >
      0) {
    FFAppState().syncIndex = 0;
    while (FFAppState().syncIndex <
        ((newUsersFromSupabase.jsonBody ?? '')
                .toList()
                .map<UserStruct?>(UserStruct.maybeFromMap)
                .toList() as Iterable<UserStruct?>)
            .withoutNulls
            .length) {
      await SQLiteManager.instance.insertOrReplaceUser(
        userId: ((newUsersFromSupabase.jsonBody ?? '')
                .toList()
                .map<UserStruct?>(UserStruct.maybeFromMap)
                .toList() as Iterable<UserStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .userId,
        firstName: ((newUsersFromSupabase.jsonBody ?? '')
                .toList()
                .map<UserStruct?>(UserStruct.maybeFromMap)
                .toList() as Iterable<UserStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .firstName,
        lastName: ((newUsersFromSupabase.jsonBody ?? '')
                .toList()
                .map<UserStruct?>(UserStruct.maybeFromMap)
                .toList() as Iterable<UserStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .lastName,
        profileImageUrl: (((newUsersFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<UserStruct?>(UserStruct.maybeFromMap)
                    .toList() as Iterable<UserStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.profileImageUrl,
        profileImageBlurHash: (((newUsersFromSupabase.jsonBody ?? '')
                    .toList()
                    .map<UserStruct?>(UserStruct.maybeFromMap)
                    .toList() as Iterable<UserStruct?>)
                .withoutNulls
                .elementAtOrNull(FFAppState().syncIndex))
            ?.profileImageBlurHash,
      );
      FFAppState().syncIndex = FFAppState().syncIndex + 1;
    }
    FFAppState().syncIndex = 0;
    await SQLiteManager.instance.setUsersLastSynced(
      newSyncTime: FFAppState().fetchTime!.millisecondsSinceEpoch,
    );
    FFAppState().fetchTime = DateTime.fromMillisecondsSinceEpoch(1704067200000);
  }
}

Future fetchChatParticipants(BuildContext context) async {
  List<ReadAllSyncStatusRow>? lastSynced;
  ApiCallResponse? newChatParticipantsFromSupabase;

  lastSynced = await SQLiteManager.instance.readAllSyncStatus();
  FFAppState().fetchTime = getCurrentTimestamp;
  newChatParticipantsFromSupabase =
      await SupabaseProdGroup.fetchUserChatParticipantsSinceCall.call(
    inputUserId: currentUserUid,
    inputSinceMilli: 0,
  );

  if (((newChatParticipantsFromSupabase.jsonBody ?? '')
              .toList()
              .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
              .toList() as Iterable<ChatParticipantStruct?>)
          .withoutNulls
          .length >
      0) {
    FFAppState().syncIndex = 0;
    while (FFAppState().syncIndex <
        ((newChatParticipantsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
                .toList() as Iterable<ChatParticipantStruct?>)
            .withoutNulls
            .length) {
      await SQLiteManager.instance.insertOrReplaceChatParticipant(
        participantId: ((newChatParticipantsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
                .toList() as Iterable<ChatParticipantStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .participantId,
        chatId: ((newChatParticipantsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
                .toList() as Iterable<ChatParticipantStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .chatId,
        userId: ((newChatParticipantsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
                .toList() as Iterable<ChatParticipantStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .userId,
        participantRole: ((newChatParticipantsFromSupabase.jsonBody ?? '')
                .toList()
                .map<ChatParticipantStruct?>(ChatParticipantStruct.maybeFromMap)
                .toList() as Iterable<ChatParticipantStruct?>)
            .withoutNulls
            .elementAtOrNull(FFAppState().syncIndex)!
            .participantRole,
      );
      FFAppState().syncIndex = FFAppState().syncIndex + 1;
    }
    FFAppState().syncIndex = 0;
    await SQLiteManager.instance.setChatParticipantsLastSynced(
      newSyncTime: FFAppState().fetchTime!.millisecondsSinceEpoch,
    );
    FFAppState().fetchTime = DateTime.fromMillisecondsSinceEpoch(1704067200000);
  }
}

Future readAllMessagesInChat(BuildContext context) async {}

Future initialiseOneSignal(BuildContext context) async {
  String? onesignalPlayerId;

  if (!FFAppState().isOneSignalInit) {
    onesignalPlayerId = await actions.initialiseOneSignal(
      '',
    );
    await UsersTable().update(
      data: {
        'onesignal_player_id': onesignalPlayerId,
      },
      matchingRows: (rows) => rows.eqOrNull(
        'id',
        currentUserUid,
      ),
    );
  }
}

Future unusedBlock(BuildContext context) async {}
