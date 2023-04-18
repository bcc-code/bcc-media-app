//
//  Utils.swift
//  bccm_player
//
//  Created by Andreas Gangsø on 13/10/2022.
//

import AVFoundation
import AVKit
import Foundation
import MediaPlayer

class MediaItemUtils {
    static func mapPlayerItem(_ playerItem: AVPlayerItem?) -> MediaItem? {
        guard let playerItem = playerItem else {
            return nil
        }
        guard let asset = (playerItem.asset as? AVURLAsset) else {
            return nil
        }
        
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        var metadata: MediaMetadata?
        var playerData: [String: String]?
        if #available(iOS 12.2, *) {
            let extras = getNamespacedMetadata(playerItem.externalMetadata, namespace: .BccmExtras)
            playerData = getNamespacedMetadata(playerItem.externalMetadata, namespace: .BccmPlayer)
            let artworkUri: String? = playerData?[PlayerMetadataConstants.ArtworkUri]
            metadata = MediaMetadata.make(
                withArtworkUri: artworkUri,
                title: playerItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierTitle })?.stringValue,
                artist: playerItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtist })?.stringValue,
                episodeId: playerItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier(PlayerMetadataConstants.EpisodeId) })?.stringValue,
                extras: extras
            )
            
            nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtist] = metadata?.artist
            nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyTitle] = metadata?.title
            if let imageData = playerItem.externalMetadata.first(where: { $0.identifier == AVMetadataIdentifier.commonIdentifierArtwork })?.value as? Data {
                if let image = UIImage(data: imageData) {
                    let nowPlayingArtwork = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { (_: CGSize) -> UIImage in
                        image
                    })
                    nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] = nowPlayingArtwork
                }
            }
        }
        var isLive = CMTIME_IS_INDEFINITE(playerItem.duration)
        let mimeType: String? = playerData?[PlayerMetadataConstants.MimeType]
        if let isLiveMeta = playerData?[PlayerMetadataConstants.IsLive] {
            isLive = isLiveMeta == "true"
        }
        
        let mediaItem = MediaItem.make(
            withUrl: asset.url.absoluteString,
            mimeType: mimeType,
            metadata: metadata,
            isLive: isLive as NSNumber,
            playbackStartPositionMs: nil,
            lastKnownAudioLanguage: playerItem.getSelectedAudioLanguage(),
            lastKnownSubtitleLanguage: playerItem.getSelectedSubtitleLanguage()
        )
        return mediaItem
    }
    
    private static func getNamespacedMetadata(_ items: [AVMetadataItem], namespace: MetadataNamespace) -> [String: String] {
        return items.filter {
            value in
            let containsExtraPrefix = value.identifier?.rawValue.contains(namespace.rawValue) ?? false
            if !containsExtraPrefix {
                return false
            }
            return true
        }
        .reduce(into: [String: String]()) {
            dict, val in
            if val.identifier?.rawValue == nil || (val.value as? String) == nil {
                return
            }
            guard let range = val.identifier!.rawValue.range(of: namespace.rawValue + ".") else {
                return
            }
            let key = val.identifier!.rawValue[range.upperBound...]
            dict[String(key)] = (val.value as! String)
        }
    }
}
