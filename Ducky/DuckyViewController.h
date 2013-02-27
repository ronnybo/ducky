//
//  DuckyViewController.h
//  Ducky
//
//  Created by R Bourgonje on 25-02-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DuckyViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITapGestureRecognizer *tap;
@property (retain, nonatomic) IBOutlet UIButton *kwaakKnop;
@property (retain, nonatomic) IBOutlet UIPinchGestureRecognizer *pinch;

- (IBAction)KwaakOnTouch:(UITapGestureRecognizer *)sender;

- (IBAction)KwaakOnPinch:(UIPinchGestureRecognizer *)sender;

- (IBAction)KwaakNu:(UIButton *)sender;
@end
