//
//  UserInfo+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/20.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "UserInfo+CoreDataProperties.h"

@implementation UserInfo (CoreDataProperties)

+ (NSFetchRequest<UserInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserInfo"];
}

@dynamic attrAdded;
@dynamic birthday;
@dynamic icon;
@dynamic title;

@end
