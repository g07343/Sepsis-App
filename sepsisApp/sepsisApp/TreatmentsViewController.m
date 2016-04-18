//
//  TreatmentsViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/14/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "TreatmentsViewController.h"

@interface TreatmentsViewController ()

@end

@implementation TreatmentsViewController
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if( [ [ UIScreen mainScreen ] respondsToSelector: @selector( nativeBounds ) ] )
        {
            /* Detect using nativeBounds - iOS 8 and greater */
            #define IS_IPHONE_5_IOS8 ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1136 ) < DBL_EPSILON )
            #define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1704 ) < DBL_EPSILON )
        }
        else
        {
            /* Detect using bounds - iOS 7 and lower */
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ))
    {
        antibioticsButton = [[UIButton alloc] init];
        UIImage *antibioticsButtonImage = [UIImage imageNamed:@"antibiotics_btn.png"];
        [antibioticsButton setImage:antibioticsButtonImage forState:UIControlStateNormal];
        [antibioticsButton setTag:0];
        [antibioticsButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        ivButton = [[UIButton alloc] init];
        UIImage *ivButtonImage = [UIImage imageNamed:@"iv_btn.png"];
        [ivButton setImage:ivButtonImage forState:UIControlStateNormal];
        [ivButton setTag:1];
        [ivButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        vasopressorButton = [[UIButton alloc] init];
        UIImage *vasopressorButtonImage = [UIImage imageNamed:@"vasopressor_btn.png"];
        [vasopressorButton setImage:vasopressorButtonImage forState:UIControlStateNormal];
        [vasopressorButton setTag:2];
        [vasopressorButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        steroidButton = [[UIButton alloc] init];
        UIImage *steroidButtonImage = [UIImage imageNamed:@"steroid_btn.png"];
        [steroidButton setImage:steroidButtonImage forState:UIControlStateNormal];
        [steroidButton setTag:3];
        [steroidButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (!(IS_IPHONE_5) && !(IS_IPHONE_5_IOS8) && !(IS_IPHONE_6P))
        {
            antibioticsButton.frame = CGRectMake(5, 206, 60, 60);
            ivButton.frame = CGRectMake(73, 206, 60, 60);
            vasopressorButton.frame = CGRectMake(141, 206, 60, 60);
            steroidButton.frame = CGRectMake(205, 206, 60, 60);
        } else if (IS_IPHONE_5 || IS_IPHONE_5_IOS8 || IS_IPHONE_6P){
            antibioticsButton.frame = CGRectMake(5, 206, 60, 60);
            ivButton.frame = CGRectMake(101, 206, 60, 60);
            vasopressorButton.frame = CGRectMake(199, 206, 60, 60);
            steroidButton.frame = CGRectMake(294, 206, 60, 60);
        } else if (IS_IPHONE_5_IOS8) {
            antibioticsButton.frame = CGRectMake(5, 206, 60, 60);
            ivButton.frame = CGRectMake(101, 206, 60, 60);
            vasopressorButton.frame = CGRectMake(199, 206, 60, 60);
            steroidButton.frame = CGRectMake(294, 206, 60, 60);
        }
        [self.view addSubview:antibioticsButton];
        [self.view addSubview:ivButton];
        [self.view addSubview:vasopressorButton];
        [self.view addSubview:steroidButton];
    }
    
    
    
    
    animationCounter = 0;
    antibioticsView.hidden = YES;
	ivView.hidden = YES;
    steroidView.hidden = YES;
    vasopressorView.hidden = YES;
    //set up our animation arrays
    antibioticsImages = @[@"/bacteriaDying_mc0001.png",
                          @"/bacteriaDying_mc0002.png",
                          @"/bacteriaDying_mc0003.png",
                          @"/bacteriaDying_mc0004.png",
                          @"/bacteriaDying_mc0005.png",
                          @"/bacteriaDying_mc0006.png",
                          @"/bacteriaDying_mc0007.png",
                          @"/bacteriaDying_mc0008.png",
                          @"/bacteriaDying_mc0009.png",
                          @"/bacteriaDying_mc0010.png",
                          @"/bacteriaDying_mc0011.png",
                          @"/bacteriaDying_mc0012.png",
                          @"/bacteriaDying_mc0013.png",
                          @"/bacteriaDying_mc0014.png",
                          @"/bacteriaDying_mc0015.png",
                          @"/bacteriaDying_mc0016.png",
                          @"/bacteriaDying_mc0017.png",
                          @"/bacteriaDying_mc0018.png",
                          @"/bacteriaDying_mc0019.png",
                          @"/bacteriaDying_mc0020.png",
                          @"/bacteriaDying_mc0021.png",
                          @"/bacteriaDying_mc0022.png",
                          @"/bacteriaDying_mc0023.png",
                          @"/bacteriaDying_mc0024.png",
                          @"/bacteriaDying_mc0025.png",
                          @"/bacteriaDying_mc0026.png",
                          @"/bacteriaDying_mc0027.png",
                          @"/bacteriaDying_mc0028.png",
                          @"/bacteriaDying_mc0029.png",
                          @"/bacteriaDying_mc0030.png",
                          @"/bacteriaDying_mc0031.png",
                          @"/bacteriaDying_mc0032.png",
                          @"/bacteriaDying_mc0033.png",
                          @"/bacteriaDying_mc0034.png",
                          @"/bacteriaDying_mc0035.png",
                          @"/bacteriaDying_mc0036.png",
                          @"/bacteriaDying_mc0037.png",
                          @"/bacteriaDying_mc0038.png",
                          @"/bacteriaDying_mc0039.png",
                          @"/bacteriaDying_mc0040.png",
                          @"/bacteriaDying_mc0041.png",
                          @"/bacteriaDying_mc0042.png",
                          @"/bacteriaDying_mc0043.png",
                          @"/bacteriaDying_mc0044.png",
                          @"/bacteriaDying_mc0045.png",
                          @"/bacteriaDying_mc0046.png",
                          @"/bacteriaDying_mc0047.png",
                          @"/bacteriaDying_mc0048.png",
                          @"/bacteriaDying_mc0049.png",
                          @"/bacteriaDying_mc0050.png",
                          @"/bacteriaDying_mc0051.png",
                          @"/bacteriaDying_mc0052.png",
                          @"/bacteriaDying_mc0053.png",
                          @"/bacteriaDying_mc0054.png",
                          @"/bacteriaDying_mc0055.png",
                          @"/bacteriaDying_mc0056.png",
                          @"/bacteriaDying_mc0057.png",
                          @"/bacteriaDying_mc0058.png",
                          @"/bacteriaDying_mc0059.png",
                          @"/bacteriaDying_mc0060.png",
                          @"/bacteriaDying_mc0061.png",
                          @"/bacteriaDying_mc0062.png",
                          @"/bacteriaDying_mc0063.png",
                          @"/bacteriaDying_mc0064.png",
                          @"/bacteriaDying_mc0065.png",
                          @"/bacteriaDying_mc0066.png",
                          @"/bacteriaDying_mc0067.png",
                          @"/bacteriaDying_mc0068.png",
                          @"/bacteriaDying_mc0069.png",
                          @"/bacteriaDying_mc0070.png",
                          @"/bacteriaDying_mc0071.png",
                          @"/bacteriaDying_mc0072.png",
                          @"/bacteriaDying_mc0073.png",
                          @"/bacteriaDying_mc0074.png",
                          @"/bacteriaDying_mc0075.png",
                          @"/bacteriaDying_mc0076.png",
                          @"/bacteriaDying_mc0077.png",
                          @"/bacteriaDying_mc0078.png",
                          @"/bacteriaDying_mc0079.png",
                          @"/bacteriaDying_mc0080.png",
                          @"/bacteriaDying_mc0081.png",
                          @"/bacteriaDying_mc0082.png",
                          @"/bacteriaDying_mc0083.png",
                          @"/bacteriaDying_mc0084.png",
                          @"/bacteriaDying_mc0085.png",
                          @"/bacteriaDying_mc0086.png",
                          @"/bacteriaDying_mc0087.png",
                          @"/bacteriaDying_mc0088.png",
                          @"/bacteriaDying_mc0089.png",
                          @"/bacteriaDying_mc0090.png",
                          @"/bacteriaDying_mc0091.png",
                          @"/bacteriaDying_mc0092.png",
                          @"/bacteriaDying_mc0093.png",
                          @"/bacteriaDying_mc0094.png",
                          @"/bacteriaDying_mc0095.png",
                          @"/bacteriaDying_mc0096.png",
                          @"/bacteriaDying_mc0097.png",
                          @"/bacteriaDying_mc0098.png",
                          @"/bacteriaDying_mc0099.png",
                          @"/bacteriaDying_mc0100.png",
                          @"/bacteriaDying_mc0101.png",
                          @"/bacteriaDying_mc0102.png",
                          @"/bacteriaDying_mc0103.png",
                          @"/bacteriaDying_mc0104.png",
                          @"/bacteriaDying_mc0105.png",
                          @"/bacteriaDying_mc0106.png",
                          @"/bacteriaDying_mc0107.png",
                          @"/bacteriaDying_mc0108.png",
                          @"/bacteriaDying_mc0109.png",
                          @"/bacteriaDying_mc0110.png",
                          @"/bacteriaDying_mc0111.png",
                          @"/bacteriaDying_mc0112.png",
                          @"/bacteriaDying_mc0113.png",
                          @"/bacteriaDying_mc0114.png",
                          @"/bacteriaDying_mc0115.png",
                          @"/bacteriaDying_mc0116.png",
                          @"/bacteriaDying_mc0117.png",
                          @"/bacteriaDying_mc0118.png",
                          @"/bacteriaDying_mc0119.png",
                          @"/bacteriaDying_mc0120.png",
                          @"/bacteriaDying_mc0121.png",
                          @"/bacteriaDying_mc0122.png",
                          @"/bacteriaDying_mc0123.png",
                          @"/bacteriaDying_mc0124.png",
                          @"/bacteriaDying_mc0125.png",
                          @"/bacteriaDying_mc0126.png",
                          @"/bacteriaDying_mc0127.png",
                          @"/bacteriaDying_mc0128.png",
                          @"/bacteriaDying_mc0129.png",
                          @"/bacteriaDying_mc0130.png",
                          @"/bacteriaDying_mc0131.png",
                          @"/bacteriaDying_mc0132.png",
                          @"/bacteriaDying_mc0133.png",
                          @"/bacteriaDying_mc0134.png",
                          @"/bacteriaDying_mc0135.png",
                          @"/bacteriaDying_mc0136.png",
                          @"/bacteriaDying_mc0137.png",
                          @"/bacteriaDying_mc0138.png",
                          @"/bacteriaDying_mc0139.png",
                          @"/bacteriaDying_mc0140.png",
                          @"/bacteriaDying_mc0141.png",
                          @"/bacteriaDying_mc0142.png",
                          @"/bacteriaDying_mc0143.png",
                          @"/bacteriaDying_mc0144.png",
                          @"/bacteriaDying_mc0145.png",
                          @"/bacteriaDying_mc0146.png",
                          @"/bacteriaDying_mc0147.png",
                          @"/bacteriaDying_mc0148.png",
                          @"/bacteriaDying_mc0149.png",
                          @"/bacteriaDying_mc0150.png",
                          @"/bacteriaDying_mc0151.png",
                          @"/bacteriaDying_mc0152.png",
                          @"/bacteriaDying_mc0153.png",
                          @"/bacteriaDying_mc0154.png",
                          @"/bacteriaDying_mc0155.png",
                          @"/bacteriaDying_mc0156.png",
                          @"/bacteriaDying_mc0157.png",
                          @"/bacteriaDying_mc0158.png",
                          @"/bacteriaDying_mc0159.png",
                          @"/bacteriaDying_mc0160.png",
                          @"/bacteriaDying_mc0161.png",
                          @"/bacteriaDying_mc0162.png",
                          @"/bacteriaDying_mc0163.png",
                          @"/bacteriaDying_mc0164.png",
                          @"/bacteriaDying_mc0165.png",
                          @"/bacteriaDying_mc0166.png",
                          @"/bacteriaDying_mc0167.png",
                          @"/bacteriaDying_mc0168.png",
                          @"/bacteriaDying_mc0169.png",
                          @"/bacteriaDying_mc0170.png",
                          @"/bacteriaDying_mc0171.png",
                          @"/bacteriaDying_mc0172.png",
                          @"/bacteriaDying_mc0173.png",
                          @"/bacteriaDying_mc0174.png",
                          @"/bacteriaDying_mc0175.png",
                          @"/bacteriaDying_mc0176.png",
                          @"/bacteriaDying_mc0177.png",
                          @"/bacteriaDying_mc0178.png",
                          @"/bacteriaDying_mc0179.png",
                          @"/bacteriaDying_mc0180.png",
                          @"/bacteriaDying_mc0181.png",
                          @"/bacteriaDying_mc0182.png",
                          @"/bacteriaDying_mc0183.png",
                          @"/bacteriaDying_mc0184.png",
                          @"/bacteriaDying_mc0185.png",
                          @"/bacteriaDying_mc0186.png",
                          @"/bacteriaDying_mc0187.png",
                          @"/bacteriaDying_mc0188.png",
                          @"/bacteriaDying_mc0189.png",
                          @"/bacteriaDying_mc0190.png",
                          @"/bacteriaDying_mc0191.png",
                          @"/bacteriaDying_mc0192.png",
                          @"/bacteriaDying_mc0193.png",
                          @"/bacteriaDying_mc0194.png",
                          @"/bacteriaDying_mc0195.png",
                          @"/bacteriaDying_mc0196.png",
                          @"/bacteriaDying_mc0197.png",
                          @"/bacteriaDying_mc0198.png",
                          @"/bacteriaDying_mc0199.png",
                          @"/bacteriaDying_mc0200.png",
                          @"/bacteriaDying_mc0201.png",
                          @"/bacteriaDying_mc0202.png",
                          @"/bacteriaDying_mc0203.png",
                          @"/bacteriaDying_mc0204.png",
                          @"/bacteriaDying_mc0205.png",
                          @"/bacteriaDying_mc0206.png",
                          @"/bacteriaDying_mc0207.png",
                          @"/bacteriaDying_mc0208.png",
                          @"/bacteriaDying_mc0209.png",
                          @"/bacteriaDying_mc0210.png",
                          @"/bacteriaDying_mc0211.png",
                          @"/bacteriaDying_mc0212.png",
                          @"/bacteriaDying_mc0213.png",
                          @"/bacteriaDying_mc0214.png",
                          @"/bacteriaDying_mc0215.png",
                          @"/bacteriaDying_mc0216.png",
                          @"/bacteriaDying_mc0217.png",
                          @"/bacteriaDying_mc0218.png",
                          @"/bacteriaDying_mc0219.png",
                          @"/bacteriaDying_mc0220.png",
                          @"/bacteriaDying_mc0221.png",
                          @"/bacteriaDying_mc0222.png",
                          @"/bacteriaDying_mc0223.png",
                          @"/bacteriaDying_mc0224.png",
                          @"/bacteriaDying_mc0225.png",
                          @"/bacteriaDying_mc0226.png",
                          @"/bacteriaDying_mc0227.png",
                          @"/bacteriaDying_mc0228.png",
                          @"/bacteriaDying_mc0229.png",
                          @"/bacteriaDying_mc0230.png",
                          @"/bacteriaDying_mc0231.png",
                          @"/bacteriaDying_mc0232.png",
                          @"/bacteriaDying_mc0233.png",
                          @"/bacteriaDying_mc0234.png",
                          @"/bacteriaDying_mc0235.png",
                          @"/bacteriaDying_mc0236.png",
                          @"/bacteriaDying_mc0237.png",
                          @"/bacteriaDying_mc0238.png",
                          @"/bacteriaDying_mc0239.png",
                          @"/bacteriaDying_mc0240.png",
                          @"/bacteriaDying_mc0241.png",
                          @"/bacteriaDying_mc0242.png",
                          @"/bacteriaDying_mc0243.png",
                          @"/bacteriaDying_mc0244.png",
                          @"/bacteriaDying_mc0245.png",
                          @"/bacteriaDying_mc0246.png",
                          @"/bacteriaDying_mc0247.png",
                          @"/bacteriaDying_mc0248.png",
                          @"/bacteriaDying_mc0249.png",
                          @"/bacteriaDying_mc0250.png",
                          @"/bacteriaDying_mc0251.png",
                          @"/bacteriaDying_mc0252.png",
                          @"/bacteriaDying_mc0253.png",
                          @"/bacteriaDying_mc0254.png",
                          @"/bacteriaDying_mc0255.png",
                          @"/bacteriaDying_mc0256.png",
                          @"/bacteriaDying_mc0257.png",
                          @"/bacteriaDying_mc0258.png",
                          @"/bacteriaDying_mc0259.png",
                          @"/bacteriaDying_mc0260.png",
                          @"/bacteriaDying_mc0261.png",
                          @"/bacteriaDying_mc0262.png",
                          @"/bacteriaDying_mc0263.png",
                          @"/bacteriaDying_mc0264.png",
                          @"/bacteriaDying_mc0265.png",
                          @"/bacteriaDying_mc0266.png",
                          @"/bacteriaDying_mc0267.png",
                          @"/bacteriaDying_mc0268.png",
                          @"/bacteriaDying_mc0269.png",
                          @"/bacteriaDying_mc0270.png"];
    
    
    ivImages = @[@"/o2_mc0001.png",
                 @"/o2_mc0002.png",
                 @"/o2_mc0003.png",
                 @"/o2_mc0004.png",
                 @"/o2_mc0005.png",
                 @"/o2_mc0006.png",
                 @"/o2_mc0007.png",
                 @"/o2_mc0008.png",
                 @"/o2_mc0009.png",
                 @"/o2_mc0010.png",
                 @"/o2_mc0011.png",
                 @"/o2_mc0012.png",
                 @"/o2_mc0013.png",
                 @"/o2_mc0014.png",
                 @"/o2_mc0015.png",
                 @"/o2_mc0016.png",
                 @"/o2_mc0017.png",
                 @"/o2_mc0018.png",
                 @"/o2_mc0019.png",
                 @"/o2_mc0020.png",
                 @"/o2_mc0021.png",
                 @"/o2_mc0022.png",
                 @"/o2_mc0023.png",
                 @"/o2_mc0024.png",
                 @"/o2_mc0025.png",
                 @"/o2_mc0026.png",
                 @"/o2_mc0027.png",
                 @"/o2_mc0028.png",
                 @"/o2_mc0029.png",
                 @"/o2_mc0030.png",
                 @"/o2_mc0031.png",
                 @"/o2_mc0032.png",
                 @"/o2_mc0033.png",
                 @"/o2_mc0034.png",
                 @"/o2_mc0035.png",
                 @"/o2_mc0036.png",
                 @"/o2_mc0037.png",
                 @"/o2_mc0038.png",
                 @"/o2_mc0039.png",
                 @"/o2_mc0040.png",
                 @"/o2_mc0041.png",
                 @"/o2_mc0042.png",
                 @"/o2_mc0043.png",
                 @"/o2_mc0044.png",
                 @"/o2_mc0045.png",
                 @"/o2_mc0046.png",
                 @"/o2_mc0047.png",
                 @"/o2_mc0048.png",
                 @"/o2_mc0049.png",
                 @"/o2_mc0050.png",
                 @"/o2_mc0051.png",
                 @"/o2_mc0052.png",
                 @"/o2_mc0053.png",
                 @"/o2_mc0054.png",
                 @"/o2_mc0055.png",
                 @"/o2_mc0056.png",
                 @"/o2_mc0057.png",
                 @"/o2_mc0058.png",
                 @"/o2_mc0059.png",
                 @"/o2_mc0060.png",
                 @"/o2_mc0061.png",
                 @"/o2_mc0062.png",
                 @"/o2_mc0063.png",
                 @"/o2_mc0064.png",
                 @"/o2_mc0065.png",
                 @"/o2_mc0066.png",
                 @"/o2_mc0067.png",
                 @"/o2_mc0068.png",
                 @"/o2_mc0069.png",
                 @"/o2_mc0070.png",
                 @"/o2_mc0071.png",
                 @"/o2_mc0072.png",
                 @"/o2_mc0073.png",
                 @"/o2_mc0074.png",
                 @"/o2_mc0075.png",
                 @"/o2_mc0076.png",
                 @"/o2_mc0077.png",
                 @"/o2_mc0078.png",
                 @"/o2_mc0079.png",
                 @"/o2_mc0080.png",
                 @"/o2_mc0081.png",
                 @"/o2_mc0082.png",
                 @"/o2_mc0083.png",
                 @"/o2_mc0084.png",
                 @"/o2_mc0085.png",
                 @"/o2_mc0086.png",
                 @"/o2_mc0087.png"];
    
    steroidImages = @[@"/bodyEnflamed_mc0001.png",
                      @"/bodyEnflamed_mc0002.png",
                      @"/bodyEnflamed_mc0003.png",
                      @"/bodyEnflamed_mc0004.png",
                      @"/bodyEnflamed_mc0005.png",
                      @"/bodyEnflamed_mc0006.png",
                      @"/bodyEnflamed_mc0007.png",
                      @"/bodyEnflamed_mc0008.png",
                      @"/bodyEnflamed_mc0009.png",
                      @"/bodyEnflamed_mc0010.png",
                      @"/bodyEnflamed_mc0011.png",
                      @"/bodyEnflamed_mc0012.png",
                      @"/bodyEnflamed_mc0013.png",
                      @"/bodyEnflamed_mc0014.png",
                      @"/bodyEnflamed_mc0015.png",
                      @"/bodyEnflamed_mc0016.png",
                      @"/bodyEnflamed_mc0017.png",
                      @"/bodyEnflamed_mc0018.png",
                      @"/bodyEnflamed_mc0019.png",
                      @"/bodyEnflamed_mc0020.png",
                      @"/bodyEnflamed_mc0021.png",
                      @"/bodyEnflamed_mc0022.png",
                      @"/bodyEnflamed_mc0023.png",
                      @"/bodyEnflamed_mc0024.png",
                      @"/bodyEnflamed_mc0025.png",
                      @"/bodyEnflamed_mc0026.png",
                      @"/bodyEnflamed_mc0027.png",
                      @"/bodyEnflamed_mc0028.png",
                      @"/bodyEnflamed_mc0029.png",
                      @"/bodyEnflamed_mc0030.png",
                      @"/bodyEnflamed_mc0031.png",
                      @"/bodyEnflamed_mc0032.png",
                      @"/bodyEnflamed_mc0033.png",
                      @"/bodyEnflamed_mc0034.png",
                      @"/bodyEnflamed_mc0035.png",
                      @"/bodyEnflamed_mc0036.png",
                      @"/bodyEnflamed_mc0037.png",
                      @"/bodyEnflamed_mc0038.png",
                      @"/bodyEnflamed_mc0039.png",
                      @"/bodyEnflamed_mc0040.png",
                      @"/bodyEnflamed_mc0041.png",
                      @"/bodyEnflamed_mc0042.png",
                      @"/bodyEnflamed_mc0043.png",
                      @"/bodyEnflamed_mc0044.png",
                      @"/bodyEnflamed_mc0045.png",
                      @"/bodyEnflamed_mc0046.png",
                      @"/bodyEnflamed_mc0047.png",
                      @"/bodyEnflamed_mc0048.png",
                      @"/bodyEnflamed_mc0049.png",
                      @"/bodyEnflamed_mc0050.png",
                      @"/bodyEnflamed_mc0051.png",
                      @"/bodyEnflamed_mc0052.png",
                      @"/bodyEnflamed_mc0053.png",
                      @"/bodyEnflamed_mc0054.png",
                      @"/bodyEnflamed_mc0055.png",
                      @"/bodyEnflamed_mc0056.png",
                      @"/bodyEnflamed_mc0057.png",
                      @"/bodyEnflamed_mc0058.png",
                      @"/bodyEnflamed_mc0059.png",
                      @"/bodyEnflamed_mc0060.png",
                      @"/bodyEnflamed_mc0061.png",
                      @"/bodyEnflamed_mc0062.png",
                      @"/bodyEnflamed_mc0063.png",
                      @"/bodyEnflamed_mc0064.png",
                      @"/bodyEnflamed_mc0065.png",
                      @"/bodyEnflamed_mc0066.png",
                      @"/bodyEnflamed_mc0067.png",
                      @"/bodyEnflamed_mc0068.png",
                      @"/bodyEnflamed_mc0069.png",
                      @"/bodyEnflamed_mc0070.png",
                      @"/bodyEnflamed_mc0071.png",
                      @"/bodyEnflamed_mc0072.png",
                      @"/bodyEnflamed_mc0073.png",
                      @"/bodyEnflamed_mc0074.png",
                      @"/bodyEnflamed_mc0075.png",
                      @"/bodyEnflamed_mc0076.png",
                      @"/bodyEnflamed_mc0077.png",
                      @"/bodyEnflamed_mc0078.png",
                      @"/bodyEnflamed_mc0079.png",
                      @"/bodyEnflamed_mc0080.png",
                      @"/bodyEnflamed_mc0081.png",
                      @"/bodyEnflamed_mc0082.png",
                      @"/bodyEnflamed_mc0083.png",
                      @"/bodyEnflamed_mc0084.png",
                      @"/bodyEnflamed_mc0085.png",
                      @"/bodyEnflamed_mc0086.png",
                      @"/bodyEnflamed_mc0087.png",
                      @"/bodyEnflamed_mc0088.png",
                      @"/bodyEnflamed_mc0089.png",
                      @"/bodyEnflamed_mc0090.png",
                      @"/bodyEnflamed_mc0091.png",
                      @"/bodyEnflamed_mc0092.png",
                      @"/bodyEnflamed_mc0093.png",
                      @"/bodyEnflamed_mc0094.png",
                      @"/bodyEnflamed_mc0095.png",
                      @"/bodyEnflamed_mc0096.png",
                      @"/bodyEnflamed_mc0097.png",
                      @"/bodyEnflamed_mc0098.png",
                      @"/bodyEnflamed_mc0099.png",
                      @"/bodyEnflamed_mc0100.png",
                      @"/bodyEnflamed_mc0101.png",
                      @"/bodyEnflamed_mc0102.png",
                      @"/bodyEnflamed_mc0103.png",
                      @"/bodyEnflamed_mc0104.png",
                      @"/bodyEnflamed_mc0105.png",
                      @"/bodyEnflamed_mc0106.png",
                      @"/bodyEnflamed_mc0107.png",
                      @"/bodyEnflamed_mc0108.png",
                      @"/bodyEnflamed_mc0109.png",
                      @"/bodyEnflamed_mc0110.png",
                      @"/bodyEnflamed_mc0111.png",
                      @"/bodyEnflamed_mc0112.png",
                      @"/bodyEnflamed_mc0113.png",
                      @"/bodyEnflamed_mc0114.png",
                      @"/bodyEnflamed_mc0115.png",
                      @"/bodyEnflamed_mc0116.png",
                      @"/bodyEnflamed_mc0117.png",
                      @"/bodyEnflamed_mc0118.png",
                      @"/bodyEnflamed_mc0119.png",
                      @"/bodyEnflamed_mc0120.png",
                      @"/bodyEnflamed_mc0121.png",
                      @"/bodyEnflamed_mc0122.png",
                      @"/bodyEnflamed_mc0123.png",
                      @"/bodyEnflamed_mc0124.png",
                      @"/bodyEnflamed_mc0125.png",
                      @"/bodyEnflamed_mc0126.png",
                      @"/bodyEnflamed_mc0127.png",
                      @"/bodyEnflamed_mc0128.png",
                      @"/bodyEnflamed_mc0129.png",
                      @"/bodyEnflamed_mc0130.png",
                      @"/bodyEnflamed_mc0131.png",
                      @"/bodyEnflamed_mc0132.png",
                      @"/bodyEnflamed_mc0133.png",
                      @"/bodyEnflamed_mc0134.png",
                      @"/bodyEnflamed_mc0135.png",
                      @"/bodyEnflamed_mc0136.png",
                      @"/bodyEnflamed_mc0137.png",
                      @"/bodyEnflamed_mc0138.png",
                      @"/bodyEnflamed_mc0139.png",
                      @"/bodyEnflamed_mc0140.png",
                      @"/bodyEnflamed_mc0141.png",
                      @"/bodyEnflamed_mc0142.png",
                      @"/bodyEnflamed_mc0143.png",
                      @"/bodyEnflamed_mc0144.png",
                      @"/bodyEnflamed_mc0145.png",
                      @"/bodyEnflamed_mc0146.png",
                      @"/bodyEnflamed_mc0147.png",
                      @"/bodyEnflamed_mc0148.png",
                      @"/bodyEnflamed_mc0149.png",
                      @"/bodyEnflamed_mc0150.png",
                      @"/bodyEnflamed_mc0151.png",
                      @"/bodyEnflamed_mc0152.png",
                      @"/bodyEnflamed_mc0153.png",
                      @"/bodyEnflamed_mc0154.png",
                      @"/bodyEnflamed_mc0155.png",
                      @"/bodyEnflamed_mc0156.png",
                      @"/bodyEnflamed_mc0157.png",
                      @"/bodyEnflamed_mc0158.png",
                      @"/bodyEnflamed_mc0159.png",
                      @"/bodyEnflamed_mc0160.png",
                      @"/bodyEnflamed_mc0161.png",
                      @"/bodyEnflamed_mc0162.png",
                      @"/bodyEnflamed_mc0163.png",
                      @"/bodyEnflamed_mc0164.png",
                      @"/bodyEnflamed_mc0165.png",
                      @"/bodyEnflamed_mc0166.png",
                      @"/bodyEnflamed_mc0167.png",
                      @"/bodyEnflamed_mc0168.png",
                      @"/bodyEnflamed_mc0169.png",
                      @"/bodyEnflamed_mc0170.png",
                      @"/bodyEnflamed_mc0171.png",
                      @"/bodyEnflamed_mc0172.png",
                      @"/bodyEnflamed_mc0173.png",
                      @"/bodyEnflamed_mc0174.png",
                      @"/bodyEnflamed_mc0175.png",
                      @"/bodyEnflamed_mc0176.png",
                      @"/bodyEnflamed_mc0177.png",
                      @"/bodyEnflamed_mc0178.png",
                      @"/bodyEnflamed_mc0179.png",
                      @"/bodyEnflamed_mc0180.png",
                      @"/bodyEnflamed_mc0181.png",
                      @"/bodyEnflamed_mc0182.png",
                      @"/bodyEnflamed_mc0183.png",
                      @"/bodyEnflamed_mc0184.png",
                      @"/bodyEnflamed_mc0185.png",
                      @"/bodyEnflamed_mc0186.png",
                      @"/bodyEnflamed_mc0187.png",
                      @"/bodyEnflamed_mc0188.png",
                      @"/bodyEnflamed_mc0189.png",
                      @"/bodyEnflamed_mc0190.png",
                      @"/bodyEnflamed_mc0191.png",
                      @"/bodyEnflamed_mc0192.png",
                      @"/bodyEnflamed_mc0193.png",
                      @"/bodyEnflamed_mc0194.png",
                      @"/bodyEnflamed_mc0195.png",
                      @"/bodyEnflamed_mc0196.png",
                      @"/bodyEnflamed_mc0197.png",
                      @"/bodyEnflamed_mc0198.png",
                      @"/bodyEnflamed_mc0199.png",
                      @"/bodyEnflamed_mc0200.png",
                      @"/bodyEnflamed_mc0201.png",
                      @"/bodyEnflamed_mc0202.png",
                      @"/bodyEnflamed_mc0203.png",
                      @"/bodyEnflamed_mc0204.png",
                      @"/bodyEnflamed_mc0205.png",
                      @"/bodyEnflamed_mc0206.png",
                      @"/bodyEnflamed_mc0207.png",
                      @"/bodyEnflamed_mc0208.png",
                      @"/bodyEnflamed_mc0209.png",
                      @"/bodyEnflamed_mc0210.png",
                      @"/bodyEnflamed_mc0211.png",
                      @"/bodyEnflamed_mc0212.png",
                      @"/bodyEnflamed_mc0213.png",
                      @"/bodyEnflamed_mc0214.png",
                      @"/bodyEnflamed_mc0215.png",
                      @"/bodyEnflamed_mc0216.png",
                      @"/bodyEnflamed_mc0217.png",
                      @"/bodyEnflamed_mc0218.png",
                      @"/bodyEnflamed_mc0219.png",
                      @"/bodyEnflamed_mc0220.png",
                      @"/bodyEnflamed_mc0221.png",
                      @"/bodyEnflamed_mc0222.png",
                      @"/bodyEnflamed_mc0223.png",
                      @"/bodyEnflamed_mc0224.png",
                      @"/bodyEnflamed_mc0225.png",
                      @"/bodyEnflamed_mc0226.png",
                      @"/bodyEnflamed_mc0227.png",
                      @"/bodyEnflamed_mc0228.png",
                      @"/bodyEnflamed_mc0229.png",
                      @"/bodyEnflamed_mc0230.png",
                      @"/bodyEnflamed_mc0231.png",
                      @"/bodyEnflamed_mc0232.png",
                      @"/bodyEnflamed_mc0233.png",
                      @"/bodyEnflamed_mc0234.png",
                      @"/bodyEnflamed_mc0235.png",
                      @"/bodyEnflamed_mc0236.png",
                      @"/bodyEnflamed_mc0237.png",
                      @"/bodyEnflamed_mc0238.png",
                      @"/bodyEnflamed_mc0239.png",
                      @"/bodyEnflamed_mc0240.png",
                      @"/bodyEnflamed_mc0241.png",
                      @"/bodyEnflamed_mc0242.png",
                      @"/bodyEnflamed_mc0243.png",
                      @"/bodyEnflamed_mc0244.png",
                      @"/bodyEnflamed_mc0245.png",
                      @"/bodyEnflamed_mc0246.png",
                      @"/bodyEnflamed_mc0247.png",
                      @"/bodyEnflamed_mc0248.png",
                      @"/bodyEnflamed_mc0249.png",
                      @"/bodyEnflamed_mc0250.png",
                      @"/bodyEnflamed_mc0251.png",
                      @"/bodyEnflamed_mc0252.png",
                      @"/bodyEnflamed_mc0253.png",
                      @"/bodyEnflamed_mc0254.png",
                      @"/bodyEnflamed_mc0255.png",
                      @"/bodyEnflamed_mc0256.png",
                      @"/bodyEnflamed_mc0257.png",
                      @"/bodyEnflamed_mc0258.png",
                      @"/bodyEnflamed_mc0259.png",
                      @"/bodyEnflamed_mc0260.png",
                      @"/bodyEnflamed_mc0261.png",
                      @"/bodyEnflamed_mc0262.png",
                      @"/bodyEnflamed_mc0263.png",
                      @"/bodyEnflamed_mc0264.png",
                      @"/bodyEnflamed_mc0265.png",
                      @"/bodyEnflamed_mc0266.png",
                      @"/bodyEnflamed_mc0267.png",
                      @"/bodyEnflamed_mc0268.png",
                      @"/bodyEnflamed_mc0269.png",
                      @"/bodyEnflamed_mc0270.png",
                      @"/bodyEnflamed_mc0271.png",
                      @"/bodyEnflamed_mc0272.png",
                      @"/bodyEnflamed_mc0273.png",
                      @"/bodyEnflamed_mc0274.png",
                      @"/bodyEnflamed_mc0275.png",
                      @"/bodyEnflamed_mc0276.png",
                      @"/bodyEnflamed_mc0277.png",
                      @"/bodyEnflamed_mc0278.png",
                      @"/bodyEnflamed_mc0279.png",
                      @"/bodyEnflamed_mc0280.png",
                      @"/bodyEnflamed_mc0281.png",
                      @"/bodyEnflamed_mc0282.png",
                      @"/bodyEnflamed_mc0283.png",
                      @"/bodyEnflamed_mc0284.png",
                      @"/bodyEnflamed_mc0285.png",
                      @"/bodyEnflamed_mc0286.png",
                      @"/bodyEnflamed_mc0287.png",
                      @"/bodyEnflamed_mc0288.png",
                      @"/bodyEnflamed_mc0289.png",
                      @"/bodyEnflamed_mc0290.png",
                      @"/bodyEnflamed_mc0291.png",
                      @"/bodyEnflamed_mc0292.png",
                      @"/bodyEnflamed_mc0293.png",
                      @"/bodyEnflamed_mc0294.png",
                      @"/bodyEnflamed_mc0295.png",
                      @"/bodyEnflamed_mc0296.png",
                      @"/bodyEnflamed_mc0297.png",
                      @"/bodyEnflamed_mc0298.png",
                      @"/bodyEnflamed_mc0299.png",
                      @"/bodyEnflamed_mc0300.png",
                      @"/bodyEnflamed_mc0301.png",
                      @"/bodyEnflamed_mc0302.png",
                      @"/bodyEnflamed_mc0303.png",
                      @"/bodyEnflamed_mc0304.png",
                      @"/bodyEnflamed_mc0305.png",
                      @"/bodyEnflamed_mc0306.png",
                      @"/bodyEnflamed_mc0307.png",
                      @"/bodyEnflamed_mc0308.png",
                      @"/bodyEnflamed_mc0309.png",
                      @"/bodyEnflamed_mc0310.png",
                      @"/bodyEnflamed_mc0311.png",
                      @"/bodyEnflamed_mc0312.png",
                      @"/bodyEnflamed_mc0313.png",
                      @"/bodyEnflamed_mc0314.png",
                      @"/bodyEnflamed_mc0315.png",
                      @"/bodyEnflamed_mc0316.png",
                      @"/bodyEnflamed_mc0317.png",
                      @"/bodyEnflamed_mc0318.png",
                      @"/bodyEnflamed_mc0319.png",
                      @"/bodyEnflamed_mc0320.png",
                      @"/bodyEnflamed_mc0321.png",
                      @"/bodyEnflamed_mc0322.png",
                      @"/bodyEnflamed_mc0323.png",
                      @"/bodyEnflamed_mc0324.png",
                      @"/bodyEnflamed_mc0325.png",
                      @"/bodyEnflamed_mc0326.png",
                      @"/bodyEnflamed_mc0327.png",
                      @"/bodyEnflamed_mc0328.png",
                      @"/bodyEnflamed_mc0329.png",
                      @"/bodyEnflamed_mc0330.png",
                      @"/bodyEnflamed_mc0331.png",
                      @"/bodyEnflamed_mc0332.png",
                      @"/bodyEnflamed_mc0333.png",
                      @"/bodyEnflamed_mc0334.png",
                      @"/bodyEnflamed_mc0335.png",
                      @"/bodyEnflamed_mc0336.png",
                      @"/bodyEnflamed_mc0337.png",
                      @"/bodyEnflamed_mc0338.png",
                      @"/bodyEnflamed_mc0339.png",
                      @"/bodyEnflamed_mc0340.png",
                      @"/bodyEnflamed_mc0341.png",
                      @"/bodyEnflamed_mc0342.png",
                      @"/bodyEnflamed_mc0343.png",
                      @"/bodyEnflamed_mc0344.png",
                      @"/bodyEnflamed_mc0345.png",
                      @"/bodyEnflamed_mc0346.png",
                      @"/bodyEnflamed_mc0347.png",
                      @"/bodyEnflamed_mc0348.png",
                      @"/bodyEnflamed_mc0349.png",
                      @"/bodyEnflamed_mc0350.png",
                      @"/bodyEnflamed_mc0351.png",
                      @"/bodyEnflamed_mc0352.png",
                      @"/bodyEnflamed_mc0353.png",
                      @"/bodyEnflamed_mc0354.png",
                      @"/bodyEnflamed_mc0355.png",
                      @"/bodyEnflamed_mc0356.png",
                      @"/bodyEnflamed_mc0357.png",
                      @"/bodyEnflamed_mc0358.png",
                      @"/bodyEnflamed_mc0359.png",
                      @"/bodyEnflamed_mc0360.png",
                      @"/bodyEnflamed_mc0361.png",
                      @"/bodyEnflamed_mc0362.png",
                      @"/bodyEnflamed_mc0363.png",
                      @"/bodyEnflamed_mc0364.png",
                      @"/bodyEnflamed_mc0365.png",
                      @"/bodyEnflamed_mc0366.png",
                      @"/bodyEnflamed_mc0367.png",
                      @"/bodyEnflamed_mc0368.png",
                      @"/bodyEnflamed_mc0369.png",
                      @"/bodyEnflamed_mc0370.png",
                      @"/bodyEnflamed_mc0371.png",
                      @"/bodyEnflamed_mc0372.png",
                      @"/bodyEnflamed_mc0373.png",
                      @"/bodyEnflamed_mc0374.png",
                      @"/bodyEnflamed_mc0375.png",
                      @"/bodyEnflamed_mc0376.png",
                      @"/bodyEnflamed_mc0377.png",
                      @"/bodyEnflamed_mc0378.png",
                      @"/bodyEnflamed_mc0379.png",
                      @"/bodyEnflamed_mc0380.png",
                      @"/bodyEnflamed_mc0381.png",
                      @"/bodyEnflamed_mc0382.png",
                      @"/bodyEnflamed_mc0383.png",
                      @"/bodyEnflamed_mc0384.png",
                      @"/bodyEnflamed_mc0385.png"];
    
    vasopressorImages = @[@"/vasopressors_mc0001.png",
                          @"/vasopressors_mc0002.png",
                          @"/vasopressors_mc0003.png",
                          @"/vasopressors_mc0004.png",
                          @"/vasopressors_mc0005.png",
                          @"/vasopressors_mc0006.png",
                          @"/vasopressors_mc0007.png",
                          @"/vasopressors_mc0008.png",
                          @"/vasopressors_mc0009.png",
                          @"/vasopressors_mc0010.png",
                          @"/vasopressors_mc0011.png",
                          @"/vasopressors_mc0012.png",
                          @"/vasopressors_mc0013.png",
                          @"/vasopressors_mc0014.png",
                          @"/vasopressors_mc0015.png",
                          @"/vasopressors_mc0016.png",
                          @"/vasopressors_mc0017.png",
                          @"/vasopressors_mc0018.png",
                          @"/vasopressors_mc0019.png",
                          @"/vasopressors_mc0020.png",
                          @"/vasopressors_mc0021.png",
                          @"/vasopressors_mc0022.png",
                          @"/vasopressors_mc0023.png",
                          @"/vasopressors_mc0024.png",
                          @"/vasopressors_mc0025.png",
                          @"/vasopressors_mc0026.png",
                          @"/vasopressors_mc0027.png",
                          @"/vasopressors_mc0028.png",
                          @"/vasopressors_mc0029.png",
                          @"/vasopressors_mc0030.png",
                          @"/vasopressors_mc0031.png",
                          @"/vasopressors_mc0032.png",
                          @"/vasopressors_mc0033.png",
                          @"/vasopressors_mc0034.png",
                          @"/vasopressors_mc0035.png",
                          @"/vasopressors_mc0036.png",
                          @"/vasopressors_mc0037.png",
                          @"/vasopressors_mc0038.png",
                          @"/vasopressors_mc0039.png",
                          @"/vasopressors_mc0040.png",
                          @"/vasopressors_mc0041.png",
                          @"/vasopressors_mc0042.png",
                          @"/vasopressors_mc0043.png",
                          @"/vasopressors_mc0044.png",
                          @"/vasopressors_mc0045.png",
                          @"/vasopressors_mc0046.png",
                          @"/vasopressors_mc0047.png",
                          @"/vasopressors_mc0048.png",
                          @"/vasopressors_mc0049.png",
                          @"/vasopressors_mc0050.png",
                          @"/vasopressors_mc0051.png",
                          @"/vasopressors_mc0052.png",
                          @"/vasopressors_mc0053.png",
                          @"/vasopressors_mc0054.png",
                          @"/vasopressors_mc0055.png",
                          @"/vasopressors_mc0056.png",
                          @"/vasopressors_mc0057.png",
                          @"/vasopressors_mc0058.png",
                          @"/vasopressors_mc0059.png",
                          @"/vasopressors_mc0060.png",
                          @"/vasopressors_mc0061.png",
                          @"/vasopressors_mc0062.png",
                          @"/vasopressors_mc0063.png",
                          @"/vasopressors_mc0064.png",
                          @"/vasopressors_mc0065.png",
                          @"/vasopressors_mc0066.png",
                          @"/vasopressors_mc0067.png",
                          @"/vasopressors_mc0068.png",
                          @"/vasopressors_mc0069.png",
                          @"/vasopressors_mc0070.png",
                          @"/vasopressors_mc0071.png",
                          @"/vasopressors_mc0072.png",
                          @"/vasopressors_mc0073.png",
                          @"/vasopressors_mc0074.png",
                          @"/vasopressors_mc0075.png",
                          @"/vasopressors_mc0076.png",
                          @"/vasopressors_mc0077.png",
                          @"/vasopressors_mc0078.png",
                          @"/vasopressors_mc0079.png",
                          @"/vasopressors_mc0080.png",
                          @"/vasopressors_mc0081.png",
                          @"/vasopressors_mc0082.png",
                          @"/vasopressors_mc0083.png",
                          @"/vasopressors_mc0084.png",
                          @"/vasopressors_mc0085.png",
                          @"/vasopressors_mc0086.png",
                          @"/vasopressors_mc0087.png",
                          @"/vasopressors_mc0088.png",
                          @"/vasopressors_mc0089.png",
                          @"/vasopressors_mc0090.png",
                          @"/vasopressors_mc0091.png",
                          @"/vasopressors_mc0092.png",
                          @"/vasopressors_mc0093.png",
                          @"/vasopressors_mc0094.png",
                          @"/vasopressors_mc0095.png",
                          @"/vasopressors_mc0096.png",
                          @"/vasopressors_mc0097.png",
                          @"/vasopressors_mc0098.png",
                          @"/vasopressors_mc0099.png",
                          @"/vasopressors_mc0100.png",
                          @"/vasopressors_mc0101.png",
                          @"/vasopressors_mc0102.png",
                          @"/vasopressors_mc0103.png",
                          @"/vasopressors_mc0104.png",
                          @"/vasopressors_mc0105.png",
                          @"/vasopressors_mc0106.png",
                          @"/vasopressors_mc0107.png",
                          @"/vasopressors_mc0108.png",
                          @"/vasopressors_mc0109.png",
                          @"/vasopressors_mc0110.png",
                          @"/vasopressors_mc0111.png",
                          @"/vasopressors_mc0112.png",
                          @"/vasopressors_mc0113.png",
                          @"/vasopressors_mc0114.png",
                          @"/vasopressors_mc0115.png",
                          @"/vasopressors_mc0116.png",
                          @"/vasopressors_mc0117.png",
                          @"/vasopressors_mc0118.png",
                          @"/vasopressors_mc0119.png",
                          @"/vasopressors_mc0120.png",
                          @"/vasopressors_mc0121.png",
                          @"/vasopressors_mc0122.png",
                          @"/vasopressors_mc0123.png",
                          @"/vasopressors_mc0124.png",
                          @"/vasopressors_mc0125.png",
                          @"/vasopressors_mc0126.png",
                          @"/vasopressors_mc0127.png",
                          @"/vasopressors_mc0128.png",
                          @"/vasopressors_mc0129.png",
                          @"/vasopressors_mc0130.png",
                          @"/vasopressors_mc0131.png",
                          @"/vasopressors_mc0132.png",
                          @"/vasopressors_mc0133.png",
                          @"/vasopressors_mc0134.png",
                          @"/vasopressors_mc0135.png",
                          @"/vasopressors_mc0136.png",
                          @"/vasopressors_mc0137.png",
                          @"/vasopressors_mc0138.png",
                          @"/vasopressors_mc0139.png",
                          @"/vasopressors_mc0140.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {//antibiotics selected
        [self killSubViews];
        titleLabel.text = @"Antibiotics";
        descriptionLabel.text = @"Attacking the root cause of sepsis, the infection, is done using antibiotics.  Antibiotics kill bacteria and prevent them from spreading without harming the bodies cells.";
        antibioticsView.hidden = NO;
        if (animationTimer == nil)
        {
            animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateAntibiotics) userInfo:nil repeats:YES];
        }
    } else if (button.tag == 1)
    {//iv selected
        [self killSubViews];
        titleLabel.text = @"Intravenous fluids";
        descriptionLabel.text = @"";
        ivView.hidden = NO;
        if (animationTimer == nil)
        {
            animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateIV) userInfo:nil repeats:YES];
        }
    } else if (button.tag == 2)
    {//vasopressors selected
        [self killSubViews];
        titleLabel.text = @"Vasopressors";
        descriptionLabel.text = @"If blood pressure is low, or lactate levels remain high after fluids are given, medicines that constrict blood vessels are given, which raise blood pressure.";
        vasopressorView.hidden = NO;
        if (animationTimer == nil)
        {
            animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateVasopressors) userInfo:nil repeats:YES];
        }
    } else if (button.tag == 3)
    {//steroids selected
        [self killSubViews];
        titleLabel.text = @"Steroids";
        descriptionLabel.text = @"";
        steroidView.hidden = NO;
        if (animationTimer == nil)
        {
            animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateSteroids) userInfo:nil repeats:YES];
        }
    }
}

