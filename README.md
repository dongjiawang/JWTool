# iOS-JWTool
####第一次提交
```Objective-c
 //  通过图片的二进制数据分析图片类型
+ (NSString *)getImageTypeFormData:(NSData *)imageData;
 //  根据网络图片地址判断图片类型
+ (NSString *)getImageTypeFormUrl:(NSString *)imageUrl;
 //  获取两个时间段间隔
+ (NSTimeInterval)timeIntervalWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
 //  获取时间间隔
+ (NSString *)timeIntervalStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
 //  获取当前时间字符串
+ (NSString *)getCurrentTimeString;
 //  画圆角
+ (UIView *)clipsView:(UIView *)view withCornerRadius:(CGFloat)radius;
 //  画View的指定角为圆角
+ (UIView *)drawView:(UIView *)view roundingCorners:(UIRectCorner)corners cornerRadius:(CGSize)cornerRadius;
```

#### 第二次提交

```objective-c
//  汉字转拼音
+ (NSString *)convertChineseToPinYin:(NSString *)chineseStr;
//  字符串转成UIColor
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
//  RGB转UIColor:    @"(255,255,255)"
+ (UIColor *)colorWithRGB:(NSString *)RGBStr alpha:(CGFloat)alpha;
```

####第三次提交
```objective-c
 //  把图片绘制指定size
+ (UIImage *)ScaleToSize:(UIImage *)image size:(CGSize)size;
 //  根据需要获取当前的年、月、日、星期、时、分、秒
+ (NSInteger)getCurrentDetailTime:(NSCalendarUnit)darUnit;
```

####第四次提交
```objective-c
 //  验证手机号
+ (NSString *)valiMobile:(NSString *)mobile;
```

####第五次提交
```objective-c
 //  验证身份证号码（15位、18位）
+ (BOOL)validateIDCardNumber:(NSString *)value;
```
####第六次提交
```objective-c
//  验证邮箱地址
+ (BOOL)isValidateEmail:(NSString *)email;
```
####第七次提交
```objective-c
//  图片高斯模糊
+ (UIImage *)creatBlurImage:(UIImage *)blurImage blurRadius:(CGFloat)blurRadius;
```
####第八次提交
```objective-c
// 旋转动画
+ (CABasicAnimation *)CAAnimationRotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;
// 指定时间内一直闪烁动画
+ (CABasicAnimation *)CAAnimationOpacityForeverAnimation:(float)time;
// 指定时间内闪烁次数的动画
+ (CABasicAnimation *)CAAnimationOpacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
// 横向移动的动画
+ (CABasicAnimation *)CAAnimationMoveX:(float)time X:(NSNumber *)x;
// 纵向移动的动画
+ (CABasicAnimation *)CAAnimationMoveY:(float)time Y:(NSNumber *)y;
// 缩放动画
+ (CABasicAnimation *)CAAnimationScale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
// 组合动画
+ (CAAnimationGroup *)CAAnimationGroupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes;
// 点移动动画
+ (CABasicAnimation *)CAAnimationMovepoint:(CGPoint )point;
// 路径动画
+ (CAKeyframeAnimation *)CAAnimationKeyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes;
```
####第九次提交
```objective-c
// 设置view的圆角边框
+ (void)LRViewBorderRadius:(UIView *)view radius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;
```

####第十次提交
```objective-c
// 判断字符串中是否含有非法字符（非法字符是指 除数字 字母 文字以外的所有字符）
+ (BOOL)judgeIllegalCharacter:(NSString *)content;
// 验证姓名      
+ (BOOL)isNameValid:(NSString *)name;
```

