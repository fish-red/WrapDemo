//
//  LabelShrinkWrappingSuperview.m
//  WrapDemo
//
//  Created by Jonathon Mah on 2014-07-06.
//  This is free and unencumbered software released into the public domain.
//

#import "LabelShrinkWrappingSuperview.h"


@implementation LabelShrinkWrappingSuperview

- (void)layoutSubviews
{
	NSLayoutConstraint *labelAsWideAsPossibleConstraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:0 multiplier:1.0 constant:1e8];
	labelAsWideAsPossibleConstraint.priority = [self.label contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal];
	[self.label addConstraint:labelAsWideAsPossibleConstraint];

	[super layoutSubviews];

	CGFloat availableLabelWidth = self.label.frame.size.width;
	self.label.preferredMaxLayoutWidth = availableLabelWidth;
	[self.label removeConstraint:labelAsWideAsPossibleConstraint];

	[super layoutSubviews];
}

@end
