//
//  FacebookViewController.m
//  RealToReel
//
//  Created by Will Chilcutt on 5/20/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "FacebookViewController.h"

@implementation FacebookViewController
@synthesize backButton;
@synthesize forwardButton;
@synthesize homeButton;
@synthesize facebookWebView;

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
    NSURL *facebookURL = [NSURL URLWithString:@"https://m.facebook.com/profile.php?v=feed&id=131030210325&_rdr"];
    
    [facebookWebView setDelegate:self];
    
    [facebookWebView loadRequest:[NSURLRequest requestWithURL:facebookURL]];
	// Do any additional setup after loading the view.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!facebookWebView.canGoBack) 
    {
        backButton.alpha = .5;
        backButton.enabled = NO;
    }
    else 
    {
        backButton.alpha = 1;
        backButton.enabled = YES;
    }
    if (!facebookWebView.canGoForward) 
    {
        forwardButton.alpha = .5;
        forwardButton.enabled = NO;
    }
    else 
    {
        forwardButton.alpha = 1;
        forwardButton.enabled = YES;
    }
}

- (IBAction)goBack:(id)sender 
{
    [facebookWebView goBack];
}

- (IBAction)goForward:(id)sender 
{
    [facebookWebView goForward];
}
- (IBAction)goHome:(id)sender 
{
    [facebookWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.facebook.com/profile.php?v=feed&id=131030210325&_rdr"]]];
}

- (void)viewDidUnload
{
    [self setFacebookWebView:nil];
    [self setBackButton:nil];
    [self setForwardButton:nil];
    [self setHomeButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
