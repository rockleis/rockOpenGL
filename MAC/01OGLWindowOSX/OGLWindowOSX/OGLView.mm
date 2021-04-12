//
//  OGLView.m
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#import "OGLView.h"
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl3.h>

static OGLView* sOGLView = nullptr;
@implementation OGLView
+(OGLView*) Instance {
    if(sOGLView == nullptr){
        sOGLView=[OGLView alloc];
    }
    return sOGLView;
}

-(void) InitWithRect:(CGRect)rect {
    //NSOpenGLProfileVersionLegacy 固定管线
    NSOpenGLPixelFormatAttribute pixel_format[]={
        NSOpenGLPFAOpenGLProfile,
        NSOpenGLProfileVersionLegacy,
        //NSOpenGLProfileVersion4_1Core,
        NSOpenGLPFAColorSize,32,
        NSOpenGLPFADepthSize,24,
        NSOpenGLPFAStencilSize,8,
        NSOpenGLPFAAlphaSize,8,
        NSOpenGLPFAAccelerated,
        0
    };
    NSOpenGLPixelFormat* format = [[NSOpenGLPixelFormat alloc] initWithAttributes:pixel_format];
    [self initWithFrame:rect pixelFormat:format];
    [[self openGLContext] makeCurrentContext];
    NSLog(@"openGL Version:%s",glGetString(GL_VERSION));
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
