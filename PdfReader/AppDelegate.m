//
//  AppDelegate.m
//  PdfReader
//
//  Created by Purushottam Dev on 10/2/13.
//  Copyright (c) 2013 Purushottam Dev. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

-(void)applicationWillFinishLaunching:(NSNotification *)notification{
}

-(void) applicationDidFinishLaunching:(NSNotification *)notification {
         [_splashWindow setTitle:@"Pdf Viewer is Opening...."];
    [_splashWindow orderFrontRegardless];
     [_splashWindow makeKeyAndOrderFront:NSApp];
    
    sleep(3);
    [_splashWindow orderOut: _splashWindow];
   
    
  
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
    return NO;
}

@end
