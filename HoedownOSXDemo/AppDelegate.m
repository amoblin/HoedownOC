//
//  AppDelegate.m
//  HoedownOSXDemo
//
//  Created by amoblin on 16/2/20.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "AppDelegate.h"
#import "HoedownOCDemo.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[[HoedownOCDemo alloc] init] test];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
