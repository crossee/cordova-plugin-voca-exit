//
//  CDVVocaExit.m
//
//

#import "CDVVocaExit.h"
#import <Cordova/CDV.h>

@implementation CDVVocaExit

- (void)exitApp:(CDVInvokedUrlCommand*)command
{

    CDVPluginResult* pluginResult = nil;

    NSString* echo = [command.arguments objectAtIndex:0];
    BOOL popUpAlert = [echo boolValue];
    bool closeApp = false;


    if (popUpAlert) {

        UIAlertView *confirmPopUp = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                    message:@"보카트레인을 종료하시겠습니까?"
                                                                   delegate:self
                                                          cancelButtonTitle:@"아니요"
                                                          otherButtonTitles:@"네", nil];
        [confirmPopUp show];

    } else {

        closeApp = YES;

    }


    if (closeApp) {
        [self exitApplication];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
        break;
        case 1: //"Yes" pressed
        [self exitApplication];
        break;
    }
}

- (void) exitApplication{
    exit(0);
}

@end
