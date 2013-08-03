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
    NSMutableArray *diskList;
}

@property (assign) IBOutlet NSWindow *window;

@end
