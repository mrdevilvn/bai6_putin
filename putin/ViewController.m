//
//  ViewController.m
//  putin
//
//  Created by MrSharko on 9/21/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import "ViewController.h"
#import "Words.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadPutinFile:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *words = [content componentsSeparatedByString:@" "];
    NSCountedSet *wordCounter = [[NSCountedSet alloc] initWithArray:words];
    
    NSMutableArray *sortArray = [NSMutableArray array];
    for (id object in wordCounter) {
        [sortArray addObject:object];
    }

    // sort by alpha beta
    NSArray *array = [sortArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@", array);



}
- (IBAction)sortByShowCount:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *words = [content componentsSeparatedByString:@" "];
    NSCountedSet *wordCounter = [[NSCountedSet alloc] initWithArray:words];
    
    // sort by count
    NSMutableArray *sortCounted = [NSMutableArray arrayWithCapacity:[wordCounter count]];
    [wordCounter enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [sortCounted addObject:[[Words alloc] initWithKey:obj showCount:[wordCounter countForObject:obj]]];
    }];
    [sortCounted sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"showCount" ascending:YES]]];
    
    for ( id object in sortCounted)
    {
        NSLog(@"%@", [object description]);
    }
}
@end
