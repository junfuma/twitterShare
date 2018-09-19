
//

#import "ViewController.h"
#import <Twitter/Twitter.h>
#import <TwitterKit/TWTRKit.h>

#define showAlert(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]
//   twitterkit-consumer/api key://
//   twittersdk://
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *shareTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareTextBtn.frame = CGRectMake(100, 100, 150, 50) ;
    [shareTextBtn setTitle:@"分享文字" forState:UIControlStateNormal];
    [shareTextBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [shareTextBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareTextBtn];
    
    UIButton *sharimageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sharimageBtn.frame = CGRectMake(100, 200, 150, 50) ;
    [sharimageBtn setTitle:@"分享文字图片" forState:UIControlStateNormal];
    [sharimageBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [sharimageBtn addTarget:self action:@selector(shareimage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sharimageBtn];
    
    UIButton *shareAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareAllBtn.frame = CGRectMake(100, 300, 150, 50) ;
    [shareAllBtn setTitle:@"分享文字链接图片" forState:UIControlStateNormal];
    [shareAllBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [shareAllBtn addTarget:self action:@selector(shareImageText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareAllBtn];
    
    
    UIButton *shareURLImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareURLImageBtn.frame = CGRectMake(100, 400, 150, 50) ;
    [shareURLImageBtn setTitle:@"分享文字链接" forState:UIControlStateNormal];
    [shareURLImageBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [shareURLImageBtn addTarget:self action:@selector(shareurltext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareURLImageBtn];
}
- (void)share{
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText:@"大幂幂氨基酸快点哈空间的八九点"];
    //带图片方法
//    [composer setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img5q.duitang.com/uploads/item/201411/05/20141105005117_nBfM8.jpeg"]]]];
    //    [composer setURL:[NSURL URLWithString:@"https://baike.baidu.com/item/%E6%9D%A8%E5%B9%82/149851?fr=aladdin"]];
    
    [composer showFromViewController:self completion:^(TWTRComposerResult result){
        if(result == TWTRComposerResultCancelled) {
            //分享失败
            showAlert(@"分享失败");
            
        }else{
            //分享成功
            showAlert(@"分享成功");
        }
        
    }];
}
- (void)shareimage{
    BOOL install = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]];
    if (!install) {
        
//        showAlert(@"请安装客户端");
        return;
    }
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText:@"大幂幂"];
    //带图片方法
    [composer setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img5q.duitang.com/uploads/item/201411/05/20141105005117_nBfM8.jpeg"]]]];
//    [composer setURL:[NSURL URLWithString:@"https://baike.baidu.com/item/%E6%9D%A8%E5%B9%82/149851?fr=aladdin"]];
    
    [composer showFromViewController:self completion:^(TWTRComposerResult result){
        if(result == TWTRComposerResultCancelled) {
            //分享失败
            showAlert(@"分享失败");
            
        }else{
            //分享成功
            showAlert(@"分享成功");
        }
        
    }];
    
    //检查是否当前会话具有登录的用户
    //    if ([[Twitter sharedInstance].sessionStore hasLoggedInUsers]) {
    
    
}

- (void)shareImageText{
    BOOL install = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]];
    if (!install) {
   
//        showAlert(@"请安装客户端");
        return;
    }
    TWTRComposer *composer = [[TWTRComposer alloc] init];
//    内容title
    [composer setText:@"大幂幂"];
    //带图片方法
    [composer setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img5q.duitang.com/uploads/item/201411/05/20141105005117_nBfM8.jpeg"]]]];
//    链接地址
    [composer setURL:[NSURL URLWithString:@"https://baike.baidu.com/item/%E6%9D%A8%E5%B9%82/149851?fr=aladdin"]];

    [composer showFromViewController:self completion:^(TWTRComposerResult result){
        if(result == TWTRComposerResultCancelled) {
            //分享失败
            showAlert(@"分享失败");
            
        }else{
            //分享成功
            showAlert(@"分享成功");
        }
        
    }];
    
    //检查是否当前会话具有登录的用户
//    if ([[Twitter sharedInstance].sessionStore hasLoggedInUsers]) {


}
- (void)shareurltext{
    BOOL install = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]];
    if (!install) {
        
        //        showAlert(@"请安装客户端");
        return;
    }
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText:@"大幂幂大萨达大所大所"];
    //带图片方法

    [composer setURL:[NSURL URLWithString:@"https://baike.baidu.com/item/%E6%9D%A8%E5%B9%82/149851?fr=aladdin"]];
    
    [composer showFromViewController:self completion:^(TWTRComposerResult result){
        if(result == TWTRComposerResultCancelled) {
            //分享失败
            showAlert(@"分享失败");
            
        }else{
            //分享成功
            showAlert(@"分享成功");
        }
        
    }];
    
    //检查是否当前会话具有登录的用户
    //    if ([[Twitter sharedInstance].sessionStore hasLoggedInUsers]) {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
