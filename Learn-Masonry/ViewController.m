//
//  ViewController.m
//  Learn-Masonry
//
//  Created by 许菠菠 on 2018/4/2.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController (){
    BOOL loop;
}
@property (nonatomic,strong) UIImageView * headerView;
@property (nonatomic,strong) UILabel * textLable;
@property (nonatomic,strong) UILabel * nameLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loop = YES;
    _headerView = [[UIImageView alloc] init];
    _headerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_headerView];
    
    _textLable = [[UILabel alloc] init];
    _textLable.backgroundColor = [UIColor blackColor];
    [_headerView addSubview:_textLable];
    
    _nameLable = [[UILabel alloc] init];
    _nameLable.backgroundColor = [UIColor redColor];
    [_headerView addSubview:_nameLable];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [_textLable mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(_headerView.mas_top).offset(10);
        make.left.equalTo(_headerView).offset(10);
        make.width.equalTo(@200);
        make.height.equalTo(_headerView.mas_width);
        
    }];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textLable.mas_bottom).offset(10);
        make.left.equalTo(_textLable.mas_left);
        make.width.equalTo(_textLable.mas_width);
        make.height.equalTo(@50);
    }];
    
//    NSMutableArray * array = [NSMutableArray arrayWithObjects:@1,@3,@8,@78,@89,@97, nil];
//    NSInteger insertNumber = 79;
//  NSInteger  index =   [self insertNumber:insertNumber left:0 right:array.count - 1 insertTo:array];
//    [array insertObject:@(insertNumber) atIndex:index];
//    NSLog(@"%ld",index);
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)insertNumber:(NSInteger)number left:(NSInteger)leftIndex right:(NSInteger)rightIndex insertTo:(NSMutableArray*)array{
    if (number > [array[rightIndex] integerValue]) {
        return rightIndex + 1;
    }else{
        
        NSInteger midleIndex;
        
        while (leftIndex <= rightIndex) {
            midleIndex = (leftIndex + rightIndex)/2;
            if (number > [array[midleIndex] integerValue] && number < [array[midleIndex + 1] integerValue]) {
               NSInteger insetInsex = midleIndex + 1;
                return insetInsex;
            }else{
                if (number > [array[midleIndex] integerValue]){
                    leftIndex = midleIndex + 1;
                }else{
                    rightIndex = midleIndex - 1;
                }
            }
           

            

        }
        return 0;

    }

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
