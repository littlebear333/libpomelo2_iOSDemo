//
//  ViewController.m
//  pomelo2
//
//  Created by 谢华 on 12/6/20.
//  Copyright © 2020 谢华. All rights reserved.
//

#import "ViewController.h"
#include "pomelo.h"
#import "test.h"
#import "PomeloHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self main];
    // Do any additional setup after loading the view.
    
    
    [PomeloHelper connectServerWithaccesstoken:@"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiUk9MRV9Vc2VyIiwicGhvbmUiOiIxODY1MjA5MzcwNSIsInVzZXJfbmFtZSI6IiMzNDg1MTIxNTc2NjAzNDg0MTYiLCJzY29wZSI6WyJ3ZWItYXBwIiwidXNlcmluZm8iXSwiaWQiOiIzNDg1MTIxNTc2NjAzNDg0MTYiLCJleHAiOjE2MDczMDY3NzYsImVtYWlsIjoiODQ5NDM1MjcxQHFxLmNvbSIsImp0aSI6ImUwOWVlZjM2LWQ1NDUtNDFmNy05ZTY2LTU0NjA4MTc3YjMxNCIsImNsaWVudF9pZCI6IndlYi1hcHAifQ.PTp5-_YuBQ4BmsimAtK0kevHrf0Hnteef8HmUvk9jV-YN5W359SlRmiLXng8X37L08sK7_fsnTQxrVE6BAEcodNeFSVLGkQv-OVmGnaLQ3LW334p0Ya5Cc0sRZQN79pHh9bEPBkJDmFjC3ZNDGzUVefOxBM1tUQ7PCVysBcleL0" refreshToken:@"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiUk9MRV9Vc2VyIiwicGhvbmUiOiIxODY1MjA5MzcwNSIsInVzZXJfbmFtZSI6IiMzNDg1MTIxNTc2NjAzNDg0MTYiLCJzY29wZSI6WyJ3ZWItYXBwIiwidXNlcmluZm8iXSwiYXRpIjoiZTA5ZWVmMzYtZDU0NS00MWY3LTllNjYtNTQ2MDgxNzdiMzE0IiwiaWQiOiIzNDg1MTIxNTc2NjAzNDg0MTYiLCJleHAiOjE2MDc5MDk3NzYsImVtYWlsIjoiODQ5NDM1MjcxQHFxLmNvbSIsImp0aSI6ImY3NmZmN2Y2LWRlM2MtNGZlMy04ZGUyLWIyODM5NTU1MzU4YSIsImNsaWVudF9pZCI6IndlYi1hcHAifQ.XehtRZdtfiq0LYW2RtGzq9UNU6CwV3xRM72ucXShDMFvqcLt3pMZ9dSmutJKtZgFWTbzc5kRw9PNKeNEkRgqEjnpeLm3ckEwCXLje2fzOUXTQI0ZFYB8fRJF0M20Oh3fnU-CHONDRcBXWafnpL1P_kXJvBBiwNj0CJRDVRuliUI" userID:@"348512157660348416" reqeustBack:^(NSString * requestBack){
        NSLog(@"response message is ==%@==",requestBack);
    } inputData:^(NSString * input){
        NSLog(@"receive message is ==%@==",input);
    }];
     
    

}



@end
