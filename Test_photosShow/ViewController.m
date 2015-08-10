//
//  ViewController.m
//  Test_photosShow
//
//  Created by lidongbo on 15/8/4.
//  Copyright (c) 2015年 lidongbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ContentImageView;

@property (strong, nonatomic) UIImagePickerController * imagePickerController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    
    _imagePickerController.delegate = self;
    _imagePickerController.allowsEditing = YES;
    
    
    _ContentImageView.backgroundColor = [UIColor yellowColor];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)actionFromPhotoAlbum:(UIButton *)sender {
    
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:_imagePickerController animated:YES completion:^{
        NSLog(@"相册");
    }];
}



- (IBAction)actionFromCamero:(UIButton *)sender {
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:_imagePickerController animated:YES completion:^{
        NSLog(@"相机");
    }];
    
}

#pragma mark - picker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"%@",info);
    
    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    _ContentImageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
