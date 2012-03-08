//
//  UISuperTableView.m
//  uisupertableview
//
//  Created by Apirom Na Nakorn on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UISuperTableView.h"


@implementation UISuperTableView

@synthesize emptyLabelText;
@synthesize emptyLabel;
@synthesize loadingIcon;

- (void) layoutSubviews
{
	[super layoutSubviews];
	
	if (isLoading) {
		for (UIView *child in [self subviews]) {
			if (self.loadingIcon == child) continue;
			child.hidden = YES;
		}
		
		self.scrollEnabled = NO;
		[self setContentOffset:CGPointMake(0,0) animated:NO];
	} else {
		self.scrollEnabled = YES;
	}
}


- (void) reloadData
{
	[super reloadData];
	[self updateEmptyLabel];
}

- (void) updateEmptyLabel
{
	if (self.emptyLabel == nil) {
		
		self.emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.4 * (self.frame.size.height - 30), self.frame.size.width, 30)];
		self.emptyLabel.textAlignment = UITextAlignmentCenter;
		self.emptyLabel.text = (self.emptyLabelText == nil) ? @"No Data" : self.emptyLabelText;
		
		[self addSubview:self.emptyLabel];
	}
	
	
	if ([self numberOfSections] == 1 && [self numberOfRowsInSection:0] == 0) {
		self.emptyLabel.hidden = NO;
	} else {
		self.emptyLabel.hidden = YES;
	}	
}


- (void) startLoading
{
	for (UIView *child in [self subviews]) {
		child.hidden = YES;
	}
	
	if (self.loadingIcon == nil) {
		
		self.loadingIcon = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		
		CGRect loadingIconFrame = self.loadingIcon.frame;
		loadingIconFrame.origin.x = 0.5 * (self.frame.size.width - loadingIconFrame.size.width);
		loadingIconFrame.origin.y = 0.5 * (self.frame.size.height - loadingIconFrame.size.height);
		self.loadingIcon.frame = loadingIconFrame;
		
		[self addSubview:self.loadingIcon];
	}
	
	self.loadingIcon.hidden = NO;
	[self.loadingIcon startAnimating];
	
	isLoading = YES;

}

- (void) stopLoading
{
	for (UIView *child in [self subviews]) {
		child.hidden = NO;
	}
	
	if (self.loadingIcon == nil) return;
	
	self.loadingIcon.hidden = YES;
	[self.loadingIcon stopAnimating];
	
	isLoading = NO;
	
	[self layoutSubviews];
	[self updateEmptyLabel];
}



- (void) dealloc
{
	[self stopLoading];
	
	self.loadingIcon = nil;
	self.emptyLabel = nil;
	
	[super dealloc];
}

@end
