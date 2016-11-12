


#import "heartView.h"
#import "MainDefine.h"


@interface heartView ()

@property (nonatomic ,assign)CGFloat t;



@end

@implementation heartView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fireTimer:) name:kFireTimer_Notification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseTimer:) name:kPauseTimer_Notification object:nil];
      
    }
    return self;
}

- (void)setMyValue:(CGFloat)myValue{
  [self setValue:myValue];
}

- (void)drawRect:(CGRect)rect {

    UIBezierPath *round = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 startAngle:0 endAngle:30 clockwise:YES];
    [round addClip];
    round.lineWidth = 0;
    [round stroke];

    //wave
    CGPoint zero = CGPointMake(0, self.bounds.size.height * (1-_value));
    UIBezierPath *wave = [UIBezierPath bezierPath];
    [wave moveToPoint:zero];
    
    for (int i = -80; i < self.bounds.size.width; i++) {
        CGPoint p = relativeCoor(zero, i+80, 12 * sin((M_PI / 140 * i) + _t ));

        [wave addLineToPoint:p];
    }
    [wave addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [wave addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    if (_isDay) {
        [[UIColor colorWithRed:10/255.0 green:185/255.0 blue:255/255.0 alpha:.4] set];
    }else{
        [[UIColor colorWithRed:210/255.0 green:218/255.0 blue:223/255.0 alpha:.4] set];
    }
    [wave fill];
    
    CGPoint zero1 = CGPointMake(0, self.bounds.size.height * (1-_value));
    UIBezierPath *wave1 = [UIBezierPath bezierPath];
    [wave1 moveToPoint:zero1];
    
    for (int i = 0; i < self.bounds.size.width; i++) {
        
        CGPoint p = relativeCoor(zero1, i, 11*sin(M_PI /120 *i + _t ) );
        [wave1 addLineToPoint:p];
    }
    [wave1 addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [wave1 addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    //[[[UtilHelp instance] getColor:_isDay ? @"0ab9ff" : @"d2dadf"] set];
    //if (_isDay) {
        [[UIColor colorWithRed:10/255.0 green:185/255.0 blue:255/255.0 alpha:1] set];
    //}else{
        //[[UIColor colorWithRed:210/255.0 green:218/255.0 blue:223/255.0 alpha:1] set];
    //}
    [wave1 fill];
}


CGPoint relativeCoor(CGPoint point, CGFloat x ,CGFloat y){
    return CGPointMake(point.x + x, point.y + y);
}

-(void)didMoveToSuperview{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(change) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}

-(void)change{
    _t += M_PI * 0.032;
    if (_t == M_PI * 4) {
        _t = 0;
    }
    
    [self setNeedsDisplay];
}

- (void)fireTimer:(NSNotification *)sender
{
    [self setNeedsDisplay];
    [_timer resumeTimer];
}

- (void)pauseTimer:(NSNotification *)sender
{
    [self setNeedsDisplay];
    [_timer pauseTimer];
}

@end
