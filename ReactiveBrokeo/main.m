//
//  main.m
//  ReactiveBrokeo
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

int main(int argc, const char * argv[]) {
    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACSignal return:RACTuplePack(@YES, @NO)] subscribe:subscriber];
        return nil;
    }] reduceEach:^(NSNumber *yes, NSNumber *no) {
        // Casting block as (id) sidesteps type error.
        // https://github.com/ReactiveCocoa/ReactiveCocoa/issues/937#issuecomment-42732343
        NSLog(@"Am I indecisive? Well, %@ and %@.", yes, no);
        return RACTuplePack(@YES, @NO);
    }];

    [signal subscribeNext:^(id _) {}];

    return 0;
}

