//
//  SADataCenter.m
//  SmartAlbum
//
//  Created by JessieYong on 15/11/19.
//  Copyright © 2015年 JessieYong. All rights reserved.
//

#import "SADataCenter.h"
#import <Photos/PHFetchOptions.h>
#import <Photos/PHFetchResult.h>
#import <Photos/PHAsset.h>
#import <Photos/PHImageManager.h>
#import <Photos/PHCollection.h>

typedef void (^VoidBlock)(void);
@interface SADataCenter ()

@property (nonatomic, strong) dispatch_queue_t dataCenterQueue;
@property (nonatomic, strong) NSMutableArray *fetchArray;


@end

@implementation SADataCenter

- (instancetype)init {
    self = [super init];
    if (self) {
        // 自定义dispatch_queue_t
        _dataCenterQueue = dispatch_queue_create("smartAlbum", NULL);
    }
    return self;
}


- (void)getAllImages {
    if (NSClassFromString(@"PHFetchResult")) {
        PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
        PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
        if ([fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage] > 0) {
            [fetchResult enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL *stop) {
                NSLog(@"asset %@", asset);
            }];
        }
    }
    else {
        //版本低于iOS8啦
    }
}

- (void)getAllAlbums {
    if (NSClassFromString(@"PHFetchResult")) {
        PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
        PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:fetchOptions];
        [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
            NSLog(@"album title %@", collection.localizedTitle);
        }];
    }
    else {
        //更新去吧
    }
}

@end
