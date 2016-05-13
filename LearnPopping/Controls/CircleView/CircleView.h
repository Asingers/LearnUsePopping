//
//  CircleView.h
//  LearnPopping
//
//  Created by Asingers on 16/5/13.
//  Copyright © 2016年 Yuanjie Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property (nonatomic,strong) UIColor *strokeColor;
- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated;

@end
