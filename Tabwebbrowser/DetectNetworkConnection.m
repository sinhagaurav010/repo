//
//  DetectNetworkConnection.m
//  Atlas
//
//  Created by Tarun on 13/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//



#import "DetectNetworkConnection.h"
#import <SystemConfiguration/SystemConfiguration.h>
#include <netdb.h>
@implementation DetectNetworkConnection

///////////////////////////////////////////////////////////////////////////////////
//check whether there is any network connection or not 
+(BOOL) isNetworkConnectionActive
{
    // Create zero address
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);    
    SCNetworkReachabilityFlags flags;
    
	//check the reachibility of network
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) 
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
	//return whether network connection is available or not
    return (isReachable && !needsConnection) ? NetworkConnectionActive : NetworkConnectionDisactive;
}
///////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////
// Function used to check the network connectivity
+(BOOL)connectedToWeb{
	BOOL connected;
	const char *host = "www.apple.com";
    // Recover reachability flags
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
	SCNetworkReachabilityFlags flags;
	//check the reachibility of network
	connected = SCNetworkReachabilityGetFlags(reachability, &flags);
	BOOL isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
	CFRelease(reachability);
	//return whether network connection is available or not
	return isConnected;
}
///////////////////////////////////////////////////////////////////////////////////
@end
