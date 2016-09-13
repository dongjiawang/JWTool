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
 *  根据需要获取当前的年、月、日、星期、时、分、秒
 *
 *  @param darUnit 需要获取到类型
 *
 *  @return 返回数据
 */
+ (NSInteger)getCurrentDetailTime:(NSCalendarUnit)darUnit;
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
/**
 *  汉字转拼音
 *
 *  @param chineseName 汉字
 *
 *  @return 拼音
 */
+ (NSString *)convertChineseToPinYin:(NSString *)chineseStr;
/**
 *  字符串转成UIColor
 *
 *  @param color 字符串的color
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/**
 *  RGB转UIColor:    @"(255,255,255)"
 *
 *  @param RGBStr RGB
 *  @param alpha  透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSString *)RGBStr alpha:(CGFloat)alpha;
/**
 *  把图片绘制指定size
 *
 *  @param image 图片
 *  @param size  大小
 *
 *  @return 修改后的图【么
 */
+ (UIImage *)ScaleToSize:(UIImage *)image size:(CGSize)size;
/**
 *  验证手机号
 *
 *  @param mobile 手机号
 *
 *  @return 验证结果    
 */
+ (NSString *)valiMobile:(NSString *)mobile;
/**
 *  验证身份证号码（15位、18位）
 *
 *  @param value 号码字符串
 *
 *  @return 是否正确
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;
/**
 *  验证邮箱地址
 *
 *  @param email 邮箱地址
 *
 *  @return 结果
 */
+ (BOOL)isValidateEmail:(NSString *)email;
@end
