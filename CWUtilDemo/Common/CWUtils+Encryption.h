//
//  CWUtils+Encryption.h
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWUtils.h"

@interface CWUtils (Encryption)

/**
 使用默认密码对data进行256位AES加密

 @param data 要加密的数据
 @return 返回加密后的数据
 */
+ (NSData *)AES256EncryptData:(NSData *)data;

/**
 使用默认密码对data进行256位AES解密

 @param data 要解密的数据
 @return 返回解密后的数据
 */
+ (NSData *)AES256DecryptData:(NSData *)data;


/**
 使用指定密钥对data进行256位AES加密

 @param data 要加密的数据
 @param key 加密的密钥
 @return 返回加密后的数据
 */
+ (NSData *)AES256EncryptData:(NSData *)data withKey:(NSString *)key;

/**
 使用指定密钥对data进行256位AES解密

 @param data 要解密的数据
 @param key 解密的密钥
 @return 返回解密后的数据
 */
+ (NSData *)AES256DecryptData:(NSData *)data withKey:(NSString *)key;

@end
