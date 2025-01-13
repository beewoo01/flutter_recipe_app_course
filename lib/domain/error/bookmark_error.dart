import 'package:flutter_recipe_app_course/core/domain/error/error.dart';

enum BookMarkError implements Error {
  notFound,
  saveFailed,
  unknown;

  @override
  String toString() => switch (this) {
        BookMarkError.notFound => '레시피를 찾을 수 없습니다.',
        BookMarkError.saveFailed => '북마크 저장을 실패했습니다.',
        BookMarkError.unknown => '알 수 없는 오류가 발생했습니다.',
      };
}
