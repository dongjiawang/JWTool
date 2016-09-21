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
 设置view的圆角边框
 
 @param view   view
 @param radius 圆角大小
 @param width  边框宽度
 @param color  边框颜色
 */
+ (void)LRViewBorderRadius:(UIView *)view radius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;
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
/**
 *  图片高斯模糊
 *
 *  @param blurImage  需要模糊的图片
 *  @param blurRadius 模糊度
 *
 *  @return 完成的图片
 */
+ (UIImage *)creatBlurImage:(UIImage *)blurImage blurRadius:(CGFloat)blurRadius;
/**
 旋转动画
 
 @param dur         动画时间
 @param degree      旋转角度
 @param direction   Z轴偏移（0 ~ 1）
 @param repeatCount 旋转次数
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationRotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;
/**
 指定时间内一直闪烁动画
 
 @param time 闪烁时间
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationOpacityForeverAnimation:(float)time;
/**
 指定时间内闪烁次数的动画
 
 @param repeatTimes 闪烁次数
 @param time        闪烁时间
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationOpacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
/**
 横向移动的动画
 
 @param time 动画时间
 @param x    移动距离
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationMoveX:(float)time X:(NSNumber *)x;
/**
 纵向移动的动画
 
 @param time 动画时间
 @param y    移动距离
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationMoveY:(float)time Y:(NSNumber *)y;
/**
 缩放动画
 
 @param Multiple      缩放后的大小
 @param orginMultiple 初始大小
 @param time          动画时间
 @param repeatTimes   重复次数
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationScale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
/**
 组合动画
 
 @param animationAry 动画数组
 @param time         动画时间
 @param repeatTimes  动画次数
 
 @return 动画
 */
+ (CAAnimationGroup *)CAAnimationGroupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes;
/**
 点移动动画
 
 @param point 目标点
 
 @return 动画
 */
+ (CABasicAnimation *)CAAnimationMovepoint:(CGPoint )point;
/**
 路径动画
 
 @param path        路径
 @param time        动画时间
 @param repeatTimes 动画次数
 
 @return 动画
 */
+ (CAKeyframeAnimation *)CAAnimationKeyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes;
@end
