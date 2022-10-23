import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ss_test/network/models/models.dart';
import 'package:ss_test/repo/repo.dart';
import 'package:stream_transform/stream_transform.dart';

part 'restaurant_event.dart';

part 'restaurant_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc(this.repo) : super(const RestaurantState()) {
    on<RestaurantRefreshed>(_onRefreshed);
    on<RestaurantFetched>(
      _onRestaurantFetched,
      transformer: (events, mapper) {
        return events.throttle(const Duration(milliseconds: 300)).asyncExpand(mapper);
      },
    );
  }

  final AppRepo repo;

  Future<void> _onRestaurantFetched(
      RestaurantFetched event, Emitter<RestaurantState> emit) async {
    if (state.hasReachedMax) return;
    try {
      await repo.getRestaurants(page: state.currentPage + 1).then((response) {
        if (response.isSuccessful()) {
          final restaurants = response.data
              .map<Restaurant>((e) => Restaurant.fromJson(e))
              .toList();
          final pagination = response.meta['pagination'];
          final pageData = PageData.fromJson(pagination);
          emit(
            state.copyWith(
              status: RestaurantStatus.success,
              restaurants: List.from(state.restaurants)..addAll(restaurants),
              hasReachedMax: pageData.isLastPage,
              currentPage: pageData.page,
            ),
          );
        } else {
          final error = response.error?['message'] ?? 'Unknown error';
          throw Exception(error);
        }
      }).catchError((error) {
        emit(state.copyWith(
            status: RestaurantStatus.failure, message: error.toString()));
      });
    } catch (_) {
      emit(state.copyWith(status: RestaurantStatus.failure));
    }
  }

  Future<void> _onRefreshed(
      RestaurantRefreshed event, Emitter<RestaurantState> emit) async {
    try {
      emit(
        state.copyWith(
          status: RestaurantStatus.loading,
          restaurants: [],
          hasReachedMax: false,
          currentPage: 0,
        ),
      );
      await repo.getRestaurants(page: state.currentPage + 1).then((response) {
        if (response.isSuccessful()) {
          final restaurants = response.data
              .map<Restaurant>((e) => Restaurant.fromJson(e))
              .toList();
          final pagination = response.meta['pagination'];
          final pageData = PageData.fromJson(pagination);
          emit(
            state.copyWith(
              status: RestaurantStatus.success,
              restaurants: List.from(state.restaurants)..addAll(restaurants),
              hasReachedMax: pageData.isLastPage,
              currentPage: pageData.page,
            ),
          );
        } else {
          final error = response.error?['message'] ?? 'Unknown error';
          throw Exception(error);
        }
      }).catchError((error) {
        emit(state.copyWith(
            status: RestaurantStatus.failure, message: error.toString()));
      });
    } catch (_) {
      emit(state.copyWith(status: RestaurantStatus.failure));
    }
  }
}
