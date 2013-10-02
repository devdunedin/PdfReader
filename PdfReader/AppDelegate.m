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
    NSURL *url1 = [NSURL fileURLWithPath:@"/home/cshome/p/pdev/Desktop/pdfReaderIcon_512x512@2x.png"];
    [_splashScreen setImageWithURL: url1];

}

-(void) applicationDidFinishLaunching:(NSNotification *)notification {
 
    [_splashWindow makeKeyAndOrderFront:NSApp];
    sleep(3);
    [_splashWindow orderOut: _splashWindow];
        
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
    return NO;
}

@end
