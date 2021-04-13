//
//  OGLView.h
//  OGLWindowOSX
//
//  Created by 曹磊 on 2021/4/12.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface OGLView : NSOpenGLView
+(OGLView*) Instance;
-(void) InitWithRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
