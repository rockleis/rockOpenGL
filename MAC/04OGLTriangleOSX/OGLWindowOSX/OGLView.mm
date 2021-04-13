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
#include "scene.h"
static OGLView* sOGLView = nullptr;
@implementation OGLView
+(OGLView*) Instance {
    if(sOGLView == nullptr){
        sOGLView=[OGLView alloc];
    }
    return sOGLView;
}

-(void) InitWithRect:(CGRect)rect {
    //渲染环境
    //NSOpenGLProfileVersionLegacy 固定管线
    //NSOpenGLProfileVersion4_1Core 可编程管线 
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
    //渲染环境生效
    //context 渲染上下文，每个视口都有一个设备上下文； 保存渲染状态
    //所有对opengl的修改其实就是对Context的修改
    [[self openGLContext] makeCurrentContext];
    
    //对Context，修改，告诉GPU修改
    
    //打印版本
    NSLog(@"openGL Version:%s",glGetString(GL_VERSION));
    
    Init(rect.size.width, rect.size.height);
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
//    glClearColor(1.0f, 0.5f, 0.0f, 1.0f);
//    glClear(GL_COLOR_BUFFER_BIT);
//    glFlush();
    Render();
}

@end
