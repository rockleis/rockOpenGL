//
//  main.m
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSApplication *app = [NSApplication sharedApplication];
    [app setDelegate:[[AppDelegate alloc]init]];
    [NSApp run];
    return 0;
}
