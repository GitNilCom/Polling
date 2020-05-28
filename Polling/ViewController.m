//
//  ViewController.m
//  dd
//
//  Created by CE  on 2017/5/2.
//  Copyright © 2017年 CE . All rights reserved.
//

#import "ViewController.h"
#import "SHPolling.h"
#import "HDWindowLogger.h"

@interface ViewController ()
@property(nonatomic,strong)SHPolling *SHPollinga;
@property(nonatomic,strong)SHPolling *SHPollingb;
@property(nonatomic,strong)SHPolling *SHPollingc;
@property(nonatomic,strong)SHPolling *SHPollingd;
@property(nonatomic,strong)SHPolling *SHPollinge;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated{
    [HDWindowLogger defaultWindowLogger].mCompleteLogOut = true;
    [HDWindowLogger show];
    [HDWindowLogger defaultWindowLogger].mPrivacyPassword = @"12345678901234561234567890123456";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.SHPollinga = [SHPolling pollingWithInterval:3 block:^(SHPolling *observer,SHPollingStatus pollingStatus) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            HDNormalLog(@"轮询，时间间隔2s");
            [observer next:pollingStatus];
        });
        
    }];
    
    //
    //    self.SHPollingb = [SHPolling SHPollingWithInterval:3 block:^(SHPolling *SHPolling,BOOL repet) {
    //        NSLog(@"bb");
    //        [SHPolling next:repet];
    //
    //    }];
    //    [self.SHPollingb start];
    //
    //    self.SHPollingc = [SHPolling SHPollingWithInterval:3 block:^(SHPolling *SHPolling,BOOL repet) {
    //        NSLog(@"cc");
    //        [SHPolling next:repet];
    //
    //    }];
    //    [self.SHPollingc start];
    //
    //    self.SHPollingd = [SHPolling SHPollingWithInterval:3 block:^(SHPolling *SHPolling,BOOL repet) {
    //        NSLog(@"dd");
    //        [SHPolling next:repet];
    //
    //    }];
    //    [self.SHPollingd start];
    //
    //    self.SHPollinge = [SHPolling SHPollingWithInterval:3 block:^(SHPolling *SHPolling,BOOL repet) {
    //        NSLog(@"ee");
    //        [SHPolling next:repet];
    //
    //    }];
    //    [self.SHPollinge start];
}
- (IBAction)start:(id)sender {
    HDNormalLog(@"点击开始");
    [self.SHPollinga start];
}
- (IBAction)pause:(id)sender {
    HDNormalLog(@"点击暂停");
    [self.SHPollinga pause];
}
- (IBAction)call:(id)sender {
    HDNormalLog(@"点击调用");
    [self.SHPollinga callBlock];
}
- (IBAction)log:(id)sender {
    NSString *runing = [NSString stringWithFormat:@"runing = %d",[self.SHPollinga runing]];
    HDNormalLog(runing);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
