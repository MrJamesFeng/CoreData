//
//  School+CoreDataProperties.m
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "School+CoreDataProperties.h"

@implementation School (CoreDataProperties)

+ (NSFetchRequest<School *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"School"];
}

@dynamic name;
@dynamic shcoolToGrad;

@end
