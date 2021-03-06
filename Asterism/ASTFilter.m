//
//  ASTFilter.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFilter.h"

OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    NSIndexSet *indexes = [array indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];

    return [array objectsAtIndexes:indexes];
}

OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    NSIndexSet *indexes = [array indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj, idx);
    }];

    return [array objectsAtIndexes:indexes];
}

OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    NSSet *keys = [dict keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
        return block(obj);
    }];

    return [dict dictionaryWithValuesForKeys:keys.allObjects];
}

OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id, id))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    NSSet *keys = [dict keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
        return block(key, obj);
    }];

    return [dict dictionaryWithValuesForKeys:keys.allObjects];
}

OVERLOADABLE NSSet *ASTFilter(NSSet *set, BOOL(^block)(id))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(block != nil);

    return [set objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        return block(obj);
    }];
}
