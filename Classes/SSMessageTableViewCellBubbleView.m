//
//  SSMessageTableViewCellBubbleView.m
//  Messages
//
//  Created by Sam Soffes on 3/10/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

#import "SSMessageTableViewCellBubbleView.h"

#define kFont [UIFont systemFontOfSize:15.0]
static UILineBreakMode kLineBreakMode = UILineBreakModeWordWrap;
static CGFloat kMaxWidth = 223.0f; // TODO: Make dynamic
static CGFloat kPaddingTop = 4.0f;
static CGFloat kPaddingBottom = 8.0f;
static CGFloat kMarginTop = 2.0f;
static CGFloat kMarginBottom = 2.0f;

@implementation SSMessageTableViewCellBubbleView

@synthesize messageText = _messageText;
@synthesize leftBackgroundImage = _leftBackgroundImage;
@synthesize rightBackgroundImage = _rightBackgroundImage;
@synthesize messageStyle = _messageStyle;

#pragma mark Class Methods

+ (CGSize)textSizeForText:(NSString *)text {
	CGSize maxSize = CGSizeMake(kMaxWidth - 35.0f, 1000.0f);
	return [text sizeWithFont:kFont constrainedToSize:maxSize lineBreakMode:kLineBreakMode];
}


+ (CGSize)bubbleSizeForText:(NSString *)text {
	CGSize textSize = [self textSizeForText:text];
	return CGSizeMake(textSize.width + 35.0f, textSize.height + kPaddingTop + kPaddingBottom);
}


+ (CGFloat)cellHeightForText:(NSString *)text {
	return [self bubbleSizeForText:text].height + kMarginTop + kMarginBottom;
}


#pragma mark NSObject

- (void)dealloc {
	[_messageText release];
	[_leftBackgroundImage release];
	[_rightBackgroundImage release];
	[super dealloc];
}


#pragma mark UIView

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
	}
	return self;
}


- (void)drawRect:(CGRect)frame {
	UIImage *bubbleImage = _messageStyle == SSMessageStyleLeft ? _leftBackgroundImage : _rightBackgroundImage;
	CGSize bubbleSize = [[self class] bubbleSizeForText:_messageText];
	CGRect bubbleFrame = CGRectMake((_messageStyle == SSMessageStyleRight ? self.frame.size.width - bubbleSize.width : 0.0f), kMarginTop, bubbleSize.width, bubbleSize.height);
	[bubbleImage drawInRect:bubbleFrame];
	
	CGSize textSize = [[self class] textSizeForText:_messageText];
	CGFloat textX = (CGFloat)bubbleImage.leftCapWidth - 3.0f + ((_messageStyle == SSMessageStyleRight) ? bubbleFrame.origin.x : 0.0f);
	CGRect textFrame = CGRectMake(textX, kPaddingTop + kMarginTop, textSize.width, textSize.height);
	[_messageText drawInRect:textFrame withFont:kFont lineBreakMode:kLineBreakMode alignment:(_messageStyle == SSMessageStyleRight) ? UITextAlignmentRight : UITextAlignmentLeft];
}

@end
