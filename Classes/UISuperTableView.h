//
//  UISuperTableView.h
//  uisupertableview
//
//  Created by Apirom Na Nakorn on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UISuperTableView : UITableView {
	BOOL isLoading;
}

@property (nonatomic, retain) UIActivityIndicatorView *loadingIcon;
@property (nonatomic, retain) NSString *emptyLabelText;
@property (nonatomic, retain) UILabel *emptyLabel;

- (void) startLoading;
- (void) stopLoading;
- (void) updateEmptyLabel;

@end
