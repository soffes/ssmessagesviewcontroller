//
//  SSMessageTableViewCellBubbleView.h
//  Messages
//
//  Created by Sam Soffes on 3/10/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

#import "SSMessageTableViewCell.h"

@interface SSMessageTableViewCellBubbleView : UIView {

@private
	
	NSString *_messageText;
	UIImage *_leftBackgroundImage;
	UIImage *_rightBackgroundImage;
	SSMessageStyle _messageStyle;
}

@property (nonatomic, copy) NSString *messageText;
@property (nonatomic, retain) UIImage *leftBackgroundImage;
@property (nonatomic, retain) UIImage *rightBackgroundImage;
@property (nonatomic, assign) SSMessageStyle messageStyle;

+ (CGSize)textSizeForText:(NSString *)text;
+ (CGSize)bubbleSizeForText:(NSString *)text;
+ (CGFloat)cellHeightForText:(NSString *)text;

@end
