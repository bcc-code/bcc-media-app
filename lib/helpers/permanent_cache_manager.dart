import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PermanentCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'permanentCache';

  static final PermanentCacheManager _instance = PermanentCacheManager._();

  factory PermanentCacheManager() {
    return _instance;
  }

  PermanentCacheManager._()
      : super(
          Config(
            key,
            stalePeriod: const Duration(days: 365 * 10),
          ),
        );
}
