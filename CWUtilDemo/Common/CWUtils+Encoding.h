//
//  CWUtils+Encoding.h
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWUtils.h"

@interface CWUtils (Encoding)

#pragma mark - MD5

/**
 对字符串进行MD5编码

 @param string 要编码的字符串
 @return 返回编码后的字符串，16位16进制
 */
+ (NSString *)encodeMD5WithString:(NSString *)string;

#pragma mark - Hex

/**
 对data数据进行十六进制编码

 @param data 要编码的data数据
 @param upperCase 编码后是否转为大写
 @return 返回编码后的字符串
 */
+ (NSString*)encodeHexWithData:(NSData *)data upperCase:(BOOL)upperCase;

#pragma mark - SHA

/**
 对字符串进行SHA512编码，CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
 
 @param string 要编码的数据
 @return 返回编码后的数据
 */
+ (NSString *)encodeSHA512WithString:(NSString *)string;


#pragma mark - Base64

/**
 对字符串进行base64编码

 @param string 要编码的字符串
 @return 返回编码后的字符串
 */
+ (NSString *)encodeBase64WithString:(NSString *)string;

/**
 对data数据进行base64编码

 @param data 要编码的数据
 @return 返回编码后的字符串
 */
+ (NSString *)encodeBase64WithData:(NSData *)data;

/**
 对字符串进行base64编码

 @param string 要编码的字符串
 @return 返回编码后的数据
 */
+ (NSData *)decodeBase64WithString:(NSString *)string;

@end
