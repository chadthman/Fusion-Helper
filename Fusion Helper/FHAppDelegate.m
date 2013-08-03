//
//  FHAppDelegate.m
//  Fusion Helper
//
//  Created by Chad Marmon on 8/2/13.
//  Copyright (c) 2013 Chad Marmon. All rights reserved.
//

#import "FHAppDelegate.h"

@implementation FHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString* filename = [self getFilename];
    NSData *data = [self runCommand:@"/usr/sbin/diskutil" withArguments:[NSArray arrayWithObjects:@"list", @"-plist", nil]];
    [data writeToFile:filename atomically:YES];

    diskList = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    
    data = [self runCommand:@"/usr/sbin/diskutil" withArguments:[NSArray arrayWithObjects:@"cs", @"list", @"-plist", nil]];
    [data writeToFile:filename atomically:YES];
    
    fusionList = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"something");
    // Insert code here to initialize your application
}

-(NSString*)getFilename
{
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* filename;
    do
    {
        filename = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%i.plist", rand()]];
    } while ([fm fileExistsAtPath:filename]);
    return filename;
}

-(NSData*)runCommand:(NSString*)command withArguments:(NSArray*)arguments
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath:command];
    
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog(@"%@", string);
    
    return data;
}

@end
