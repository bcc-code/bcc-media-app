
enum MetadataNamespace: String {
    // Using namespaces because if we used e.g. json it would be painful to deserialize if we add any large values in the future
    case BccmPlayer = "media.bcc.player"
    case BccmExtras = "media.bcc.extras"
}

final class PlayerMetadataConstants {
    // TODO: refactor to use a PlayerData class instead of serializing into string dicts [String: String]
    static let EpisodeId = "episode_id";
    static let MimeType = "mime_type";
    static let IsLive = "is_live";
    static let ArtworkUri = "artwork_uri";
}
