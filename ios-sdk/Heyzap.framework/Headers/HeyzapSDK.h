//
//  HeyzapSDK.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HZCheckinButton;
@class HZExplainView;

@protocol HeyzapDelegate <NSObject>
@optional
- (void) heyzapWillAppear: (BOOL) animated;
- (void) heyzapDidAppear: (BOOL) animated;
- (void) heyzapWillDisappear: (BOOL) animated;
- (void) heyzapDidDisappear: (BOOL) animated;
@end

@interface HeyzapSDK : NSObject <HeyzapDelegate> {
    NSString *_appId;
    NSURL *_appURL;
    
    @private
    HZExplainView *_explainVC;
    UIBackgroundTaskIdentifier _bgTask;
    NSDate *_timer;
    
    BOOL _tempSuppressLocalNotifications;
    BOOL _hidePopover;
}

@property (nonatomic, retain) NSString *appId;
@property (nonatomic, retain) NSURL *appURL;

+ (id) sharedSDK;
+ (BOOL) isSupported;

#pragma mark - Init

+ (void) setAppName: (NSString *) passedAppName;
+ (void) startHeyzapWithAppId: (NSString *) appId andAppURL: (NSURL *) url;
+ (void) startHeyzapWithAppId:(NSString *) appId;
+ (HZCheckinButton*) getCheckinButtonWithLocation: (CGPoint) location;
+ (HZCheckinButton*) getCheckinButtonWithLocation: (CGPoint) location andMessage: (NSString *) message;

#pragma mark - Static Methods

#pragma mark - Checkin Methods

- (IBAction) checkin;
- (IBAction) checkinWithMessage: (NSString *) message;

@end
