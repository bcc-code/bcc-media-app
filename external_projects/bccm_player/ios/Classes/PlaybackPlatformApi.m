// Autogenerated from Pigeon (v3.2.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "PlaybackPlatformApi.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface SetUrlArgs ()
+ (SetUrlArgs *)fromMap:(NSDictionary *)dict;
+ (nullable SetUrlArgs *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface MediaItem ()
+ (MediaItem *)fromMap:(NSDictionary *)dict;
+ (nullable MediaItem *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface MediaMetadata ()
+ (MediaMetadata *)fromMap:(NSDictionary *)dict;
+ (nullable MediaMetadata *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface ChromecastState ()
+ (ChromecastState *)fromMap:(NSDictionary *)dict;
+ (nullable ChromecastState *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation SetUrlArgs
+ (instancetype)makeWithPlayerId:(NSString *)playerId
    url:(NSString *)url
    isLive:(nullable NSNumber *)isLive {
  SetUrlArgs* pigeonResult = [[SetUrlArgs alloc] init];
  pigeonResult.playerId = playerId;
  pigeonResult.url = url;
  pigeonResult.isLive = isLive;
  return pigeonResult;
}
+ (SetUrlArgs *)fromMap:(NSDictionary *)dict {
  SetUrlArgs *pigeonResult = [[SetUrlArgs alloc] init];
  pigeonResult.playerId = GetNullableObject(dict, @"playerId");
  NSAssert(pigeonResult.playerId != nil, @"");
  pigeonResult.url = GetNullableObject(dict, @"url");
  NSAssert(pigeonResult.url != nil, @"");
  pigeonResult.isLive = GetNullableObject(dict, @"isLive");
  return pigeonResult;
}
+ (nullable SetUrlArgs *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [SetUrlArgs fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"playerId" : (self.playerId ?: [NSNull null]),
    @"url" : (self.url ?: [NSNull null]),
    @"isLive" : (self.isLive ?: [NSNull null]),
  };
}
@end

@implementation MediaItem
+ (instancetype)makeWithUrl:(NSString *)url
    mimeType:(nullable NSString *)mimeType
    metadata:(nullable MediaMetadata *)metadata
    isLive:(nullable NSNumber *)isLive {
  MediaItem* pigeonResult = [[MediaItem alloc] init];
  pigeonResult.url = url;
  pigeonResult.mimeType = mimeType;
  pigeonResult.metadata = metadata;
  pigeonResult.isLive = isLive;
  return pigeonResult;
}
+ (MediaItem *)fromMap:(NSDictionary *)dict {
  MediaItem *pigeonResult = [[MediaItem alloc] init];
  pigeonResult.url = GetNullableObject(dict, @"url");
  NSAssert(pigeonResult.url != nil, @"");
  pigeonResult.mimeType = GetNullableObject(dict, @"mimeType");
  pigeonResult.metadata = [MediaMetadata nullableFromMap:GetNullableObject(dict, @"metadata")];
  pigeonResult.isLive = GetNullableObject(dict, @"isLive");
  return pigeonResult;
}
+ (nullable MediaItem *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [MediaItem fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"url" : (self.url ?: [NSNull null]),
    @"mimeType" : (self.mimeType ?: [NSNull null]),
    @"metadata" : (self.metadata ? [self.metadata toMap] : [NSNull null]),
    @"isLive" : (self.isLive ?: [NSNull null]),
  };
}
@end

@implementation MediaMetadata
+ (instancetype)makeWithArtworkUri:(nullable NSString *)artworkUri
    title:(nullable NSString *)title
    artist:(nullable NSString *)artist {
  MediaMetadata* pigeonResult = [[MediaMetadata alloc] init];
  pigeonResult.artworkUri = artworkUri;
  pigeonResult.title = title;
  pigeonResult.artist = artist;
  return pigeonResult;
}
+ (MediaMetadata *)fromMap:(NSDictionary *)dict {
  MediaMetadata *pigeonResult = [[MediaMetadata alloc] init];
  pigeonResult.artworkUri = GetNullableObject(dict, @"artworkUri");
  pigeonResult.title = GetNullableObject(dict, @"title");
  pigeonResult.artist = GetNullableObject(dict, @"artist");
  return pigeonResult;
}
+ (nullable MediaMetadata *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [MediaMetadata fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"artworkUri" : (self.artworkUri ?: [NSNull null]),
    @"title" : (self.title ?: [NSNull null]),
    @"artist" : (self.artist ?: [NSNull null]),
  };
}
@end

@implementation ChromecastState
+ (instancetype)makeWithConnectionState:(CastConnectionState)connectionState {
  ChromecastState* pigeonResult = [[ChromecastState alloc] init];
  pigeonResult.connectionState = connectionState;
  return pigeonResult;
}
+ (ChromecastState *)fromMap:(NSDictionary *)dict {
  ChromecastState *pigeonResult = [[ChromecastState alloc] init];
  pigeonResult.connectionState = [GetNullableObject(dict, @"connectionState") integerValue];
  return pigeonResult;
}
+ (nullable ChromecastState *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [ChromecastState fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"connectionState" : @(self.connectionState),
  };
}
@end

@interface PlaybackPlatformPigeonCodecReader : FlutterStandardReader
@end
@implementation PlaybackPlatformPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [ChromecastState fromMap:[self readValue]];
    
    case 129:     
      return [MediaItem fromMap:[self readValue]];
    
    case 130:     
      return [MediaMetadata fromMap:[self readValue]];
    
    case 131:     
      return [SetUrlArgs fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface PlaybackPlatformPigeonCodecWriter : FlutterStandardWriter
@end
@implementation PlaybackPlatformPigeonCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[ChromecastState class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[MediaItem class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[MediaMetadata class]]) {
    [self writeByte:130];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[SetUrlArgs class]]) {
    [self writeByte:131];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface PlaybackPlatformPigeonCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PlaybackPlatformPigeonCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PlaybackPlatformPigeonCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PlaybackPlatformPigeonCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PlaybackPlatformPigeonGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    PlaybackPlatformPigeonCodecReaderWriter *readerWriter = [[PlaybackPlatformPigeonCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void PlaybackPlatformPigeonSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PlaybackPlatformPigeon> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PlaybackPlatformPigeon.newPlayer"
        binaryMessenger:binaryMessenger
        codec:PlaybackPlatformPigeonGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(newPlayer:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(newPlayer:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_url = GetNullableObjectAtIndex(args, 0);
        [api newPlayer:arg_url completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PlaybackPlatformPigeon.setUrl"
        binaryMessenger:binaryMessenger
        codec:PlaybackPlatformPigeonGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setUrl:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(setUrl:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        SetUrlArgs *arg_setUrlArgs = GetNullableObjectAtIndex(args, 0);
        [api setUrl:arg_setUrlArgs completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PlaybackPlatformPigeon.addMediaItem"
        binaryMessenger:binaryMessenger
        codec:PlaybackPlatformPigeonGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(addMediaItem:mediaItem:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(addMediaItem:mediaItem:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = GetNullableObjectAtIndex(args, 0);
        MediaItem *arg_mediaItem = GetNullableObjectAtIndex(args, 1);
        [api addMediaItem:arg_playerId mediaItem:arg_mediaItem completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PlaybackPlatformPigeon.setPrimary"
        binaryMessenger:binaryMessenger
        codec:PlaybackPlatformPigeonGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPrimary:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(setPrimary:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_id = GetNullableObjectAtIndex(args, 0);
        [api setPrimary:arg_id completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PlaybackPlatformPigeon.getChromecastState"
        binaryMessenger:binaryMessenger
        codec:PlaybackPlatformPigeonGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getChromecastState:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(getChromecastState:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api getChromecastState:^(ChromecastState *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
