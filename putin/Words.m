//
//  Words.m
//  putin
//
//  Created by MrSharko on 9/21/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import "Words.h"

@implementation Words
- (id)initWithKey:(id)key showCount:(int)count;
{
    if((self = [super init])) {
        _key = key;
        _showCount = count;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@,%d)", _key, _showCount];
}

- (id)getKey
{
    return _key;
}
@end
