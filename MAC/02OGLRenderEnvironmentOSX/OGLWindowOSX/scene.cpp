//
//  scene.cpp
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#include "scene.h"
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <OpenGL/gl3.h>

void Init(float width, float height) {
    
}

void Render() {
    //双缓冲 0缓冲 1缓冲; GPU把数据绘制到缓冲区里面
    //画完，会把数据0号缓冲区刷到屏幕上，接着1号缓冲区  连续不断的刷
    
    //实际上，双缓冲 没有1号的 GPU GPU在后台绘制一个窗口 然后在绘制到屏幕上面
    //d单缓冲 GPU直接绘制屏幕上
    
    //深度缓冲区、Stencil缓冲区 辅助绘制的
    //颜色缓冲区主要绘制
    
    //清除颜色缓冲区使用的颜色
    glClearColor(0.1f, 0.4f, 0.7f, 1.0f);
    //知道清除什么,清除的是颜色缓冲区
    glClear(GL_COLOR_BUFFER_BIT );
    glFlush();
    
    
    //显卡细节; 调用 glClearColor、glClear 不一定在GPU执行指令
    //这些指令CPU端，opengl驱动里面 都在 driver里面，有一个 commad queue
    //glFlush 把CPU端，opengl驱动里面的指令 发给 GPU; 不知道是否执行完没有
}
