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

@interface PlaybackPlatformPigeonCodecReader : FlutterStandardReader
@end
@implementation PlaybackPlatformPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
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
  if ([value isKindOfClass:[SetUrlArgs class]]) {
    [self writeByte:128];
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
      NSCAssert([api respondsToSelector:@selector(newPlayerUrl:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(newPlayerUrl:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_url = GetNullableObjectAtIndex(args, 0);
        [api newPlayerUrl:arg_url completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
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
      NSCAssert([api respondsToSelector:@selector(setUrlSetUrlArgs:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(setUrlSetUrlArgs:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        SetUrlArgs *arg_setUrlArgs = GetNullableObjectAtIndex(args, 0);
        [api setUrlSetUrlArgs:arg_setUrlArgs completion:^(FlutterError *_Nullable error) {
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
      NSCAssert([api respondsToSelector:@selector(setPrimaryId:completion:)], @"PlaybackPlatformPigeon api (%@) doesn't respond to @selector(setPrimaryId:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_id = GetNullableObjectAtIndex(args, 0);
        [api setPrimaryId:arg_id completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
