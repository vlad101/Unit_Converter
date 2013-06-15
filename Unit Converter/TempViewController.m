//
//  TempViewController.m
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "TempViewController.h"

@implementation TempViewController

@synthesize userInput;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Temperature"];
        
        // Create an image
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor redColor]];
    // Do any additional setup after loading the view from its nib.
}

// Call the needed methods if needed [showTime]
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

// Set variables to nil if needed [timeLabel]
- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end
