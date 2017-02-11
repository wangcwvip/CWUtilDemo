//
//  CWUtils+Encoding.h
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import "CWUtils.h"

@interface CWUtils (Encoding)

/**
 对字符串进行MD5编码

 @param value 要编码的字符串
 @return 返回编码后的字符串，16位16进制
 */
+ (NSString *)encodeMD5WithValue:(NSString *)value;

/**
 对data数据进行十六进制编码

 @param data 要编码的data数据
 @param upperCase 编码后是否转为大写
 @return 返回编码后的字符串
 */
+ (NSString*)encodeHexWithData:(NSData *)data upperCase:(BOOL)upperCase;

/**
 对字符串进行SHA512编码
 
 @param value 要编码的数据
 @return 返回编码后的数据
 */
+ (NSString *)encodeSHA512WithValue:(NSString *)value;

@end
