//
//  DingProgressHUD.h
//  DingProgressHUD
//
//  Created by duodian on 2018/6/21.
//

#import <UIKit/UIKit.h>
/**
 *  显示风格
 */
typedef NS_ENUM(NSInteger,dingProgressHUDStyle) {
    /**
     *  Txt
     */
    dingProgressHUDStyleText=1,
    /**
     *  loding
     */
    dingProgressHUDStyleLoding,
    
    /**
     *  带字体的加载
     */
    dingShowViewStyleLodingText,
    /**
     *  alert
     */
    dingProgressHUDStyleAlert,
    /**
     *  alertIcon
     */
    dingProgressHUDStyleIconAlert,
    /**
     *  提示时使用，用作引导
     */
    dingProgressHUDStyleTips
};


typedef void(^dingProgressHUDAlertBlock)(NSInteger index);

@interface DingProgressHUD : UIView
#pragma mark - 外部不能修改或者不建议修改的，在继承类里面可以修改的
/** 内容View*/
@property(nullable,nonatomic,strong)UIView *ding_cententView;
@property(nonatomic,assign)CGFloat contentWidth;
@property(nonatomic,assign)CGFloat contentHeight;

@property(nonatomic,assign)dingProgressHUDStyle progressHUDStyle;

@property(nonatomic,copy)dingProgressHUDAlertBlock _Nullable alertBlock;
/** 显示几秒后，消失*/
@property (assign, nonatomic) NSTimeInterval showTime;
@property(nullable, nonatomic,strong)NSArray *buttonTitleArray;

#pragma mark - 外部可以修改属性

/**黑色背景透明度 默认0.5  default translucent(0.5)*/
@property(nonatomic,assign)CGFloat blackAlpha;//不要设置为>0.1，不立即释放
@property(nonatomic,strong)NSMutableArray * _Nullable dataArray;
/**是不是触摸其他区域，自动消失*/
@property(nonatomic,assign)BOOL isTouchRemove;

@property(nonatomic,assign)BOOL isAnimation;//暂时没有用到

//
@property(nonatomic,copy)NSString * _Nullable title;
@property(nonatomic,copy)NSString * _Nullable subTitle;
@property(nonatomic,copy)NSString * _Nullable iconName;



#pragma mark -  显示和隐藏的类方法
/**
 弹出提示对话框
 
 @param textStr 提示文本
 @return self
 */
+ (instancetype _Nullable )ding_showHUDWithStatus:(NSString*_Nullable)textStr;
+ (instancetype _Nullable )ding_showHUDWithStatus:(NSString *_Nullable)textStr afterDelay:(NSTimeInterval)seconds;

/**
 弹出加载等待框
 
 @return self
 */
+ (instancetype _Nullable )ding_showProgressHUD;
+ (instancetype _Nullable )ding_showProgressHUDToView:(UIView *_Nullable)view;
+ (instancetype _Nullable )ding_showProgressHUD:(NSString *_Nullable)textStr;
+ (instancetype _Nullable )ding_showProgressHUDToView:(UIView *_Nullable)view title:(NSString * _Nullable)textStr;
+ (instancetype _Nullable )ding_showProgressHUD:(NSString *_Nullable)textStr afterDelay:(NSTimeInterval)seconds;
/**
 隐藏弹窗
 
 @return YES
 */
+ (BOOL)ding_hideProgressHUD;
+ (BOOL)ding_hideAllProgressHUD;
+ (BOOL)ding_hideProgressHUDForView:(UIView *_Nullable)view;
+ (DingProgressHUD *_Nullable)ding_progressHUDForView:(UIView *_Nullable)view;
+ (BOOL)ding_hideAllProgressHUDForView:(UIView *_Nullable)view;


/**
 弹窗类似系统对话框
 
 @param textStr 标题
 @param subTitle 文本内容
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype _Nullable )ding_showAlertHUDTitle:(NSString *_Nullable)textStr subTitle:(NSString *_Nonnull)subTitle buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(dingProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )ding_showAlertHUDTitle:(NSString *_Nullable)textStr subTitle:( NSString * _Nonnull )subTitle buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(dingProgressHUDAlertBlock _Nullable)alertBlock;
/**
 弹窗类似系统对话框
 
 @param textStr 标题
 @param imageName 图标名称
 @param btnTitleArray 按钮数组最多2个
 @param alertBlock 按钮回调
 @return self
 */
+ (instancetype _Nullable )ding_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitles:(NSArray*_Nullable)btnTitleArray  alertBlock:(dingProgressHUDAlertBlock _Nullable )alertBlock;
+ (instancetype _Nullable )ding_showIconAlertHUDTitle:(NSString *_Nullable)textStr imageName:(NSString *_Nonnull)imageName buttonTitle:(NSString *_Nullable)buttonTitle alertBlock:(dingProgressHUDAlertBlock _Nullable)alertBlock;


-(void)ding_removeSelfView:(BOOL)animation;


-(void)ding_setTitleColor:(UIColor *_Nullable)titleColor subTitleColor:(UIColor *_Nullable)subTitleColor;

-(void)ding_setTitleColor:(UIColor *_Nullable)titleColor;

#pragma mark - 子类可以重写
-(void)ding_configUI;//子类重写
-(void)ding_createTextUI;
-(void)ding_createLodingUI;
-(void)ding_createAlertUI;
@end
