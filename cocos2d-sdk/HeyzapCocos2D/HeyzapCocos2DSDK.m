//
//  HeyzapCocos2DSDK.m
//
//  Copyright 2011 Smart Balloon, Inc. All Rights Reserved
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "HeyzapCocos2DSDK.h"
#import "cocos2d.h"
#if COCOS2D_VERSION >= 0x00000900
#import "CCDirector.h"
#else
#import "Director.h"
#endif

@interface HeyzapSDK ()
- (void) setupSDKWithAppID:(NSString *) appId andAppUrl:(NSURL *) url andHidePopover: (BOOL)hidePopover;
+ (void) setFramework:(NSString *) framework;
@end

@implementation HeyzapCocos2DSDK

- (void) setupSDKWithAppID:(NSString *) appId andAppUrl:(NSURL *) url andHidePopover: (BOOL)hidePopover {
    [super setupSDKWithAppID:appId andAppUrl:url andHidePopover:hidePopover];
    [HeyzapCocos2DSDK setFramework:@"cocos2d"];
}

- (void) heyzapWillAppear:(BOOL)animated {
#if COCOS2D_VERSION >= 0x00000900
    [[CCDirector sharedDirector] pause];
#else
    [[Director sharedDirector] pause];
#endif
}

- (void) heyzapWillDisappear:(BOOL)animated {
#if COCOS2D_VERSION >= 0x00000900
    [[CCDirector sharedDirector] resume];
#else
    [[Director sharedDirector] resume];
#endif
}

- (void) heyzapDidDisappear:(BOOL)animated {
#if COCOS2D_VERSION >= 0x00000900
    [[CCDirector sharedDirector] resume];
#else
    [[Director sharedDirector] resume];
#endif
}

@end