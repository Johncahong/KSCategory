//
//  UIControl+Extension.m
//  Button防止多次点击
//
//  Created by keisun on 2018/3/26.
//  Copyright © 2018年 keisun. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

//void *表示未确定类型指针，可以指向任何类型数据
static void *UIControl_eventInternalKey = "UIControl_eventInternalKey";
static void *UIControl_eventTimeKey = "UIControl_eventTimeKey";
@interface UIControl ()
//首次事件发生的时间
@property(nonatomic, assign)NSTimeInterval eventTime;
@end

@implementation UIControl (Extension)

-(void)setEventInternal:(NSTimeInterval)eventInternal{
    objc_setAssociatedObject(self, UIControl_eventInternalKey, @(eventInternal), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)eventInternal{
    return [objc_getAssociatedObject(self, UIControl_eventInternalKey) doubleValue];
}

-(void)setEventTime:(NSTimeInterval)eventTime{
    objc_setAssociatedObject(self, UIControl_eventTimeKey, @(eventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)eventTime{
    return [objc_getAssociatedObject(self, UIControl_eventTimeKey) doubleValue];
}

+(void)load{
    
    //获取实例方法
    Method systemMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method myMethod = class_getInstanceMethod([self class], @selector(gh_sendAction:to:forEvent:));
    
    //若字符相同，则表示返回值类型，参数个数和参数类型相同
    if (systemMethod && myMethod && strcmp(method_getTypeEncoding(systemMethod), method_getTypeEncoding(myMethod))==0) {
        method_exchangeImplementations(systemMethod, myMethod);
    }else{
        class_addMethod([self class], @selector(sendAction:to:forEvent:), method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    }
}

-(void)gh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    //NSDate.date.timeIntervalSince1970表示当前的时间戳, self.eventTime上次记录的时间戳
    if (NSDate.date.timeIntervalSince1970 - self.eventTime< self.eventInternal){
        return;
    }
    
    if (self.eventInternal > 0) {
        self.eventTime = NSDate.date.timeIntervalSince1970;
    }
    [self gh_sendAction:action to:target forEvent:event];
}

@end
