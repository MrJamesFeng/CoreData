//
//  Teacher+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Teacher+CoreDataProperties.h"

@implementation Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Teacher"];
}

@dynamic course;
@dynamic name;
@dynamic teacherToClass;
-(void)awakeFromFetch{
    [super awakeFromFetch];
}

-(void)awakeFromInsert{
    [super awakeFromInsert];
    
}

@end
