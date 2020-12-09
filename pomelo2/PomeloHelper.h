//
//  PomeloHelper.h
//  pomelo2
//
//  Created by 谢华 on 12/9/20.
//  Copyright © 2020 谢华. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^requestBack)(NSString *);
typedef void (^inputData)(NSString *);
@interface PomeloHelper : NSObject

+ (void)connectServerWithaccesstoken:(NSString *)accessToken refreshToken:(NSString *)refreshToken userID:(NSString *)userID reqeustBack:(nonnull requestBack)requestBack inputData:(nonnull inputData)inputData;

@end

NS_ASSUME_NONNULL_END
