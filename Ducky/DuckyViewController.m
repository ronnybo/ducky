//
//  DuckyViewController.m
//  Ducky
//
//  Created by R Bourgonje on 25-02-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DuckyViewController.h"

@interface DuckyViewController ()

@end

@implementation DuckyViewController
@synthesize pinch;
@synthesize tap;
@synthesize kwaakKnop;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTap:nil];
    [self setKwaakKnop:nil];
    [self setPinch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [tap release];
    [kwaakKnop release];
    [pinch release];
    [super dealloc];
}
- (IBAction)KwaakOnTouch:(UITapGestureRecognizer *)sender {
    NSLog(@"Kwaak! (via touch)");
}

- (IBAction)KwaakOnPinch:(UIPinchGestureRecognizer *)sender {
    NSLog(@"Au!");
}

- (IBAction)KwaakNu:(UIButton *)sender {
    
    NSLog(@"Kwaak! (via knop)");
}
@end
