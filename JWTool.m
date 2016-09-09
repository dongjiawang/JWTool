//
//  JWTool.m
//  JWTool
//
//  Created by 董佳旺 on 16/9/2.
//  Copyright © 2016年 董佳旺. All rights reserved.
//

#import "JWTool.h"

@implementation JWTool

+ (NSString *)getImageTypeFormData:(NSData *)imageData {
    uint8_t c;
    [imageData getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([imageData length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[imageData subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

+ (NSString *)getImageTypeFormUrl:(NSString *)imageUrl {
    // 获取URL后缀
    NSString *extensionName = imageUrl.pathExtension.lowercaseString;
    
    if ([extensionName isEqualToString:@"png"] || [extensionName isEqualToString:@"PNG"]) {
        return @"png";
    } else if ([extensionName isEqualToString:@"jpeg"] || [extensionName isEqualToString:@"JPEG"]) {
        return @"jpeg";
    } else if ([extensionName isEqualToString:@"jpg"] || [extensionName isEqualToString:@"JPG"]) {
        return @"jpg";
    } else if ([extensionName isEqualToString:@"gif"] || [extensionName isEqualToString:@"GIF"]) {
        return @"gif";
    } else if ([extensionName isEqualToString:@"tiff"] || [extensionName isEqualToString:@"TIFF"]) {
        return @"tiff";
    } else if ([extensionName isEqualToString:@"riff"] || [extensionName isEqualToString:@"RIFF"]) {
        return @"riff";
    } else if ([extensionName isEqualToString:@"webp"] || [extensionName isEqualToString:@"WEBP"]) {
        return @"webp";
    } else {
        return nil;
    }
    return nil;
}

+ (NSTimeInterval)timeIntervalWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if ([startTime rangeOfString:@":"].location != NSNotFound) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }    
    NSDate *startDate = [dateFormatter dateFromString:startTime];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:startDate];
    return timeInterval;
}

+ (NSString *)timeIntervalStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    NSInteger time = [JWTool timeIntervalWithStartTime:startTime endTime:endTime];
    
    //显示时间间隔
    NSInteger minute,second,hour,day;
    second = time % 60;
    minute = (time / 60) % 60;
    hour = (time / 3600) % 24;
    day = (time / 3600 / 24);
    
    NSString *timeStr;
    if (day == 0) {
        timeStr = [NSString stringWithFormat:@"%ld:%ld:%ld", hour, minute, second];
    } else {
        timeStr = [NSString stringWithFormat:@"%ld 天 %ld:%ld:%ld", day, hour, minute, second];
    }
    return timeStr;
}

+ (NSString *)getCurrentTimeString {
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *time = [dateFormatter stringFromDate:currentTime];
    return time;
}

+ (NSInteger)getCurrentDetailTime:(NSCalendarUnit)darUnit {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = darUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    switch (darUnit) {
        case NSCalendarUnitYear:
        {
            return [dateComponent year];
        }
            break;
        case NSCalendarUnitMonth:
        {
            return [dateComponent month];
        }
            break;
        case NSWeekdayCalendarUnit:
        {
            return [dateComponent weekday];
        }
            break;
        case NSDayCalendarUnit:
        {
            return [dateComponent day];
        }
            break;
        case NSMinuteCalendarUnit:
        {
            return [dateComponent minute];
        }
            break;
        case NSSecondCalendarUnit:
        {
            return [dateComponent second];
        }
            break;
            
        default:
            break;
    }
    return 0;
}

+ (UIView *)clipsView:(UIView *)view withCornerRadius:(CGFloat)radius {
    view.clipsToBounds = YES;
    view.layer.cornerRadius = radius;
    view.layer.shouldRasterize = YES;
    return view;
}

+ (UIView *)drawView:(UIView *)view roundingCorners:(UIRectCorner)corners cornerRadius:(CGSize)cornerRadius{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    return view;
}

+ (NSString *)convertChineseToPinYin:(NSString *)chineseStr {
    NSMutableString * theChinese = [NSMutableString stringWithString:chineseStr];
    CFRange range = CFRangeMake(0, theChinese.length);
    CFStringTransform((CFMutableStringRef)theChinese, &range, kCFStringTransformToLatin, NO);
    range = CFRangeMake(0, theChinese.length);
    CFStringTransform((CFMutableStringRef)theChinese, &range, kCFStringTransformStripCombiningMarks, NO);
    NSString * pinyin = [theChinese stringByReplacingOccurrencesOfString:@" " withString:@""];
    return pinyin;
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)colorWithRGB:(NSString *)RGBStr alpha:(CGFloat)alpha {
    if (RGBStr == nil || RGBStr.length == 0)
    {
        return [UIColor clearColor];
    }
    
    int red, green, blue;
    NSRange range;
    range.length = 3;
    
    range.location = 1;
    [[NSScanner scannerWithString:[RGBStr substringWithRange:range]] scanInt:&red];
    range.location = 5;
    [[NSScanner scannerWithString:[RGBStr substringWithRange:range]] scanInt:&green];
    range.location = 9;
    [[NSScanner scannerWithString:[RGBStr substringWithRange:range]] scanInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

+ (UIImage *)ScaleToSize:(UIImage *)image size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (NSString *)valiMobile:(NSString *)mobile {
    if (mobile.length < 11) {
        return @"手机号长度只能是11位";
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return nil;
        }else{
        }
        
        if (isMatch1) {
            return @"移动号码";
        } else if (isMatch2) {
            return @"联通号码";
        } else if (isMatch3) {
            return @"电信号码";
        } else {
            return @"请输入正确的*****号码";
        }
    }
    return nil;
}
@end
