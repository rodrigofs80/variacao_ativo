// Mocks generated by Mockito 5.2.0 from annotations
// in variacao_ativo/test/src/presentation/controller/home_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;
import 'dart:ui' as _i7;

import 'package:dartz/dartz.dart' as _i3;
import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:variacao_ativo/src/domain/entitie/ativo_entity.dart' as _i5;
import 'package:variacao_ativo/src/domain/use_case/ativo_usecase.dart' as _i8;
import 'package:variacao_ativo/src/presentation/controller/home_controller.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeRxString_0 extends _i1.Fake implements _i2.RxString {}

class _FakeRxBool_1 extends _i1.Fake implements _i2.RxBool {}

class _FakeRxList_2<E> extends _i1.Fake implements _i2.RxList<E> {}

class _FakeRx_3<T> extends _i1.Fake implements _i2.Rx<T> {}

class _FakeRxDouble_4 extends _i1.Fake implements _i2.RxDouble {}

class _FakeInternalFinalCallback_5<T> extends _i1.Fake
    implements _i2.InternalFinalCallback<T> {}

class _FakeEither_6<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [HomeController].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeController extends _i1.Mock implements _i4.HomeController {
  MockHomeController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RxString get title => (super.noSuchMethod(Invocation.getter(#title),
      returnValue: _FakeRxString_0()) as _i2.RxString);
  @override
  _i2.RxBool get isLoading => (super.noSuchMethod(Invocation.getter(#isLoading),
      returnValue: _FakeRxBool_1()) as _i2.RxBool);
  @override
  _i2.RxBool get isGrafico => (super.noSuchMethod(Invocation.getter(#isGrafico),
      returnValue: _FakeRxBool_1()) as _i2.RxBool);
  @override
  _i2.RxString get error => (super.noSuchMethod(Invocation.getter(#error),
      returnValue: _FakeRxString_0()) as _i2.RxString);
  @override
  _i2.RxList<String> get datas => (super.noSuchMethod(Invocation.getter(#datas),
      returnValue: _FakeRxList_2<String>()) as _i2.RxList<String>);
  @override
  _i2.RxList<String> get opens => (super.noSuchMethod(Invocation.getter(#opens),
      returnValue: _FakeRxList_2<String>()) as _i2.RxList<String>);
  @override
  _i2.RxList<double> get variation =>
      (super.noSuchMethod(Invocation.getter(#variation),
          returnValue: _FakeRxList_2<double>()) as _i2.RxList<double>);
  @override
  _i2.Rx<_i5.AtivoEntity> get ativoEntity => (super.noSuchMethod(
      Invocation.getter(#ativoEntity),
      returnValue: _FakeRx_3<_i5.AtivoEntity>()) as _i2.Rx<_i5.AtivoEntity>);
  @override
  _i2.RxDouble get d1 => (super.noSuchMethod(Invocation.getter(#d1),
      returnValue: _FakeRxDouble_4()) as _i2.RxDouble);
  @override
  _i2.RxList<String> get varicaoD1 =>
      (super.noSuchMethod(Invocation.getter(#varicaoD1),
          returnValue: _FakeRxList_2<String>()) as _i2.RxList<String>);
  @override
  _i2.RxList<String> get varicaoPrimeiraData =>
      (super.noSuchMethod(Invocation.getter(#varicaoPrimeiraData),
          returnValue: _FakeRxList_2<String>()) as _i2.RxList<String>);
  @override
  _i2.RxDouble get n1 => (super.noSuchMethod(Invocation.getter(#n1),
      returnValue: _FakeRxDouble_4()) as _i2.RxDouble);
  @override
  _i2.RxDouble get n2 => (super.noSuchMethod(Invocation.getter(#n2),
      returnValue: _FakeRxDouble_4()) as _i2.RxDouble);
  @override
  _i2.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_5<void>())
          as _i2.InternalFinalCallback<void>);
  @override
  _i2.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_5<void>())
          as _i2.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  int get listeners =>
      (super.noSuchMethod(Invocation.getter(#listeners), returnValue: 0)
          as int);
  @override
  dynamic showGrafico(bool? show) =>
      super.noSuchMethod(Invocation.method(#showGrafico, [show]));
  @override
  void update([List<Object>? ids, bool? condition = true]) =>
      super.noSuchMethod(Invocation.method(#update, [ids, condition]),
          returnValueForMissingStub: null);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void onClose() => super.noSuchMethod(Invocation.method(#onClose, []),
      returnValueForMissingStub: null);
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
  @override
  _i6.Disposer addListener(_i6.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValue: () {}) as _i6.Disposer);
  @override
  void removeListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void refresh() => super.noSuchMethod(Invocation.method(#refresh, []),
      returnValueForMissingStub: null);
  @override
  void refreshGroup(Object? id) =>
      super.noSuchMethod(Invocation.method(#refreshGroup, [id]),
          returnValueForMissingStub: null);
  @override
  void notifyChildrens() =>
      super.noSuchMethod(Invocation.method(#notifyChildrens, []),
          returnValueForMissingStub: null);
  @override
  void removeListenerId(Object? id, _i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListenerId, [id, listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i6.Disposer addListenerId(Object? key, _i6.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListenerId, [key, listener]),
          returnValue: () {}) as _i6.Disposer);
  @override
  void disposeId(Object? id) =>
      super.noSuchMethod(Invocation.method(#disposeId, [id]),
          returnValueForMissingStub: null);
}

/// A class which mocks [AtivoUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAtivoUseCase extends _i1.Mock implements _i8.AtivoUseCase {
  MockAtivoUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.Either<Exception, _i5.AtivoEntity>> getVariacaoAtivo() =>
      (super.noSuchMethod(Invocation.method(#getVariacaoAtivo, []),
              returnValue: Future<_i3.Either<Exception, _i5.AtivoEntity>>.value(
                  _FakeEither_6<Exception, _i5.AtivoEntity>()))
          as _i9.Future<_i3.Either<Exception, _i5.AtivoEntity>>);
}
