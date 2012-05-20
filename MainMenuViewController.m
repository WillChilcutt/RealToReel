//
//  MainMenuViewController.m
//  RealToReel
//
//  Created by Will Chilcutt on 5/20/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AppDelegate.h"
#import <Twitter/Twitter.h>

@implementation MainMenuViewController
@synthesize showTimesButton;
@synthesize reelDealsButton;
@synthesize facebookButton;
@synthesize tweetButton;
@synthesize callUsButton;
@synthesize websiteButton;

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
    [self setShowTimesButton:nil];
    [self setReelDealsButton:nil];
    [self setFacebookButton:nil];
    [self setTweetButton:nil];
    [self setCallUsButton:nil];
    [self setWebsiteButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)openFacebook:(id)sender 
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.chosenURL =@"https://m.facebook.com/profile.php?v=feed&id=131030210325&_rdr";
    
    [self performSegueWithIdentifier:@"menuToWebSegue" sender:self];
}

- (IBAction)openShowTimes:(id)sender 
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.chosenURL = @"http://mobile.fandango.com/THEATER_DETAILS?from=th_alltheaters&aid=THEATERNAME&ftheaterid=AANSE&ftms=true";
    
    [self performSegueWithIdentifier:@"menuToWebSegue" sender:self];
}
- (IBAction)openWebsite:(id)sender 
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.chosenURL = @"http://www.realtoreeltheater.com/";
    
    [self performSegueWithIdentifier:@"menuToWebSegue" sender:self];
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
- (IBAction)callUS:(id)sender 
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:423-282-2131"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
