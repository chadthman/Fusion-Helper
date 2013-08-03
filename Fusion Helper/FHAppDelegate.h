//
//  FHAppDelegate.h
//  Fusion Helper
//
//  Created by Chad Marmon on 8/2/13.
//  Copyright (c) 2013 Chad Marmon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FHAppDelegate : NSObject <NSApplicationDelegate>
{
    NSMutableDictionary *diskList;
    NSMutableDictionary *fusionList;
    NSScrollView *diskScrollView;
}

@property (assign) IBOutlet NSWindow *window;

@end
