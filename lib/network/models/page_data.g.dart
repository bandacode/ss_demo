part of 'page_data.dart';

PageData _$PageDataFromJson(Map<String, dynamic> json) => PageData(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      pageCount: json['pageCount'] as int,
      total: json['total'] as int,
      isLastPage: json['page'] as int == json['pageCount'] as int,
    );

Map<String, dynamic> _$PageDataToJson(PageData instance) => <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
