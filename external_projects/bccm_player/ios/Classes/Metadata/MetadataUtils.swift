//
// Created by Andreas Gangsø on 13/09/2022.
//

import AVFoundation

final class MetadataUtils {
    static func metadataItem(identifier: String, value: (NSCopying & NSObjectProtocol)?) -> AVMetadataItem? {
        metadataItem(identifier: identifier, value: value, isExtra: false);
    }

    static func metadataItem(identifier: String, value: (NSCopying & NSObjectProtocol)?, isExtra: Bool) -> AVMetadataItem? {
        if let actualValue = value {

            let item = AVMutableMetadataItem()
            if (isExtra) {
                item.extraAttributes = [AVMetadataExtraAttributeKey: Any]()
                item.extraAttributes![AVMetadataExtraAttributeKey(MetadataConstants.IsExtraExtraAttributeKey)] = true

                // "For custom identifiers, the keySpace AVMetadataKeySpaceQuickTimeMetadata is recommended.
                // This keySpace defines its key values to be expressed as reverse-DNS strings, which allows
                // third parties to define their own keys in a well established way that avoids collisions."
                item.identifier = AVMetadataItem.identifier(forKey: MetadataConstants.ExtraPrefix + identifier, keySpace: AVMetadataKeySpace.quickTimeMetadata)
            } else {
                item.setValue(identifier, forKey: "identifier")
            }
            item.value = actualValue
            item.extendedLanguageTag = "und"
            return item.copy() as? AVMetadataItem
        }
        return nil
    }

    static func metadataArtworkItem(image: UIImage) -> AVMetadataItem? {
        let item = AVMutableMetadataItem()
        item.value = image.pngData() as (NSCopying & NSObjectProtocol)?
        item.dataType = kCMMetadataBaseDataType_PNG as String
        item.identifier = AVMetadataIdentifier.commonIdentifierArtwork
        item.extendedLanguageTag = "und"
        return item.copy() as? AVMetadataItem
    }
}
