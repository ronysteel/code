//
//  ViewController.h
//  BNRandomPasswordObjC
//
//  Created by Lee Choon Siong on 2017/09/17.
//  Copyright © 2017 Lee Choon Siong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (nonatomic, weak) IBOutlet NSTextField *textField;

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;

@end

