//
//  BezierView.m
//  OCUnitProject
//
//  Created by fenda-fly on 14-3-6.
//  Copyright (c) 2014年 com.fenda.wdg. All rights reserved.
//

#import "BezierView.h"
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation BezierView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self drawRect:frame];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapButt; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 10.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(10.0, 40.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    [aPath stroke];//Draws line 根据坐标点连线  形成图形中间为空
    //[aPath fill];  //图形中间的填充色为 红色。
    
    
    //画矩形框
    
    UIColor *rectColor = [UIColor blueColor];
    [rectColor set ];
    UIBezierPath *rectange = [UIBezierPath bezierPathWithRect:CGRectMake(10, 200, 100, 100)];
    
    rectange.lineWidth = 1.0;
    rectange.lineCapStyle = kCGLineCapButt;
    rectange.lineJoinStyle = kCGLineCapRound;
    [rectange fill];
    
    
    //画椭圆
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 200, 150, 100)];
    oval.lineWidth = 1.0;
    oval.lineCapStyle = kCGLineCapButt;
    oval.lineJoinStyle = kCGLineCapRound;
    [oval fill];
    
    //画圆弧
    UIBezierPath* arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 350)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(270)
                                                      clockwise:YES];
    
    arc.lineWidth = 5.0;
    arc.lineCapStyle = kCGLineCapRound; //线条拐角
    arc.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [arc stroke];
    
    //画曲线
    UIBezierPath *curve = [UIBezierPath bezierPath];
    
    curve.lineWidth = 5.0;
    curve.lineCapStyle = kCGLineCapRound; //线条拐角
    curve.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [curve moveToPoint:CGPointMake(100, 300)];  //开始点
    
    [curve addQuadCurveToPoint:CGPointMake(400, 400) controlPoint:CGPointMake(20, 20)];
    
    [curve stroke];
    
    // 画二次曲线
    UIBezierPath* twiceCurve = [UIBezierPath bezierPath];
    
    twiceCurve.lineWidth = 5.0;
    twiceCurve.lineCapStyle = kCGLineCapRound; //线条拐角
    twiceCurve.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [twiceCurve moveToPoint:CGPointMake(20, 50)];
    
    [twiceCurve addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];
    
    [twiceCurve stroke];
    
    //先画一个椭圆，在这个椭圆
    UIBezierPath*    aPath1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
    
    // Get the CGPathRef and create a mutable version.
    CGPathRef cgPath = aPath1.CGPath;
    //在原来椭圆的基础上在画一个椭圆
    CGMutablePathRef  mutablePath = CGPathCreateMutableCopy(cgPath);
    
    // Modify the path and assign it back to the UIBezierPath object
    CGPathAddEllipseInRect(mutablePath, NULL, CGRectMake(50, 50, 250, 200));
    aPath1.CGPath = mutablePath;
    
    // Release both the mutable copy of the path.
    CGPathRelease(mutablePath);
    
    aPath1.lineCapStyle = kCGLineCapButt; //线条拐角
        aPath1.lineJoinStyle = kCGLineCapRound; //终点处理
    
        [aPath1 stroke];//Draws line 根据坐标点连线  形成图形中间为空
        //[aPath fill];  //图形中间的填充色为 红色。
    
    
    //创建一个有轮廓的椭圆。
    // Create an oval shape to draw.
    UIBezierPath* aPath2 = [UIBezierPath bezierPathWithOvalInRect:
                           CGRectMake(0, 0, 200, 100)];
    
    // Set the render colors
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 10, 50);    //调整画的椭圆的位置
    
    // Adjust the drawing options as needed.
    aPath2.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath2 fill];
    [aPath2 stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
    
    
    
    
}


@end
