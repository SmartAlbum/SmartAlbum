//
//  SADataCenter.h
//  SmartAlbum
//
//  Created by JessieYong on 15/11/19.
//  Copyright © 2015年 JessieYong. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SADataCenter;

@protocol SADataCenterDelegate <NSObject>
@optional

- (void)dataCenter:(SADataCenter *)dataCenter load:(id)data error:(NSError *)err;
- (void)loadComplete;
@end


@interface SADataCenter : NSObject

@property (nonatomic, weak) id <SADataCenterDelegate> delegate;
@end
