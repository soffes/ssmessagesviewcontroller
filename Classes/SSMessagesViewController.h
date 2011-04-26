//
//  SSMessagesViewController.h
//  Messages
//
//  Created by Sam Soffes on 3/10/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//
//	This is an abstract class for displaying a UI similar to Apple's SMS application. A subclass should override the
//  messageStyleForRowAtIndexPath: and textForRowAtIndexPath: to customize this class.
//

#import "SSMessageTableViewCell.h"

@class SSTextField;

@interface SSMessagesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate> {

@private
	
	UITableView *_tableView;
	UIImageView *_inputBackgroundView;
	SSTextField *_textField;
	UIButton *_sendButton;
	
	UIImage *_leftBackgroundImage;
	UIImage *_rightBackgroundImage;
}

@property (nonatomic, retain, readonly) UITableView *tableView;
@property (nonatomic, retain, readonly) UIImageView *inputBackgroundView;
@property (nonatomic, retain, readonly) SSTextField *textField;
@property (nonatomic, retain, readonly) UIButton *sendButton;
@property (nonatomic, retain) UIImage *leftBackgroundImage;
@property (nonatomic, retain) UIImage *rightBackgroundImage;

- (SSMessageStyle)messageStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
