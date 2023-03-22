// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class BookPage extends ConsumerWidget {
  const BookPage(
    @PathParam('bookId') this.bookId, {
    Key? key,
  }) : super(key: key);

  final String bookId;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _bookPage(
        _context,
        bookId,
      );
}

class _BookBlock extends HookConsumerWidget {
  const _BookBlock(
    this.bookId, {
    Key? key,
  }) : super(key: key);

  final String bookId;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __bookBlock(
        _context,
        _ref,
        bookId,
      );
}

class _BookInfo extends ConsumerWidget {
  const _BookInfo(
    this.book, {
    Key? key,
  }) : super(key: key);

  final BookEntity book;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __bookInfo(
        _context,
        _ref,
        book,
      );
}

class _TagLink extends ConsumerWidget {
  const _TagLink(
    this.tag, {
    Key? key,
  }) : super(key: key);

  final BookEntity$Tags$Item tag;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __tagLink(
        _ref,
        tag,
      );
}

class _DownloadBtn extends HookConsumerWidget {
  const _DownloadBtn(
    this.book, {
    Key? key,
  }) : super(key: key);

  final BookEntity book;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __downloadBtn(
        _context,
        _ref,
        book,
      );
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$fetchBookFileHash() => r'23b2b9a8a91771369860b1952eaf4fc2086a8768';

/// See also [fetchBookFile].
class FetchBookFileProvider extends AutoDisposeFutureProvider<String> {
  FetchBookFileProvider(
    this.id,
  ) : super(
          (ref) => fetchBookFile(
            ref,
            id,
          ),
          from: fetchBookFileProvider,
          name: r'fetchBookFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBookFileHash,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is FetchBookFileProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchBookFileRef = AutoDisposeFutureProviderRef<String>;

/// See also [fetchBookFile].
final fetchBookFileProvider = FetchBookFileFamily();

class FetchBookFileFamily extends Family<AsyncValue<String>> {
  FetchBookFileFamily();

  FetchBookFileProvider call(
    String id,
  ) {
    return FetchBookFileProvider(
      id,
    );
  }

  @override
  AutoDisposeFutureProvider<String> getProviderOverride(
    covariant FetchBookFileProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchBookFileProvider';
}
