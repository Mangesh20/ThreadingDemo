//
//  ViewController.m
//  ThreadingDemo
//
//  Created by Mangesh Tekale on 09/02/15.
//  Copyright (c) 2015 ComedyMob. All rights reserved.
//

#import "ViewController.h"
#define kColorGreen [UIColor colorWithRed:143/255.0 green:199/255.0 blue:107/255.0 alpha:1]
#define kColorRed [UIColor colorWithRed:254/255.0 green:129/255.0 blue:70/255.0 alpha:1]
@interface ViewController (){
    dispatch_queue_t backgroundQueue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSerialTaskButtonTapped:(id)sender {
    backgroundQueue = dispatch_queue_create("Global", nil);
        [self allTasks];
    
    
}

- (IBAction)btnConcurrentTaskTapped:(id)sender {
    backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        [self allTasksParallel];
    
}

- (IBAction)btnResetAllTapped:(id)sender {
    self.lblCount1.text = @"0";
    self.lblCount2.text = @"0";
    self.lblCount3.text = @"0";
    self.lblCount4.text = @"0";
    self.lblCount5.text = @"0";
    [self.lblCount1 setBackgroundColor:kColorRed];
    [self.lblCount2 setBackgroundColor:kColorRed];
    [self.lblCount3 setBackgroundColor:kColorRed];
    [self.lblCount4 setBackgroundColor:kColorRed];
    [self.lblCount5 setBackgroundColor:kColorRed];
}
- (void)allTasks{
    
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTask]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount1.text = @"1";
                [self.lblCount1 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTask]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount2.text = @"1";
                [self.lblCount2 setBackgroundColor:kColorGreen];
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTask]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount3.text = @"1";
                [self.lblCount3 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTask]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount4.text = @"1";
                [self.lblCount4 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTask]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount5.text = @"1";
                [self.lblCount5 setBackgroundColor:kColorGreen];
                
            });
        }
    });

    
}

- (void)allTasksParallel{
    
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTaskParallel]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount1.text = @"1";
                [self.lblCount1 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTaskParallel]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount2.text = @"1";
                [self.lblCount2 setBackgroundColor:kColorGreen];
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTaskParallel]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount3.text = @"1";
                [self.lblCount3 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTaskParallel]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount4.text = @"1";
                [self.lblCount4 setBackgroundColor:kColorGreen];
                
            });
        }
    });
    dispatch_async(backgroundQueue, ^{
        if ([self timeConsumingTaskParallel]) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.lblCount5.text = @"1";
                [self.lblCount5 setBackgroundColor:kColorGreen];
                
            });
        }
    });


 

 
    
    
    
}
static NSInteger constant =19999;

- (BOOL)timeConsumingTask{
    BOOL sucess =YES;
    
    ////////Time Consuming Task/////////////
    NSInteger idx =0;
        for (idx = 0; idx<constant; idx++) {
    NSLog(@"%ld",(long)idx);
    
        }
    
    return sucess;
}
- (BOOL)timeConsumingTaskParallel{
    BOOL sucess =YES;
    
    ////////Time Consuming Task/////////////
    dispatch_apply(constant, backgroundQueue, ^(size_t idx) {
                NSLog(@"%ld",(long)idx);
    
            });
    
    
    return sucess;
}
@end
