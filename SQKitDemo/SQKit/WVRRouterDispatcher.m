//
//  WVRRouterDispatcher.m
//  WhaleyVR
//
//  Created by qbshen on 2017/4/8.
//  Copyright © 2017年 Snailvr. All rights reserved.
//

#import "WVRRouterDispatcher.h"
#import "SQTableViewDelegate.h"

@implementation WVRRouterDispatcher

static NSMutableDictionary<NSString */*page*/, NSString */*dispatcherClazz*/>* kSections;

static NSMutableDictionary<NSString */*page*/, NSString */*dispatcherClazz*/>* kPages;

static NSMutableDictionary<NSString */*page*/, NSString */*dispatcherClazz*/>* kViewControllers;

+ (void)registerSection:(NSString *)sectionID className:(NSString*)className{
    if (kSections == nil) {
        kSections = [[NSMutableDictionary alloc] init];
    }
    kSections[sectionID] = className;
}

+ (SQTableViewSectionInfo*)dispatchSection:(NSString *)sectionID args:(id)args{
    NSString *dispatcherClazz = kSections[sectionID];
    if (dispatcherClazz == nil) {
        return nil;
    }
    Class dispatcherClass = NSClassFromString(dispatcherClazz);
    SQTableViewSectionInfo* dispatcher = [[dispatcherClass alloc] init];
    [dispatcher dispatch:args];
    return dispatcher;
}

+ (void)registerPage:(NSString *)pageID className:(NSString*)className{
    if (kPages == nil) {
        kPages = [[NSMutableDictionary alloc] init];
    }
    kPages[pageID] = className;
}

+ (SQTableViewSectionInfo*)dispatchPage:(NSString *)pageID args:(id)args attchView:(id)attchView{
    NSString *dispatcherClazz = kPages[pageID];
    if (dispatcherClazz == nil) {
        return nil;
    }
    Class dispatcherClass = NSClassFromString(dispatcherClazz);
//    WVRBaseSubPagePresenter* dispatcher = [(id<WVRFixRecommendPresenter>)[dispatcherClass alloc] initWithParams:args attchView:attchView];
    return nil;
}

+ (void)registerViewController:(NSString *)viewControllerID className:(NSString*)className{
    if (kViewControllers == nil) {
        kViewControllers = [[NSMutableDictionary alloc] init];
    }
    kViewControllers[viewControllerID] = className;
}

+ (UIViewController *)dispatchController:(NSString *)viewControllerID args:(id)args{
    NSString *dispatcherClazz = kViewControllers[viewControllerID];
    if (dispatcherClazz == nil) {
        return nil;
    }
    Class dispatcherClass = NSClassFromString(dispatcherClazz);
    UIViewController * dispatcher = [[dispatcherClass alloc] init];
    
    //    WVRBaseSubPagePresenter* dispatcher = [(id<WVRFixRecommendPresenter>)[dispatcherClass alloc] initWithParams:args attchView:attchView];
    return dispatcher;
}

//-(id)dispatchWithArgs:(id)args
//{
//    NSLog(@"%@",[self class]);
//    return nil;
//}
@end
