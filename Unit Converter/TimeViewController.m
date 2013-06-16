//
//  TimeViewController.m
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Time"];
        
        // Set background image.
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image460x320.jpg"]];
    }
    return self;
}

// Call the needed methods if needed [showTime]
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[self view] setBackgroundColor:[UIColor redColor]];
    
    // Clear the textField, the X button
    userInputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

// Set variables to nil if needed [timeLabel]
- (void)viewDidUnload
{
    [super viewDidUnload];
}


// Only allow numbers in the text field.
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Limit the user input to only 9 characters
    NSUInteger newLength = [userInputTextField.text length] + [string length] - range.length;
    return (newLength > 9) ? NO : YES;
}

- (IBAction)hideBar:(id)sender {
}

- (IBAction)showBar:(id)sender {
}

- (IBAction)showResult:(id)sender
{
    // Activity indicator start animation
    [activityIndicator startAnimating];
    
    // Display the result
    NSString *str = [userInputTextField text];
    double value = [str doubleValue];
    [resultField setFont:[UIFont systemFontOfSize:18]];
    [resultField setText:[NSString stringWithFormat:@"%.3f s = %.3f ms!", value, (value * 1000)]];
    
    // Activity indicator stop animation
    [activityIndicator stopAnimating];
}

// Remove the keyboard after entering the input.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

// Customize the behavior of the userInputTextField.
// The method is called just before the text field becomes active
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    // Change the background color of the text field indicating active text field.
    [textField setBackgroundColor:[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f]];
    return YES;
}

// The method is called after the text field becomes active.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSLog(@"textFieldShouldBeginEditing");
}

// The method is called just before the text field becomes inactive
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldEndEditing");
    
    // Change the background color of the text field indicating inactive textField.
    [textField setBackgroundColor:[UIColor whiteColor]];
    return YES;
}

// The method is called after the text field becomes inactive.
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSLog(@"textFieldShouldEndEditing");
}

// The method is called when the user presses the clear button inside the text field.
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"textFieldShouldClear:");
    return YES;
}

// The method is called when the user presses the return key on the keyboard.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
	//Clear the first responder
	[userInputTextField resignFirstResponder];
}

// Hide/Show tabBarController method implementations

- (IBAction)showButton:(id)sender
{
    [self showTabBar:self.tabBarController];
}

- (IBAction)hideButton:(id)sender
{
    [self hideTabBar:self.tabBarController];
}

- (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
        }
    }
    
    [UIView commitAnimations];
}

- (void)showTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
    }
    
    [UIView commitAnimations];
}

@end
