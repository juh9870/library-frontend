// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book-compact.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class BookCompact extends ConsumerWidget {
  const BookCompact({
    Key? key,
    this.bookId,
    this.book,
  }) : super(key: key);

  final String? bookId;

  final BookEntity? book;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _bookCompact(
        _context,
        _ref,
        bookId: bookId,
        book: book,
      );
}

class BookCover extends StatelessWidget {
  const BookCover(
    this.book, {
    Key? key,
  }) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext _context) => _bookCover(
        _context,
        book,
      );
}

class _BookReady extends ConsumerWidget {
  const _BookReady(
    this.book, {
    Key? key,
  }) : super(key: key);

  final BookEntity book;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __bookReady(
        _context,
        _ref,
        book,
      );
}

class _BookError extends StatelessWidget {
  const _BookError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __bookError(_context);
}

class BookLoading extends StatelessWidget {
  const BookLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _bookLoading(_context);
}

class _BookLayout extends StatelessWidget {
  const _BookLayout({
    Key? key,
    required this.header,
    required this.cover,
  }) : super(key: key);

  final Widget header;

  final Widget cover;

  @override
  Widget build(BuildContext _context) => __bookLayout(
        header: header,
        cover: cover,
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

String _$fetchBookHash() => r'6d3d336fc1befffb939c2cfd34c0eb62d998662c';

/// See also [fetchBook].
class FetchBookProvider extends AutoDisposeFutureProvider<BookEntity> {
  FetchBookProvider(
    this.id,
  ) : super(
          (ref) => fetchBook(
            ref,
            id,
          ),
          from: fetchBookProvider,
          name: r'fetchBookProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBookHash,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is FetchBookProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchBookRef = AutoDisposeFutureProviderRef<BookEntity>;

/// See also [fetchBook].
final fetchBookProvider = FetchBookFamily();

class FetchBookFamily extends Family<AsyncValue<BookEntity>> {
  FetchBookFamily();

  FetchBookProvider call(
    String id,
  ) {
    return FetchBookProvider(
      id,
    );
  }

  @override
  AutoDisposeFutureProvider<BookEntity> getProviderOverride(
    covariant FetchBookProvider provider,
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
  String? get name => r'fetchBookProvider';
}
