//
//  CWDemoViewController.m
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWDemoViewController.h"

#import "CWUtils+Encoding.h"

@interface CWDemoViewController ()

@end

@implementation CWDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *md5Str = [CWUtils encodeMD5WithString:@"md5,fk u"];
    NSString *hexStr = [CWUtils encodeHexWithData:[@"BBDDEE" dataUsingEncoding:NSUTF8StringEncoding] upperCase:YES];
    NSString *shaStr = [CWUtils encodeSHA512WithString:@"bbbcddeff"];
    
    NSLog(@"MD5：%@", md5Str);
    NSLog(@"HEX：%@", hexStr);
    NSLog(@"SHA：%@", shaStr);
    
    // Do any additional setup after loading the view.
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
