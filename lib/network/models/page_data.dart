import 'package:equatable/equatable.dart';

part 'page_data.g.dart';

/// {@template page_data}
/// PageData object with [page], [pageSize], [pageCount] and [total] properties
/// {@endtemplate}
class PageData extends Equatable {
  /// {@macro page_data}
  const PageData({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
    this.isLastPage = false,
  });

  /// Creates a PageData from Json map
  factory PageData.fromJson(Map<String, dynamic> data) =>
      _$PageDataFromJson(data);

  /// The current page number
  final int page;

  /// How many items are in a page
  final int pageSize;

  /// The number of pages
  final int pageCount;

  /// Total number of items
  final int total;

  /// Determines whether the current page is the last page
  final bool isLastPage;

  @override
  List<Object?> get props => [
        page,
        pageSize,
        pageCount,
        total,
        isLastPage,
      ];

  /// Creates a Json map from a PageData
  Map<String, dynamic> toJson() => _$PageDataToJson(this);
}
