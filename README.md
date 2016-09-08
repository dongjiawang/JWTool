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



