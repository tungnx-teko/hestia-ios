//
//  HestiaModuleBridge.m
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(HestiaModule, HestiaModule, NSObject)

RCT_EXTERN_METHOD(finish)

RCT_EXTERN_METHOD(handleException:(NSString *)message stacktrace:(NSString *)stacktrace)

@end
