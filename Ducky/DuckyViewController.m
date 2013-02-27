//
//  DuckyViewController.m
//  Ducky
//
//  Created by R Bourgonje on 25-02-13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DuckyViewController.h"
#import <AudioToolbox/AudioToolbox.h> 
#import <AVFoundation//AVFoundation.h> 

@interface DuckyViewController (){
    
    AVAudioPlayer *backgroundAudioPlayer;
    //SystemSoundID *bleebSoundID;
    
}
@end

@implementation DuckyViewController
@synthesize pinch;
@synthesize tap;
@synthesize kwaakKnop;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"kwaak" ofType:@"aif"];
    
    
    
    if (filepath != nil){
        NSURL *backgroundURL = [NSURL fileURLWithPath:filepath]; 
        
        if(backgroundURL != nil){
            backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundURL error:nil];
            backgroundAudioPlayer.numberOfLoops = 0;
            [backgroundAudioPlayer prepareToPlay];
        }
        else {
            NSLog(@"backgroundURL is nil");
        }
        
        //NSLog(@"%@",filepath); 
    }
    else {
        NSLog(@"filepath is nil");
    }
    

    
    //NSURL *bleebSoundID = [NSURL fileURLWithPath:[[[[NSBundle mainBundle]pathForResource:@"bleep" ofType:@"aif"]];
    
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
    [backgroundAudioPlayer play];
}

- (IBAction)KwaakOnPinch:(UIPinchGestureRecognizer *)sender {
    NSLog(@"Au!");
}

- (IBAction)KwaakNu:(UIButton *)sender {
    
    NSLog(@"Kwaak! (via knop)");
    [backgroundAudioPlayer play];

}

//implementing the motion detection

-(BOOL) canBecomeFirstResponder{
    return YES;
}

-(void) viewDidAppear:(BOOL)animated{
    [self becomeFirstResponder];
}

-(void) viewDidDisappear:(BOOL)animated{
    [self resignFirstResponder];
    
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.subtype == UIEventSubtypeMotionShake){
        NSLog(@"I'm shacky...!");
        [backgroundAudioPlayer play];
    }
}
@end
