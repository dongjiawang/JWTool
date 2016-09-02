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
