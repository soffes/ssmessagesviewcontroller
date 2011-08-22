//
//  SSMessageTableViewCell.m
//  Messages
//
//  Created by Sam Soffes on 3/10/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

#import "SSMessageTableViewCell.h"
#import "SSMessageTableViewCellBubbleView.h"

@implementation SSMessageTableViewCell

#pragma mark NSObject

- (void)dealloc {
	[_bubbleView release];
	[super dealloc];
}


#pragma mark UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;		
		self.textLabel.hidden = YES;
				
		_bubbleView = [[SSMessageTableViewCellBubbleView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.contentView.frame.size.width, self.contentView.frame.size.height)];
		_bubbleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self.contentView addSubview:_bubbleView];
		[self.contentView sendSubviewToBack:_bubbleView];
    }
    return self;
}


#pragma mark Getters

- (SSMessageStyle)messageStyle {
	return _bubbleView.messageStyle;
}


- (NSString *)messageText {
	return _bubbleView.messageText;
}


#pragma mark Setters

- (void)setMessageStyle:(SSMessageStyle)aMessageStyle {
	_bubbleView.messageStyle = aMessageStyle;
  [_bubbleView setNeedsDisplay];
}


- (void)setMessageText:(NSString *)text {
	_bubbleView.messageText = text;
  [_bubbleView setNeedsDisplay];
}


- (void)setBackgroundImage:(UIImage *)backgroundImage forMessageStyle:(SSMessageStyle)messsageStyle {
	if (messsageStyle == SSMessageStyleLeft) {
		_bubbleView.leftBackgroundImage = backgroundImage;
	} else if (messsageStyle == SSMessageStyleRight) {
		_bubbleView.rightBackgroundImage = backgroundImage;
	}
}
@end
