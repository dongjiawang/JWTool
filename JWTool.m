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
@end
