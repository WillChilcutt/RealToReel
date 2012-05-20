//
//  MainMenuViewController.m
//  RealToReel
//
//  Created by Will Chilcutt on 5/20/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "MainMenuViewController.h"
#import <Twitter/Twitter.h>

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (IBAction)tweet:(id)sender 
{
    if ([TWTweetComposeViewController canSendTweet]) 
    {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc]init];
        [tweetSheet setInitialText:@"I'm going to see a movie at the Real To Real Theater! #realtoreel"];
        [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self 
                                  cancelButtonTitle:@"OK" 
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
