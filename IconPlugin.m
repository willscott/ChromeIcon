//
//  IconPlugin.m
//  ChromeIcon
//
//  Created by Will Scott on 10/4/10.
//  Copyright 2010. All rights reserved.
//

#import "IconPlugin.h"
#import "JRSwizzle.h"


@interface NSWorkspace (Hacked)
-(NSImage *)Hacked_iconForFile:(NSString *)param;
@end

@implementation NSWorkspace (Hacked)
-(NSImage *)Hacked_iconForFile: (NSString*)param
{
	NSString* appPath = [[NSBundle mainBundle] bundlePath];
	if ([param isEqualToString:appPath]) {
		return [NSApp applicationIconImage];
	}
	return [self Hacked_iconForFile:param];
}
@end

@implementation IconPlugin

/**
 * The special load method.
 */
+ (void) load
{
	NSLog(@"Loaded ChromeIcon");
	NSError *error = nil;
	[NSWorkspace jr_swizzleMethod:@selector(iconForFile:)
					   withMethod:@selector(Hacked_iconForFile:)
							error:&error];

	// Do the initial icon change.
	NSString *pref = [[NSUserDefaults standardUserDefaults] stringForKey:@"CustomIcon"];
	if (pref != nil) {
		NSImage *img = [[NSImage alloc] initWithContentsOfFile: pref];
		if (img != nil) {
			[NSApp setApplicationIconImage:img];
		}
		[img release];
	}
}
@end
