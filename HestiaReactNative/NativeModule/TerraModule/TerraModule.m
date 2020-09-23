//
//  TerraModule.m
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(TerraModule, TerraModule, NSObject)

RCT_EXTERN_METHOD(invoke:(NSString *)moduleName
                  methodName:(NSString *)methodName
                  subscriberId:(NSString *)subscriberId
                  requestString:(NSString *)requestString)

RCT_EXTERN_METHOD(unsubscribe:(NSString *)moduleName subscriberId:(NSString *)subscriberId)

@end
