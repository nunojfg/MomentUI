#import "GPUImageBlueValentineFilter.h"

@implementation GPUImageBlueValentineFilter

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
    [monoFilter setColor:(GPUVector4){1.0f, 1.0f, 2.0f, 1.0f}];
    [monoFilter setIntensity:0.15];
    [self addFilter:monoFilter];
    
    GPUImagePixellateFilter *vigFilter = [[GPUImagePixellateFilter alloc] init];
    vigFilter.fractionalWidthOfAPixel = 0.02;
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
