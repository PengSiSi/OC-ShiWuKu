//
//  PickerView.m
//  changpingSchoolTeacher
//
//  Created by chenhuan on 16/10/25.
//  Copyright © 2016年 combanc. All rights reserved.
//

#import "PickerView.h"

static PickerView *shareInstance = nil;
#define PICKER_HEIGHT 234.0f
#define TOOLBAR_HEIGHT 44.0f

@interface PickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *myPickerview;/**<选择器 */
@property (nonatomic, strong) UIToolbar *myToolbar;/**<选择器上方工具条 */
@property (nonatomic, strong) UIView *backView;/**<容器 */
@property (nonatomic, strong) NSString *selectPicker;/**<选择的类型 */
@property (nonatomic, strong) NSString *selectPickerId;/**<选择的类型 */

@end

@implementation PickerView

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[PickerView alloc]init];
    });
    
//    [shareInstance show];
    return shareInstance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self creatView];
        [self addTapGestureRecognizerToSelf];
    }
    return self;
}

- (void)creatView {
    
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT+TOOLBAR_HEIGHT)];
    [self addSubview:self.backView];
    self.backView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.myPickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, TOOLBAR_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT)];
    self.myPickerview.delegate = self;
    self.myPickerview.dataSource = self;
    self.myPickerview.showsSelectionIndicator = YES;
    self.myPickerview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.myPickerview selectRow:1 inComponent:0 animated:YES];
    [self.backView addSubview:self.myPickerview];

    //UIToolBar
    self.myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOOLBAR_HEIGHT)];
    [self.myToolbar setBarStyle:UIBarStyleDefault];
    self.myToolbar.barTintColor = [UIColor whiteColor];
    self.myToolbar.tintColor = [UIColor darkGrayColor];
    // CancelItem、SpaceItem、DoneItem
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(toolBarCanelAction)];
    cancelItem.tintColor = K_TEXT_BLUE_COLOR;
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(tooBarDoneAction)];
    doneItem.tintColor = K_TEXT_BLUE_COLOR;
    self.myToolbar.items = @[cancelItem,spaceItem,doneItem];
    [self.backView addSubview:self.myToolbar];
    UITapGestureRecognizer *tapNavigationView = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    [self.myToolbar addGestureRecognizer:tapNavigationView];
}

//添加手势
-(void)addTapGestureRecognizerToSelf {
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenBottomView)];
    [self addGestureRecognizer:tap];
}

- (void)show {

    self.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect newframe = self.backView.frame;
        newframe.origin.y = SCREEN_HEIGHT-PICKER_HEIGHT-TOOLBAR_HEIGHT;
        self.backView.frame = newframe;
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }];
}

- (void)hidden {
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect newframe = self.backView.frame;
        newframe.origin.y = SCREEN_HEIGHT;
        self.backView.frame = newframe;
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor clearColor];
        [self removeFromSuperview];
        self.myPickerview = nil;
    }];
}

#pragma mark - DoAction
- (void)toolBarCanelAction {
    [self hidden];
}
- (void)tooBarDoneAction {
    
    self.selectPicker = isNilOrNull(self.selectPicker) ?([self.dataArray firstObject]) : self.selectPicker;
    if (self.didCheckBlock) {
        NSInteger row = [self.myPickerview selectedRowInComponent:0] ;
        self.didCheckBlock(row,self.selectPicker);
    }
    [self hidden];
}
- (void)hiddenBottomView {
    [self hidden];
}

#pragma mark - pickerViewDelegate && pickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.dataArray[row];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *lable = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = FONT_16;
    lable.text = self.dataArray[row];
    return lable;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 31.0f;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.dataArray.count >0) {
        
        self.selectPicker = self.dataArray[row];
    }
}

//- (void)setDataArray:(NSArray *)dataArray {
//    
//    _dataArray = dataArray;
//    [self.myPickerview reloadAllComponents];
//}

@end
