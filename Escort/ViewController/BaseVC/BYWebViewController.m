//
//  BYWebViewController.m
//  Escort
//
//  Created by apple on 16/4/30.
//  Copyright © 2016年 CloudAvant. All rights reserved.
//

#import "BYWebViewController.h"
#import "BYCustomTools.h"

@interface BYWebViewController ()

@end

@implementation BYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"WEB RESOUCE";
    
//    default YES
//    [self.webView setUserInteractionEnabled:NO];
    
    NSURL *URL = [NSURL URLWithString:self.URLString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:URL]];
    self.webView.scrollView.bounces = NO;
    
    self.indicatorView.hidesWhenStopped = YES;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    
    if (![BYCustomTools isEmptyString:self.URLString]) {
        self.URLString = nil;
    }
}

#pragma mark -- WebView Delegate Method

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.indicatorView stopAnimating];
}

//UIWebView如何判断 HTTP 404 等错误
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ((([httpResponse statusCode]/100) == 2)) {
        // self.earthquakeData = [NSMutableData data];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [self.webView loadRequest:[ NSURLRequest requestWithURL: url]];
    } else {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:
                                  NSLocalizedString(@"HTTP Error",
                                                    @"Error message displayed when receving a connection error.")
                                                             forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:@"HTTP" code:[httpResponse statusCode] userInfo:userInfo];
        
        if ([error code] == 404) {
            NSLog(@"xx");
            self.webView.hidden = YES;
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
