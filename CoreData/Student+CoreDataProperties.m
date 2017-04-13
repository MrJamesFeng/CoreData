//
//  Student+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic age;
@dynamic classes;
@dynamic name;
@dynamic studentToClass;

@end
