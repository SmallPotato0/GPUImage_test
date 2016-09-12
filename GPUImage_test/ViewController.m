//
//  ViewController.m
//  GPUImage_test
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 com. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImage * inputImage = [UIImage imageNamed:@"10_7.jpg"];
    
    //使用黑白素描滤镜
    
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    
    
    
    //设置要渲染的区域
    
    [disFilter forceProcessingAtSize:inputImage.size];
    
    [disFilter useNextFrameForImageCapture];
    
    
    
    //获取数据源
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    
    
    //添加上滤镜
    
    [stillImageSource addTarget:disFilter];
    
    //开始渲染
    
    [stillImageSource processImage];
    
    //获取渲染后的图片
    
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    
    //加载出来
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    
    imageView.frame = CGRectMake(50,50,inputImage.size.width ,inputImage.size.height);
    
    [self.view addSubview:imageView];
}

@end
