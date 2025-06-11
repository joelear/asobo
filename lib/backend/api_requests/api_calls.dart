import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SupabaseProd Group Code

class SupabaseProdGroup {
  static String getBaseUrl() =>
      'https://fnadwhzjturpkenvxsat.supabase.co/rest/v1/rpc/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
    'Content-Type': 'application/json',
  };
  static CreateOrGetIndividualChatCall createOrGetIndividualChatCall =
      CreateOrGetIndividualChatCall();
  static FetchChatDetailsCall fetchChatDetailsCall = FetchChatDetailsCall();
  static GetUserConnectionsCall getUserConnectionsCall =
      GetUserConnectionsCall();
  static GetUserConnectionsWithSearchCall getUserConnectionsWithSearchCall =
      GetUserConnectionsWithSearchCall();
  static GetConnectionInfoCall getConnectionInfoCall = GetConnectionInfoCall();
  static FetchUserChatsSinceCall fetchUserChatsSinceCall =
      FetchUserChatsSinceCall();
  static FetchUserMessagesSinceCall fetchUserMessagesSinceCall =
      FetchUserMessagesSinceCall();
  static FetchUserChatsUsersSinceCall fetchUserChatsUsersSinceCall =
      FetchUserChatsUsersSinceCall();
  static FetchUserChatParticipantsSinceCall fetchUserChatParticipantsSinceCall =
      FetchUserChatParticipantsSinceCall();
  static CreateGroupChatCall createGroupChatCall = CreateGroupChatCall();
  static GetRecommendedConnectionsCall getRecommendedConnectionsCall =
      GetRecommendedConnectionsCall();
  static CreateClubMembershipCall createClubMembershipCall =
      CreateClubMembershipCall();
  static CreateGolfRoundCall createGolfRoundCall = CreateGolfRoundCall();
  static GetUpcomingRoundsCall getUpcomingRoundsCall = GetUpcomingRoundsCall();
}

class CreateOrGetIndividualChatCall {
  Future<ApiCallResponse> call({
    String? user1Id = '',
    String? user2Id = '',
    String? createdBy = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user1_id": "${escapeStringForJson(user1Id)}",
  "user2_id": "${escapeStringForJson(user2Id)}",
  "created_by": "${escapeStringForJson(createdBy)}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrGetIndividualChat',
      apiUrl: '${baseUrl}create_or_get_1to1_chat',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchChatDetailsCall {
  Future<ApiCallResponse> call({
    String? inputChatId = '',
    String? currentUserId = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_chat_id": "${escapeStringForJson(inputChatId)}",
  "current_user_id": "${escapeStringForJson(currentUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchChatDetails',
      apiUrl: '${baseUrl}fetch_chat_details',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserConnectionsCall {
  Future<ApiCallResponse> call({
    String? targetUserId = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "target_user_id": "${escapeStringForJson(targetUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get user connections',
      apiUrl: '${baseUrl}/get_user_connections',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserConnectionsWithSearchCall {
  Future<ApiCallResponse> call({
    String? targetUserId = '',
    String? searchQuery = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "target_user_id": "${escapeStringForJson(targetUserId)}",
  "search_query": "${escapeStringForJson(searchQuery)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get user connections with search',
      apiUrl: '${baseUrl}/fetch_user_connections_with_search',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetConnectionInfoCall {
  Future<ApiCallResponse> call({
    String? queryingUserId = '',
    String? targetUserId = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "querying_user_id": "${escapeStringForJson(queryingUserId)}",
  "target_user_id": "${escapeStringForJson(targetUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getConnectionInfo',
      apiUrl: '${baseUrl}/get_connection_info',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchUserChatsSinceCall {
  Future<ApiCallResponse> call({
    String? inputUserId = '',
    int? sinceTimeUnix,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_user_id": "${escapeStringForJson(inputUserId)}",
  "since_time_unix": ${sinceTimeUnix}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchUserChatsSince',
      apiUrl: '${baseUrl}/fetch_user_chats_since',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchUserMessagesSinceCall {
  Future<ApiCallResponse> call({
    String? inputUserId = '',
    int? inputSinceMilli,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_user_id": "${escapeStringForJson(inputUserId)}",
  "input_since_milli": ${inputSinceMilli}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchUserMessagesSince',
      apiUrl: '${baseUrl}/fetch_user_messages_since',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchUserChatsUsersSinceCall {
  Future<ApiCallResponse> call({
    String? inputUserId = '',
    int? inputSinceMilli,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_user_id": "${escapeStringForJson(inputUserId)}",
  "input_since_milli": ${inputSinceMilli}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchUserChatsUsersSince',
      apiUrl: '${baseUrl}/fetch_user_chats_users_since',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchUserChatParticipantsSinceCall {
  Future<ApiCallResponse> call({
    String? inputUserId = '',
    int? inputSinceMilli,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input_user_id": "${escapeStringForJson(inputUserId)}",
  "input_since_milli": ${inputSinceMilli}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchUserChatParticipantsSince',
      apiUrl: '${baseUrl}/fetch_user_chats_participants_since',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateGroupChatCall {
  Future<ApiCallResponse> call({
    String? chatCreator = '',
    List<String>? chatInviteesList,
    String? groupName = '',
    String? groupImageUrl = '',
    String? groupImageBlurHash = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();
    final chatInvitees = _serializeList(chatInviteesList);

    final ffApiRequestBody = '''
{
  "chat_creator": "${escapeStringForJson(chatCreator)}",
  "chat_invitees": ${chatInvitees},
  "group_name": "${escapeStringForJson(groupName)}",
  "group_image_url": "${escapeStringForJson(groupImageUrl)}",
  "group_image_blur_hash": "${escapeStringForJson(groupImageBlurHash)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create group chat',
      apiUrl: '${baseUrl}/create_group_chat',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRecommendedConnectionsCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id_input": "${escapeStringForJson(uuid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRecommendedConnections',
      apiUrl: '${baseUrl}/get_recommended_connections',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateClubMembershipCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    List<String>? clubIdsList,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();
    final clubIds = _serializeList(clubIdsList);

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(userId)}",
  "p_club_ids": ${clubIds}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Club Membership',
      apiUrl: '${baseUrl}create_club_memberships',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateGolfRoundCall {
  Future<ApiCallResponse> call({
    dynamic inputJsonJson,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final inputJson = _serializeJson(inputJsonJson);
    final ffApiRequestBody = '''
{
  "input": ${inputJson}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create golf round ',
      apiUrl: '${baseUrl}/create_golf_round_from_json',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUpcomingRoundsCall {
  Future<ApiCallResponse> call({
    String? pUserId = '',
    int? pLimit,
  }) async {
    final baseUrl = SupabaseProdGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",
  "p_limit": ${pLimit}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUpcomingRounds',
      apiUrl: '${baseUrl}/get_user_upcoming_rounds',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuYWR3aHpqdHVycGtlbnZ4c2F0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzMzk2MzUsImV4cCI6MjA1MDkxNTYzNX0.mqulET9FLztcT2xvx4jbPbq40sc6aPVxJLd2ktEl2Fo',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SupabaseProd Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
