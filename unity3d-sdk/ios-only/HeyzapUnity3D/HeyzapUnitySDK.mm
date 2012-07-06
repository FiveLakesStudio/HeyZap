//
//  HeyzapUnitySDK.m
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

#import "HeyzapUnitySDK.h"

void UnityPause(bool pause);

@interface HeyzapSDK ()
+ (BOOL)canOpenHeyzap;
+ (void)setFramework:(NSString *)framework;
+ (void)startHeyzapWithAppId:(NSString *)appId andAppURL:(NSURL *)url andHidePopover:(BOOL)hide;
@end

@implementation HeyzapUnitySDK

- (void) heyzapWillAppear:(BOOL)animated {
    UnityPause(true);
}

- (void) heyzapWillDisappear:(BOOL)animated {
    UnityPause(false);
}

- (void) heyzapDidDisappear:(BOOL)animated {
    UnityPause(false);
}

@end

extern "C" {
    bool is_setup = false;
    
    void setup_unity(int b, char *appid, char *url_scheme)
    {
        if (is_setup == false) {
            NSString *ns_appid = [NSString stringWithUTF8String: appid];
            NSString *ns_appurl = [NSString stringWithUTF8String: url_scheme];
            BOOL boolPopover = (b==0);

            [HeyzapUnitySDK setFramework:@"unity3d"];
            
            if ( [ns_appurl length] == 0) {
                [HeyzapUnitySDK startHeyzapWithAppId: ns_appid andHidePopover:boolPopover];
            } else {
                [HeyzapUnitySDK startHeyzapWithAppId: ns_appid andAppURL: [NSURL URLWithString:ns_appurl] andHidePopover:boolPopover];
            }

            is_setup = true;
        }
    }
    
    void checkin_raw(const char *msg)
    {
        NSString *ns_msg = [NSString stringWithUTF8String: msg];
        [[HeyzapUnitySDK sharedSDK] checkinWithMessage: ns_msg];   
    }

    bool isSupported_raw() {
        return [HeyzapSDK canOpenHeyzap];
    }
}