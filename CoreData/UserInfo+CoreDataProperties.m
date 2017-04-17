//
//  UserInfo+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/17.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "UserInfo+CoreDataProperties.h"

@implementation UserInfo (CoreDataProperties)

+ (NSFetchRequest<UserInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserInfo"];
}

@dynamic icon;
@dynamic title;
@dynamic birthday;
@dynamic attrAdded;//新增

@end
