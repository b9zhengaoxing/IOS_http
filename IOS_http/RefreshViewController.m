//
//  RefreshViewController.m
//  IOS_http
//
//  Created by tengfei li on 9/9/15.
//  Copyright (c) 2015年 LYD. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()

@end

@implementation RefreshViewController

#pragma mark- cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//刷新
- (IBAction)beginToRefresh:(id)sender {
    if(self.urlTextField.text==nil)
    {
        NSLog(@"请求错误");
    }//if
    else
    {
        for (int a=0; a<200; a++) {
            [self sendRequest:self.urlTextField.text];
            sleep(0.1);
        }
    }//else
}

/**
 *  创建请求
 *
 *  @param data 访问网址
 *
 *  @return 请求
 */
-(void)sendRequest:(NSString*)data
{
    // 1.设置请求路径
    NSURL *URL=[NSURL URLWithString:data];//不需要传递参数
    
    //    2.创建请求对象
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:URL];//默认为get请求
    request.timeoutInterval=5.0;//设置请求超时为5秒
    request.HTTPMethod=@"GET";//设置请求方法
    
    
    //客户端类型，只能写英文
    [request setValue:@"Mozilla/5.0" forHTTPHeaderField:@"User-Agent"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror:%@%d", error.localizedDescription,error.code);
                               }else{
                                   
                                   NSLog(@"收到");
                               }
                           }];
}
@end
