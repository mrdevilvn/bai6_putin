//
//  Words.h
//  putin
//
//  Created by MrSharko on 9/21/13.
//  Copyright (c) 2013 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Words : NSObject
@property(nonatomic, strong) id key;
@property(nonatomic, assign) int showCount;
- (id)initWithKey:(id)key showCount:(int)count;
- (id) getKey;
@end
