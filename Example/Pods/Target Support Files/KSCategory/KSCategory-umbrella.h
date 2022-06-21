#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "KSCategory.h"
#import "UIButton+Extension.h"
#import "UIControl+Extension.h"

FOUNDATION_EXPORT double KSCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char KSCategoryVersionString[];

