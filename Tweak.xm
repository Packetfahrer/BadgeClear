#import <SpringBoard/SBIcon.h>

BOOL allowLaunch;

@interface SBIcon (BadgeClear)
- (void)setBadge:(id)arg1;
@end
%hook SBApplicationIcon
- (void)launch {
	if (allowLaunch) {
		%orig;
	} else {
		UIAlertView *launchView = [[UIAlertView alloc] initWithTitle:@"Badge Clear or Launch?" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Clear", @"Launch", nil];
		[launchView show];
		[launchView release];
	}
}
%new(v@:@@)
- (void)alertView:(UIAlertView *)alert didDismissWithButtonIndex:(NSInteger)button {
	if (button == 1) {
		[self setBadge:nil];
	}
	if (button == 2) {
		allowLaunch = YES;
		[self launch];
	}
}
%end