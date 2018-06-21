//
//  DingHUDVisionView.m
//  DingProgressHUD
//
//  Created by duodian on 2018/6/21.
//

#import "DingHUDVisionView.h"

@implementation DingHUDVisionView

#pragma mark - 创建UI
-(void)ding_configUI{
    NSString *bgImagName = @"ding_bg_txt";
    switch (self.progressHUDStyle) {
        case dingProgressHUDStyleText:
        {
            self.contentHeight=64;//(kdingScreenWidth_Show*0.8*128)/508;
            self.contentWidth=254;//kdingScreenWidth_Show*0.8;
            self.isTouchRemove=NO;
        }
            break;
        case dingProgressHUDStyleLoding:
        {
            self.contentHeight=64;
            self.contentWidth=94;
            self.isTouchRemove=NO;
            bgImagName=@"ding_bg_loding";
        }
            break;
        case dingShowViewStyleLodingText:
        {
            self.contentHeight=64;
            self.contentWidth=94;
            self.isTouchRemove=NO;
            bgImagName=@"ding_bg_loding";
        }
            break;
        case dingProgressHUDStyleAlert:
        {
            self.contentHeight=228;
            self.contentWidth=382;
            self.isTouchRemove=NO;
            bgImagName=@"ding_bg_alert";
        }
            break;
        default:
            break;
    }
    
    CGFloat leftSpace=(self.frame.size.width-self.contentWidth)/2.0;
    CGFloat topSpace=( self.frame.size.height-self.contentHeight)/2.0;
    
    
    self.ding_cententView=[[UIView alloc]initWithFrame:CGRectMake(leftSpace, topSpace, self.contentWidth, self.contentHeight)];
    
    [self addSubview:self.ding_cententView];
    self.ding_cententView.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    
    self.ding_cententView.clipsToBounds=YES;
    
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentWidth, self.contentHeight)];
    NSBundle *bundle = [NSBundle bundleForClass:[DingProgressHUD class]];
    NSURL *url = [bundle URLForResource:@"DingProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    NSString *path = [imageBundle pathForResource:bgImagName ofType:@"png"];
    backgroundImageView.image=[UIImage imageWithContentsOfFile:path];
    [self.ding_cententView addSubview:backgroundImageView];
    
    switch (self.progressHUDStyle) {
        case dingProgressHUDStyleText:
        {
            [self ding_createTextUI];
        }
            break;
        case dingProgressHUDStyleLoding:
        {
            [self ding_createLodingUI];
        }
            break;
        case dingShowViewStyleLodingText:
        {
            [self ding_createLodingUI];
        }
            break;
        case dingProgressHUDStyleAlert:
        {
            [self ding_createAlertUI];
        }
            break;
        default:
            break;
    }
    
}

-(void)ding_createAlertUI{
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, self.contentWidth-40, 20)];
    titleLabel.text=@"please connect Vision's WiFi in 'SETTING->WiFi' first";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont systemFontOfSize:14];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.ding_cententView addSubview:titleLabel];
    
    UIColor *themeColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:232/255.0 alpha:1];
    UILabel *subLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 142+10, self.contentWidth-40, 20)];
    subLabel.text=@"1.choose WiFi named CellRobot_Vision  2.enter the password Vision";
    subLabel.textColor=themeColor;
    subLabel.font=[UIFont systemFontOfSize:14];
    subLabel.textAlignment=NSTextAlignmentCenter;
    subLabel.adjustsFontSizeToFitWidth=YES;
    [self.ding_cententView addSubview:subLabel];
    
    NSBundle *bundle = [NSBundle bundleForClass:[DingProgressHUD class]];
    NSURL *url = [bundle URLForResource:@"DingProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    CGFloat space = (self.contentWidth-136)/3.0f;
    UIImageView *wifiView = [[UIImageView alloc]initWithFrame:CGRectMake(space+34-60, 50+10, 120, 71)];
    NSString *path1 = [imageBundle pathForResource:@"ding_vision_wifi" ofType:@"png"];
    wifiView.image = [UIImage imageWithContentsOfFile:path1];
    
    [self.ding_cententView addSubview:wifiView];
    
    UIImageView *visionView=[[UIImageView alloc]initWithFrame:CGRectMake(self.contentWidth/2.0f+space/2.0f+34-42, 50, 84, 92)];
    NSString *path2 = [imageBundle pathForResource:@"ding_vision_password" ofType:@"png"];
    visionView.image = [UIImage imageWithContentsOfFile:path2];
    [self.ding_cententView addSubview:visionView];
    
    for (int i=0; i<self.buttonTitleArray.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(space+i*(68+space), self.contentHeight-40, 68, 24)];
        NSString *path3 = [imageBundle pathForResource:@"ding_vision_btn" ofType:@"png"];
        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:path3] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:14];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag=100+i;
        [btn setTitle:self.buttonTitleArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.ding_cententView addSubview:btn];
    }
    
    //    if(self.title.length<=0){
    //        subLabel.frame=CGRectMake(20, 20, self.contentWidth-40, 80);
    //    }
    
    
}

- (void)buttonClick:(UIButton *)btn {
    
}
@end
