import 'package:bccm_player/bccm_player.dart';

extension DownloadConfigTypedExtensions on DownloadConfig {
  TypedAdditionalData get typedAdditionalData {
    return TypedAdditionalData.fromStringMap(additionalData);
  }
}

class TypedAdditionalData {
  final Map<String?, String?> _map;

  TypedAdditionalData({
    String? episodeId,
    String? artworkUri,
    double? durationMs,
    DateTime? expiresAt,
    DateTime? downloadedAt,
    String? downloadedBy,
  }) : _map = {
          if (episodeId != null) 'episode_id': episodeId,
          if (artworkUri != null) 'artwork_uri': artworkUri,
          if (durationMs != null) 'duration_ms': durationMs.toString(),
          if (expiresAt != null) 'expires_at': expiresAt.toIso8601String(),
          if (downloadedAt != null) 'downloaded_at': downloadedAt.toIso8601String(),
          if (downloadedBy != null) 'downloaded_by': downloadedBy,
        };

  String? get episodeId => _map['episode_id'];
  String? get artworkUri => _map['artwork_uri'];
  String? get secondaryTitle => _map['secondary_title'];
  double? get durationMs => double.tryParse(_map['duration_ms'] ?? '');
  DateTime? get expiresAt => DateTime.tryParse(_map['expires_at'] ?? '');
  DateTime? get downloadedAt => DateTime.tryParse(_map['downloaded_at'] ?? '');
  String? get downloadedBy => _map['downloaded_by'];

  Map<String?, String?> toStringMap() => _map;

  TypedAdditionalData.fromStringMap(Map<String?, String?> map) : _map = map;
}
