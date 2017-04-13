//
//  ClassRoom+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "ClassRoom+CoreDataProperties.h"

@implementation ClassRoom (CoreDataProperties)

+ (NSFetchRequest<ClassRoom *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ClassRoom"];
}

@dynamic no;
@dynamic classToheadmaster;
@dynamic classToStudent;
@dynamic classToTeacher;

@end
