//
//  ViewController.m
//  CAShapeLayerFillRule
//
//  Created by HYG_IOS on 16/9/1.
//  Copyright © 2016年 magic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 矩形框rect
    [self addInnerRect];
    // 圆形填充
    [self addCircleRect];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addInnerRect
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 100, 100)];
    [self.view addSubview:view];
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 2.0f;
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    [view.layer addSublayer:layer];
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect innerRect = CGRectMake(20, 20, 50, 50);
    
    CGPathAddRect(path, nil, view.bounds);
    CGPathAddRect(path, nil, innerRect);
    
    layer.path = path;
    
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.fillColor = [UIColor redColor].CGColor;
}

- (void)addCircleRect
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(110, 50, 120, 120)];
    [self.view addSubview:view];
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 2.0f;
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    [view.layer addSublayer:layer];
    
    UIBezierPath * arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(60, 60) radius:50 startAngle:0.0 endAngle:M_PI * 2 clockwise:YES];
//    layer.path = arcPath.CGPath;
    
    UIBezierPath * rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 120, 120)];
//    layer.path = rectPath.CGPath;
    
    [rectPath appendPath:arcPath];
    
    layer.path = rectPath.CGPath;
    
    layer.fillColor = [UIColor blackColor].CGColor;
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.opacity = 0.5;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
