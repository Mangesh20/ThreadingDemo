//
//  ViewController.h
//  ThreadingDemo
//
//  Created by Mangesh Tekale on 09/02/15.
//  Copyright (c) 2015 ComedyMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblCount1;
@property (weak, nonatomic) IBOutlet UILabel *lblCount2;
@property (weak, nonatomic) IBOutlet UILabel *lblCount3;
@property (weak, nonatomic) IBOutlet UILabel *lblCount4;
@property (weak, nonatomic) IBOutlet UILabel *lblCount5;
- (IBAction)btnSerialTaskButtonTapped:(id)sender;
- (IBAction)btnConcurrentTaskTapped:(id)sender;
@end

