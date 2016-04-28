//
//  UIImage+MGRoundImage.m
//  MGThink
//
//  Created by Maseventeen on 16/4/28.
//  Copyright © 2016年 Margin. All rights reserved.
//

#import "UIImage+MGRoundImage.h"

@implementation UIImage (MGRoundImage)

- (UIImage *)roundImage {
    return [self roundImageWithborder:0 color:nil];
}

- (UIImage *)roundImageWithborder:(CGFloat)border color:(UIColor *)color {
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    UIBezierPath *bigCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [color set];
    [bigCircle fill];
    UIBezierPath *smallCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border)];
    [smallCircle addClip];
    [self drawAtPoint:CGPointMake(border, border)];
    // 拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

@end
