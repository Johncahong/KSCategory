//
//  UIControl+Extension.h
//  Button防止多次点击
//
//  Created by keisun on 2018/3/26.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Extension)
//事件间的时间间隔
@property(nonatomic, assign)NSTimeInterval eventInternal;
@end
