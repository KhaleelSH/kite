// Mocks generated by Mockito 5.4.6 from annotations
// in kite/test/providers/news_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:kite/data/news_data_provider.dart' as _i2;
import 'package:kite/model/category.dart' as _i4;
import 'package:kite/model/event.dart' as _i6;
import 'package:kite/model/story.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [NewsDataProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsDataProvider extends _i1.Mock implements _i2.NewsDataProvider {
  MockNewsDataProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Category>> getNewsCategories() =>
      (super.noSuchMethod(
            Invocation.method(#getNewsCategories, []),
            returnValue: _i3.Future<List<_i4.Category>>.value(<_i4.Category>[]),
          )
          as _i3.Future<List<_i4.Category>>);

  @override
  _i3.Future<List<_i5.Story>> getNewsStories(_i4.Category? category) =>
      (super.noSuchMethod(
            Invocation.method(#getNewsStories, [category]),
            returnValue: _i3.Future<List<_i5.Story>>.value(<_i5.Story>[]),
          )
          as _i3.Future<List<_i5.Story>>);

  @override
  _i3.Future<List<_i6.Event>> getOnThisDayEvents() =>
      (super.noSuchMethod(
            Invocation.method(#getOnThisDayEvents, []),
            returnValue: _i3.Future<List<_i6.Event>>.value(<_i6.Event>[]),
          )
          as _i3.Future<List<_i6.Event>>);
}
