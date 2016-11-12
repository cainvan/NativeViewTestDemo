


#import <UIKit/UIKit.h>
#import "NSTimer+Addition.h"



@interface heartView : UIView

@property (nonatomic) CGFloat myValue;

@property (nonatomic ,assign) CGFloat value;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic ,assign) BOOL isDay;


@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) UIBezierPath *wave;

@end
