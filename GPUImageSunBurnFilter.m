#import "GPUImageSunBurnFilter.h"

@implementation GPUImageSunBurnFilter

- (id)init;
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    GPUImageMonochromeFilter *monoFilter = [[GPUImageMonochromeFilter alloc] init];
    [monoFilter setColor:(GPUVector4){1.0f, 2.0f, 1.0f, 1.0f}];
    [monoFilter setIntensity:0.1];
    
    GPUImageKuwaharaFilter *vigFilter = [[GPUImageKuwaharaFilter alloc] init];
    [vigFilter setRadius:4.0];
    
    [monoFilter addTarget:vigFilter];
    
    [self setInitialFilters:[NSArray arrayWithObject:monoFilter]];
    [self setTerminalFilter:vigFilter];
    
    return self;
}

@end
