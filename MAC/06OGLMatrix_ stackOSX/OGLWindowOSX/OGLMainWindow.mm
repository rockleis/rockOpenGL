//
//  OGLMainWindow.m
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#import "OGLMainWindow.h"
static OGLMainWindow* sOGLMainWindow = nullptr;
@implementation OGLMainWindow
+(OGLMainWindow*) Instance {
    if(sOGLMainWindow == nullptr){
        sOGLMainWindow = [OGLMainWindow alloc];
    }
    return sOGLMainWindow;
}

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
    self = [super initWithContentRect:contentRect styleMask:style backing:backingStoreType defer:flag];
    [self setTitle:@"OGLWindowOSX"];
    [self makeKeyAndOrderFront:self];
    [self makeMainWindow];
    return self;
}

@end
