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
    //模型矩阵  物体在模型空间定义; 模型摆放世界坐标系  模型矩阵，模型空间定义; 对应3DMax导出来的模型带的矩阵
    //视口矩阵 viewMatrix  摄像机位置定义
    //投影矩阵 PROJECTION 把3D物体转化到2D屏幕上
    
    //openGL关键
    //设置矩阵
    
    //context里面有很多状态，选中了投影矩阵
    glMatrixMode(GL_PROJECTION);
    //设置矩阵我选中的矩阵
    gluPerspective(45.0f, width/height, 0.1f, 1000.0f);
    //选择了模型矩阵和视口矩阵合体; 模型矩阵*视口矩阵
    glMatrixMode(GL_MODELVIEW);
    //设置单位矩阵
    glLoadIdentity();
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
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT );
    
    //摄像机默认原点(0,0,0) 3D坐标朝向 (0,0,-1) 默认逆时针绘制
    
    //开启反面剔除;顺时针绘制 绘制不出来
    glEnable(GL_CULL_FACE);
    
    //glEnable(GL_LINE);
    
    //以线条绘制
    glPolygonMode(GL_FRONT,GL_LINE);
    //glPolygonMode(GL_FRONT,GL_FILL);
    
    //设置为顺时针
    //glFrontFace(GL_CW);
    
    glPointSize(32.0f);
    glEnable(GL_POINT_SMOOTH);
    
//    glEnable(GL_BLEND);
//    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    //点的成像原理
    //点的坐标转化到屏幕坐标，在屏幕上绘制大小; 在屏幕上展开，不受摄像机影响
    //点基于2D
    //点的最大值由于显卡厂商决定
    //MVP转化， 模型矩阵、投影矩阵、视图矩阵
    
    //GL_TRIANGLE_FAN 扇形 第一个点是扇心
    glBegin(GL_POINTS);
    glVertex3f(0.0f, 0.0f, -2.0f);
    glVertex3f(-0.5f, -0.5f, -2.0f);
    glVertex3f(-0.0f, -0.5f, -2.0f);
    glVertex3f(0.5f, -0.5f,  -2.0f);
    glEnd();
    
    
    //glBegin(GL_LINES);
    //glBegin(GL_LINE_LOOP);
    
    //可以绘制不规则图形多边形，指定点的顺序
    glBegin(GL_POLYGON);
    //glBegin(GL_QUADS);
    glVertex3f(0.0f, 0.0f, -2.0f);
    glVertex3f(-0.5f, -0.5f, -2.0f);
    glVertex3f(-0.0f, -0.5f, -2.0f);
    glVertex3f(0.5f, -0.5f,  -2.0f);
    glEnd();
    
    glFlush();
    
    
    //显卡细节; 调用 glClearColor、glClear 不一定在GPU执行指令
    //这些指令CPU端，opengl驱动里面 都在 driver里面，有一个 commad queue
    //glFlush 把CPU端，opengl驱动里面的指令 发给 GPU; 不知道是否执行完没有
}