-(void)animateAntibiotics
{
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[antibioticsImages objectAtIndex:animationCounter]];
    antibioticsAnimation.image = nil;
    antibioticsAnimation.image = [UIImage imageWithContentsOfFile:fullpath];
    animationCounter ++;
    if (animationCounter == 270)
    {
        animationCounter = 0;
    }
}

-(void)animateIV
{
    NSString *fullPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[ivImages objectAtIndex:animationCounter]];
    ivAnimation.image = nil;
    ivAnimation.image = [UIImage imageWithContentsOfFile:fullPath];
    animationCounter ++;
    if (animationCounter == 87)
    {
        animationCounter = 0;
    }
}

-(void)animateSteroids
{
    NSString *fullPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[steroidImages objectAtIndex:animationCounter]];
    steroidAnimation.image = nil;
    steroidAnimation.image = [UIImage imageWithContentsOfFile:fullPath];
    animationCounter ++;
    if (animationCounter == 385)
    {
        animationCounter = 0;
    }
}

-(void)animateVasopressors
{
    NSString *fullPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[vasopressorImages objectAtIndex:animationCounter]];
    vasopressorAnimation.image = nil;
    vasopressorAnimation.image = [UIImage imageWithContentsOfFile:fullPath];
    animationCounter ++;
    if (animationCounter == 140)
    {
        animationCounter = 0;
    }
}

-(void)killSubViews
{
    animationCounter = 0;
    [animationTimer invalidate];
    animationTimer = nil;
    antibioticsView.hidden = YES;
    ivView.hidden = YES;
    steroidView.hidden = YES;
    vasopressorView.hidden = YES;
}

-(void)resetAll
{
    animationCounter = 0;
    [animationTimer invalidate];
    animationTimer = nil;
    antibioticsView.hidden = YES;
    ivView.hidden = YES;
    steroidView.hidden = YES;
    vasopressorView.hidden = YES;
    titleLabel.text = @"Treatments for sepsis";
    descriptionLabel.text = @"Sepsis is treated with one or all of the below treatments, depending on the severity.  Sometimes surgery is needed to eliminate the infection.  Tap a button below to get a better look!";
}
@end
