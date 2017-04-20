//
//  Student1+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/20.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Student1+CoreDataProperties.h"

@implementation Student1 (CoreDataProperties)

+ (NSFetchRequest<Student1 *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student1"];
}

@dynamic age;
@dynamic classes;
@dynamic icon;
@dynamic name;
@dynamic addAttribute;
@dynamic studentToClass;

@end
