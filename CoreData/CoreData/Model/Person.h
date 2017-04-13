//
//  Person.h
//  CoreData
//
//  Created by LDY on 17/4/12.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import <Foundation/Foundation.h>




/*测试userDefault <NSCoding>*/
//[User Defaults] Attempt to set a non-property-list




@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)int age;

@property(nonatomic,assign)float height;

@end
