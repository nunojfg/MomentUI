#import "GPUImageYoFilter.h"

@implementation GPUImageYoFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    // Blue Valentine
    GPUImageSaturationFilter *saturFilter = [[GPUImageSaturationFilter alloc] init];
    [saturFilter setSaturation:0.5];
    [self addFilter:saturFilter];
    
    GPUImageMonochromeFilter *monoFilter = [[GPUImageMonochromeFilter alloc] init];
    [monoFilter setColor:(GPUVector4){0.0f, 3.0f, 2.0f, 1.0f}];
    [monoFilter setIntensity:0.1];
    [self addFilter:monoFilter];
    
    GPUImagePixellateFilter *vigFilter = [[GPUImagePixellateFilter alloc] init];
    vigFilter.fractionalWidthOfAPixel = 0.8;
    [self addFilter:vigFilter];
    
    GPUImageExposureFilter *expoFilter = [[GPUImageExposureFilter alloc] init];
    [expoFilter setExposure:0.3];
    [self addFilter:expoFilter];
    
    [saturFilter addTarget:monoFilter];
    [monoFilter addTarget:vigFilter];
    [vigFilter addTarget:expoFilter];
    
    [self setInitialFilters:[NSArray arrayWithObject:saturFilter]];
    [self setTerminalFilter:expoFilter];
    
    return self;
}

@end