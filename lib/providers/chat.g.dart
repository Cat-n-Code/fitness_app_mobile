// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatByIdHash() => r'2175b012e695ec8464da2757e35d52ba1823d4a6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [chatById].
@ProviderFor(chatById)
const chatByIdProvider = ChatByIdFamily();

/// See also [chatById].
class ChatByIdFamily extends Family<AsyncValue<Chat>> {
  /// See also [chatById].
  const ChatByIdFamily();

  /// See also [chatById].
  ChatByIdProvider call(
    int id,
  ) {
    return ChatByIdProvider(
      id,
    );
  }

  @override
  ChatByIdProvider getProviderOverride(
    covariant ChatByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatByIdProvider';
}

/// See also [chatById].
class ChatByIdProvider extends AutoDisposeFutureProvider<Chat> {
  /// See also [chatById].
  ChatByIdProvider(
    int id,
  ) : this._internal(
          (ref) => chatById(
            ref as ChatByIdRef,
            id,
          ),
          from: chatByIdProvider,
          name: r'chatByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatByIdHash,
          dependencies: ChatByIdFamily._dependencies,
          allTransitiveDependencies: ChatByIdFamily._allTransitiveDependencies,
          id: id,
        );

  ChatByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Chat> Function(ChatByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatByIdProvider._internal(
        (ref) => create(ref as ChatByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Chat> createElement() {
    return _ChatByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatByIdRef on AutoDisposeFutureProviderRef<Chat> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ChatByIdProviderElement extends AutoDisposeFutureProviderElement<Chat>
    with ChatByIdRef {
  _ChatByIdProviderElement(super.provider);

  @override
  int get id => (origin as ChatByIdProvider).id;
}

String _$chatByUserIdHash() => r'085c77daa457bc1ad17e9316ce26c659c0e9fa5a';

/// See also [chatByUserId].
@ProviderFor(chatByUserId)
const chatByUserIdProvider = ChatByUserIdFamily();

/// See also [chatByUserId].
class ChatByUserIdFamily extends Family<AsyncValue<Chat>> {
  /// See also [chatByUserId].
  const ChatByUserIdFamily();

  /// See also [chatByUserId].
  ChatByUserIdProvider call(
    int userId,
  ) {
    return ChatByUserIdProvider(
      userId,
    );
  }

  @override
  ChatByUserIdProvider getProviderOverride(
    covariant ChatByUserIdProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatByUserIdProvider';
}

/// See also [chatByUserId].
class ChatByUserIdProvider extends AutoDisposeFutureProvider<Chat> {
  /// See also [chatByUserId].
  ChatByUserIdProvider(
    int userId,
  ) : this._internal(
          (ref) => chatByUserId(
            ref as ChatByUserIdRef,
            userId,
          ),
          from: chatByUserIdProvider,
          name: r'chatByUserIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatByUserIdHash,
          dependencies: ChatByUserIdFamily._dependencies,
          allTransitiveDependencies:
              ChatByUserIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  ChatByUserIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<Chat> Function(ChatByUserIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatByUserIdProvider._internal(
        (ref) => create(ref as ChatByUserIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Chat> createElement() {
    return _ChatByUserIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatByUserIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatByUserIdRef on AutoDisposeFutureProviderRef<Chat> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _ChatByUserIdProviderElement
    extends AutoDisposeFutureProviderElement<Chat> with ChatByUserIdRef {
  _ChatByUserIdProviderElement(super.provider);

  @override
  int get userId => (origin as ChatByUserIdProvider).userId;
}

String _$chatMessagesHash() => r'f1e24a7ed9e6cd9954c2a61595022a40a18c5484';

/// See also [chatMessages].
@ProviderFor(chatMessages)
const chatMessagesProvider = ChatMessagesFamily();

/// See also [chatMessages].
class ChatMessagesFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [chatMessages].
  const ChatMessagesFamily();

  /// See also [chatMessages].
  ChatMessagesProvider call(
    int chatId,
    int page,
    int count,
  ) {
    return ChatMessagesProvider(
      chatId,
      page,
      count,
    );
  }

  @override
  ChatMessagesProvider getProviderOverride(
    covariant ChatMessagesProvider provider,
  ) {
    return call(
      provider.chatId,
      provider.page,
      provider.count,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatMessagesProvider';
}

/// See also [chatMessages].
class ChatMessagesProvider extends AutoDisposeFutureProvider<List<Message>> {
  /// See also [chatMessages].
  ChatMessagesProvider(
    int chatId,
    int page,
    int count,
  ) : this._internal(
          (ref) => chatMessages(
            ref as ChatMessagesRef,
            chatId,
            page,
            count,
          ),
          from: chatMessagesProvider,
          name: r'chatMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMessagesHash,
          dependencies: ChatMessagesFamily._dependencies,
          allTransitiveDependencies:
              ChatMessagesFamily._allTransitiveDependencies,
          chatId: chatId,
          page: page,
          count: count,
        );

  ChatMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
    required this.page,
    required this.count,
  }) : super.internal();

  final int chatId;
  final int page;
  final int count;

  @override
  Override overrideWith(
    FutureOr<List<Message>> Function(ChatMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatMessagesProvider._internal(
        (ref) => create(ref as ChatMessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
        page: page,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Message>> createElement() {
    return _ChatMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesProvider &&
        other.chatId == chatId &&
        other.page == page &&
        other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatMessagesRef on AutoDisposeFutureProviderRef<List<Message>> {
  /// The parameter `chatId` of this provider.
  int get chatId;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `count` of this provider.
  int get count;
}

class _ChatMessagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Message>>
    with ChatMessagesRef {
  _ChatMessagesProviderElement(super.provider);

  @override
  int get chatId => (origin as ChatMessagesProvider).chatId;
  @override
  int get page => (origin as ChatMessagesProvider).page;
  @override
  int get count => (origin as ChatMessagesProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
