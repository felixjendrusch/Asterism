//
//  ASTFind.m
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFind.h"

OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    NSUInteger index = [array indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];

    return index == NSNotFound ? nil : array[index];
}

OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id, NSUInteger))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(block != nil);

    NSUInteger index = [array indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj, idx);
    }];

    return index == NSNotFound ? nil : array[index];
}

OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    for (id key in dict) {
        id value = dict[key];

        if (block(value)) return value;
    }

    return nil;
}

OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id, id))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(block != nil);

    for (id key in dict) {
        id value = dict[key];

        if (block(key, value)) return value;
    }

    return nil;
}

OVERLOADABLE id ASTFind(id<NSFastEnumeration> collection, BOOL(^block)(id obj))
{
    NSCParameterAssert(collection != nil);
    NSCParameterAssert(block != nil);

    for (id obj in collection) {
        if (block(obj)) return obj;
    }

    return nil;
}
