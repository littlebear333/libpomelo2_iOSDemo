//
//  PomeloHelper.m
//  pomelo2
//
//  Created by 谢华 on 12/9/20.
//  Copyright © 2020 谢华. All rights reserved.
//

#import "PomeloHelper.h"
#include "pomelo.h"
#import "test.h"


static requestBack mRequestBack;
static inputData mInputData;
static pc_client_t* client;
#define HOST ""
#define PORT 8080
#define EV_HANDLER_EX ((void*)0x44)
#define REQ_ROUTE "sconnector.entryHandler.connect"
#define REQ_MSG  @"{\"access_token\":\"%@\",\"refresh_token\":\"%@\",\"userId\":\"%@\",\"version\":12,\"hostname\":\"www\",\"mobileVersion\":4,\"terminalInfo\":{\"terminalName\":\"appoffice\",\"terminalType\":\"android\"},\"lang\":\"cn\",\"app\":\"appoffice\",\"appVer\":5}"

#define REQ_EX ((void*)0x22)
#define REQ_TIMEOUT 10
#define SLEEP(x) sleep(x)
@implementation PomeloHelper


+ (void)connectServerWithaccesstoken:(NSString *)accessToken refreshToken:(NSString *)refreshToken userID:(NSString *)userID reqeustBack:(nonnull requestBack)requestBack inputData:(nonnull inputData)inputData{
    NSString * requestMessage = [NSString stringWithFormat:REQ_MSG,accessToken,refreshToken,userID];
    mRequestBack = requestBack;
    mInputData = inputData;
    [self connectServerWithreqMsg:requestMessage];
}



static void event_cb(pc_client_t* client, int ev_type, void* ex_data, const char* arg1, const char* arg2)
{

    PC_TEST_ASSERT(ex_data == EV_HANDLER_EX);
    printf("test: get event %s, arg1: %s, arg2: %s\n", pc_client_ev_str(ev_type),
            arg1 ? arg1 : "", arg2 ? arg2 : "");
    if (mInputData) {
        mInputData([NSString stringWithFormat:@"fuck receivce event %@, arg1 %@ arg2 %@",[NSString stringWithCString:pc_client_ev_str(ev_type) encoding:NSUTF8StringEncoding],[NSString stringWithCString:arg1?arg1:"" encoding:NSUTF8StringEncoding],[NSString stringWithCString:arg2?arg2:"" encoding:NSUTF8StringEncoding]]);
    }
}

+ (void)connectServerWithreqMsg:(NSString *)reqMsg{
    const char *request  = [reqMsg UTF8String];
    pc_client_config_t config = PC_CLIENT_CONFIG_DEFAULT;
    int handler_id;
    pc_lib_init(NULL, NULL, NULL, NULL);

    config.transport_name = PC_TR_NAME_UV_TLS;
    client = (pc_client_t*)malloc(pc_client_size());

    PC_TEST_ASSERT(client);

    pc_client_init(client, (void*)0x11, &config);

    PC_TEST_ASSERT(pc_client_ex_data(client) == (void*)0x11);
    PC_TEST_ASSERT(pc_client_state(client) == PC_ST_INITED);

    handler_id = pc_client_add_ev_handler(client, event_cb, EV_HANDLER_EX, NULL);

    pc_client_connect(client, HOST, PORT, NULL);
    SLEEP(1);
    pc_request_with_timeout(client, REQ_ROUTE, request, REQ_EX, REQ_TIMEOUT, request_cb);
}

static void request_cb(const pc_request_t* req, int rc, const char* resp)
{
    PC_TEST_ASSERT(rc == PC_RC_OK);
    PC_TEST_ASSERT(resp);
    printf("test: get resp %s\n", resp);
    fflush(stdout);
    
    if (mRequestBack) {
        mRequestBack([NSString stringWithFormat:@"%@",[NSString stringWithCString:resp encoding:NSUTF8StringEncoding]]);
    }

//    PC_TEST_ASSERT(pc_request_client(req) == client);
//    PC_TEST_ASSERT(!strcmp(pc_request_route(req), REQ_ROUTE));
//    PC_TEST_ASSERT(!strcmp(pc_request_msg(req), REQ_MSG));
//    PC_TEST_ASSERT(pc_request_ex_data(req) == REQ_EX);
//    PC_TEST_ASSERT(pc_request_timeout(req) == REQ_TIMEOUT);
}

@end
