//
//  WebViewController.m
//  RealToReel
//
//  Created by Will Chilcutt on 5/20/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "WebViewController.h"
#import "AppDelegate.h"

@implementation WebViewController
@synthesize backButton = _backButton;
@synthesize forwardButton = _forwardButton;
@synthesize webPageView = _webPageView;
@synthesize homeButton = _homeButton;

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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.webPageView setDelegate:self];
    
    [self.webPageView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.chosenURL]]];
    
	// Do any additional setup after loading the view.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!self.webPageView.canGoBack) 
    {
        self.backButton.alpha = .5;
        self.backButton.enabled = NO;
    }
    else 
    {
        self.backButton.alpha = 1;
        self.backButton.enabled = YES;
    }
    if (!self.webPageView.canGoForward) 
    {
        self.forwardButton.alpha = .5;
        self.forwardButton.enabled = NO;
    }
    else 
    {
        self.forwardButton.alpha = 1;
        self.forwardButton.enabled = YES;
    }
}

- (IBAction)goBack:(id)sender 
{
    [self.webPageView goBack];
}

- (IBAction)goForward:(id)sender 
{
    [self.webPageView goForward];
}
- (IBAction)goHome:(id)sender 
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [self.webPageView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.chosenURL]]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
