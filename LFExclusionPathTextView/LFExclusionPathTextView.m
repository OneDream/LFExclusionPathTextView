//
//  LFExclusionPathTextView.m
//  LFExclusionPathTextView
//
//  Created by linxiaobin on 15/6/12.
//  Copyright (c) 2015年 aliexpress. All rights reserved.
//

#import "LFExclusionPathTextView.h"

@implementation LFExclusionPathTextView

- (UIBezierPath *)curvePathWithOrigin:(CGPoint)origin
{
    CGRect rect = CGRectMake(origin.x - 25, origin.y - 25, 50, 50);
    return [UIBezierPath bezierPathWithRect:rect];
}

@end
