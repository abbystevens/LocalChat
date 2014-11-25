//
//  ViewController.h
//  LocalChat
//
//  Created by Abby Stevens on 11/20/14.
//  Copyright (c) 2014 Abby Stevens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> 

@property (strong, nonatomic) IBOutlet UIView *chatEntryView;
@property (weak, nonatomic) IBOutlet UITextField *chatText;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextView *chatTextView;

@end

