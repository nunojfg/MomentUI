//
//  GPUImageRedFireFilter.m
//  moment
//
//  Created by Nuno Gonçalves on 20/04/16.
//  Copyright © 2016 Motionblink. All rights reserved.
//

#import "GPUImageRedFireFilter.h"

@implementation GPUImageRedFireFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    GPUImageSaturationFilter *saturFilter = [[GPUImageSaturationFilter alloc] init];
    [saturFilter setSaturation:0.5];
    
    GPUImageMonochromeFilter *monoFilter = [[GPUImageMonochromeFilter alloc] init];
    [monoFilter setColor:(GPUVector4){2.0f, 0.0f, 0.0f, 1.0f}];
    [monoFilter setIntensity:0.1];
    
    GPUImageVignetteFilter *vigFilter = [[GPUImageVignetteFilter alloc] init];
    [vigFilter setVignetteEnd:0.8];
    
    GPUImageExposureFilter *expoFilter = [[GPUImageExposureFilter alloc] init];
    [expoFilter setExposure:0.3];
    
    [saturFilter addTarget:monoFilter];
    [monoFilter addTarget:vigFilter];
    [vigFilter addTarget:expoFilter];
    
    [self setInitialFilters:[NSArray arrayWithObject:saturFilter]];
    [self setTerminalFilter:expoFilter];
    
    return self;
}


@end
