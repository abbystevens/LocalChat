//
//  ViewController.m
//  LocalChat
//
//  Created by Abby Stevens on 11/20/14.
//  Copyright (c) 2014 Abby Stevens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter]  addObserver:self
                                              selector:@selector(keyboardWasShown:)
                                                  name:UIKeyboardDidShowNotification
                                                object:nil];
    
    
    [[NSNotificationCenter defaultCenter]  addObserver:self
                                              selector:@selector(keyboardWillHide:)
                                                  name:UIKeyboardWillHideNotification
                                                object:nil];
    
    //Adding a tap gesture recognizer so if someone taps the screeen, it will hide the keyboard.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    //set the number of taps required to initiate the action.
    tap.numberOfTapsRequired = 1;
    
    //Add this gesture recognizer to our views list of recognizers.
    [self.view addGestureRecognizer:tap];
    
}

-(void) keyboardWasShown:(NSNotification *)notification {
    //Get the size of the keyboard so we know how far to move.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Move our view with a smooth animation subtracting the keyboard height.
    [UIView animateWithDuration: .2 animations:^{
        self.chatEntryView.center = CGPointMake(self.chatEntryView.center.x, self.chatEntryView.center.y - keyboardSize.height);
    }];
    
}

-(void) keyboardWillHide:(NSNotification *)notification {
    
    //Get the size of the keyboard so we know how far to move.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Move our view with a smooth animation adding the keyboard height.
    [UIView animateWithDuration:.3 animations:^{
        self.chatEntryView.center = CGPointMake(self.chatEntryView.center.x, self.chatEntryView.center.y + keyboardSize.height);
    }];
    
}

-(void) hideKeyboard {
    //Function that will hide the keyboard.
    [self.chatText resignFirstResponder];
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    [self hideKeyboard];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
