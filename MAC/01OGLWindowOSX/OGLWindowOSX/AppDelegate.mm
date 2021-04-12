//
//  AppDelegate.m
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#import "AppDelegate.h"
#import "OGLMainWindow.h"
#import "OGLView.h"
@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)
aNotification {
    // Insert code here to initialize your application
    NSRect rect = NSMakeRect(0.0f,0.0f,800.0f,600.0f);
    NSInteger style = NSWindowStyleMaskTitled|NSWindowStyleMaskClosable;
    [[OGLMainWindow Instance]initWithContentRect:rect styleMask:style backing:NSBackingStoreBuffered defer:NO];
    [[OGLView Instance]InitWithRect:[[[OGLMainWindow Instance]contentView]bounds]];
    [[[OGLMainWindow Instance]contentView]addSubview:[OGLView Instance]];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
