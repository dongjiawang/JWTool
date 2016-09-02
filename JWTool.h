//
//  JWTool.h
//  JWTool
//
//  Created by 董佳旺 on 16/9/2.
//  Copyright © 2016年 董佳旺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JWTool : NSObject
/**
 *  通过图片的二进制数据分析图片类型
 *
 *  @param imageData 图片数据
 *
 *  @return 图片类型
 */
+ (NSString *)getImageTypeFormData:(NSData *)imageData;
/**
 *  根据网络图片地址判断图片类型
 *
 *  @param imageUrl 图片地址
 *
 *  @return 图片类型
 */
+ (NSString *)getImageTypeFormUrl:(NSString *)imageUrl;
/**
 *  获取两个时间段间隔
 *
 *  @param startTime 开始时间
 *  @param endTime   结束时间
 *
 *  @return 时间间隔
 */
+ (NSTimeInterval)timeIntervalWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
/**
 *  获取时间间隔
 *
 *  @param startTime 开始时间
 *  @param endTime   结束时间
 *
 *  @return 时间间隔
 */
+ (NSString *)timeIntervalStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
/**
 *  获取当前时间字符串
 *
 *  @return 时间
 */
+ (NSString *)getCurrentTimeString;
/**
 *  画圆角
 *
 *  @param view   需要切割的View
 *  @param radius 圆角大小
 *
 *  @return 切割好的view
 */
+ (UIView *)clipsView:(UIView *)view withCornerRadius:(CGFloat)radius;
/**
 *  画View的指定角为圆角
 *
 *  @param view         需要画的view
 *  @param corners      指定角
 *
 *  @param cornerRadius 圆角大小
 *  @return 画好的view 
 */
+ (UIView *)drawView:(UIView *)view roundingCorners:(UIRectCorner)corners cornerRadius:(CGSize)cornerRadius;
@end
