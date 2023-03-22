// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
    @queryParam this.search = '',
  }) : super(key: key);

  final String search;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _homePage(
        _context,
        _ref,
        search: search,
      );
}

class _HomePageReady extends HookConsumerWidget {
  const _HomePageReady({
    Key? key,
    required this.books,
    required this.drafts,
  }) : super(key: key);

  final List<BookEntity> books;

  final bool drafts;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __homePageReady(
        _context,
        _ref,
        books: books,
        drafts: drafts,
      );
}

class _HomePageLoading extends StatelessWidget {
  const _HomePageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __homePageLoading(_context);
}

class BookGrid extends ConsumerWidget {
  const BookGrid({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _bookGrid(
        _context,
        _ref,
        children: children,
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

String _$fetchAllBooksHash() => r'cb5d4e9abc2b315bdcf5152c8f389ec979ef2309';

/// See also [fetchAllBooks].
class FetchAllBooksProvider
    extends AutoDisposeFutureProvider<List<BookEntity>> {
  FetchAllBooksProvider(
    this.searchText,
  ) : super(
          (ref) => fetchAllBooks(
            ref,
            searchText,
          ),
          from: fetchAllBooksProvider,
          name: r'fetchAllBooksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllBooksHash,
        );

  final String searchText;

  @override
  bool operator ==(Object other) {
    return other is FetchAllBooksProvider && other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchAllBooksRef = AutoDisposeFutureProviderRef<List<BookEntity>>;

/// See also [fetchAllBooks].
final fetchAllBooksProvider = FetchAllBooksFamily();

class FetchAllBooksFamily extends Family<AsyncValue<List<BookEntity>>> {
  FetchAllBooksFamily();

  FetchAllBooksProvider call(
    String searchText,
  ) {
    return FetchAllBooksProvider(
      searchText,
    );
  }

  @override
  AutoDisposeFutureProvider<List<BookEntity>> getProviderOverride(
    covariant FetchAllBooksProvider provider,
  ) {
    return call(
      provider.searchText,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchAllBooksProvider';
}
