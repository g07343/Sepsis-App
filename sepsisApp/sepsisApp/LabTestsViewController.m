//
//  LabTestsViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/12/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "LabTestsViewController.h"

@interface LabTestsViewController ()

@end

@implementation LabTestsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lactateView.hidden = YES;
    whiteCellView.hidden = YES;
    procalView.hidden = YES;
	animationCounter = 0;
    //need to manually set font size depending on device since it's dynamically controlled
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        [lactateDescription setFont:[UIFont boldSystemFontOfSize:19]];
    } else {
        [lactateDescription setFont:[UIFont boldSystemFontOfSize:11]];
    }
    
    //set up our image arrays for animations
    whiteCellImages = @[@"/highWhite_mc0001.png",
                        @"/highWhite_mc0002.png",
                        @"/highWhite_mc0003.png",
                        @"/highWhite_mc0004.png",
                        @"/highWhite_mc0005.png",
                        @"/highWhite_mc0006.png",
                        @"/highWhite_mc0007.png",
                        @"/highWhite_mc0008.png",
                        @"/highWhite_mc0009.png",
                        @"/highWhite_mc0010.png",
                        @"/highWhite_mc0011.png",
                        @"/highWhite_mc0012.png",
                        @"/highWhite_mc0013.png",
                        @"/highWhite_mc0014.png",
                        @"/highWhite_mc0015.png",
                        @"/highWhite_mc0016.png",
                        @"/highWhite_mc0017.png",
                        @"/highWhite_mc0018.png",
                        @"/highWhite_mc0019.png",
                        @"/highWhite_mc0020.png",
                        @"/highWhite_mc0021.png",
                        @"/highWhite_mc0022.png",
                        @"/highWhite_mc0023.png",
                        @"/highWhite_mc0024.png",
                        @"/highWhite_mc0025.png",
                        @"/highWhite_mc0026.png",
                        @"/highWhite_mc0027.png",
                        @"/highWhite_mc0028.png",
                        @"/highWhite_mc0029.png",
                        @"/highWhite_mc0030.png",
                        @"/highWhite_mc0031.png",
                        @"/highWhite_mc0032.png",
                        @"/highWhite_mc0033.png",
                        @"/highWhite_mc0034.png",
                        @"/highWhite_mc0035.png",
                        @"/highWhite_mc0036.png",
                        @"/highWhite_mc0037.png",
                        @"/highWhite_mc0038.png",
                        @"/highWhite_mc0039.png",
                        @"/highWhite_mc0040.png",
                        @"/highWhite_mc0041.png",
                        @"/highWhite_mc0042.png",
                        @"/highWhite_mc0043.png",
                        @"/highWhite_mc0044.png",
                        @"/highWhite_mc0045.png",
                        @"/highWhite_mc0046.png",
                        @"/highWhite_mc0047.png",
                        @"/highWhite_mc0048.png",
                        @"/highWhite_mc0049.png",
                        @"/highWhite_mc0050.png",
                        @"/highWhite_mc0051.png",
                        @"/highWhite_mc0052.png",
                        @"/highWhite_mc0053.png",
                        @"/highWhite_mc0054.png",
                        @"/highWhite_mc0055.png",
                        @"/highWhite_mc0056.png",
                        @"/highWhite_mc0057.png",
                        @"/highWhite_mc0058.png",
                        @"/highWhite_mc0059.png",
                        @"/highWhite_mc0060.png",
                        @"/highWhite_mc0061.png",
                        @"/highWhite_mc0062.png",
                        @"/highWhite_mc0063.png",
                        @"/highWhite_mc0064.png",
                        @"/highWhite_mc0065.png",
                        @"/highWhite_mc0066.png",
                        @"/highWhite_mc0067.png",
                        @"/highWhite_mc0068.png",
                        @"/highWhite_mc0069.png",
                        @"/highWhite_mc0070.png",
                        @"/highWhite_mc0071.png",
                        @"/highWhite_mc0072.png",
                        @"/highWhite_mc0073.png",
                        @"/highWhite_mc0074.png",
                        @"/highWhite_mc0075.png",
                        @"/highWhite_mc0076.png",
                        @"/highWhite_mc0077.png",
                        @"/highWhite_mc0078.png",
                        @"/highWhite_mc0079.png",
                        @"/highWhite_mc0080.png",
                        @"/highWhite_mc0081.png",
                        @"/highWhite_mc0082.png",
                        @"/highWhite_mc0083.png",
                        @"/highWhite_mc0084.png",
                        @"/highWhite_mc0085.png",
                        @"/highWhite_mc0086.png",
                        @"/highWhite_mc0087.png",
                        @"/highWhite_mc0088.png",
                        @"/highWhite_mc0089.png",
                        @"/highWhite_mc0090.png",
                        @"/highWhite_mc0091.png",
                        @"/highWhite_mc0092.png",
                        @"/highWhite_mc0093.png",
                        @"/highWhite_mc0094.png",
                        @"/highWhite_mc0095.png",
                        @"/highWhite_mc0096.png",
                        @"/highWhite_mc0097.png",
                        @"/highWhite_mc0098.png",
                        @"/highWhite_mc0099.png",
                        @"/highWhite_mc0100.png",
                        @"/highWhite_mc0101.png",
                        @"/highWhite_mc0102.png",
                        @"/highWhite_mc0103.png",
                        @"/highWhite_mc0104.png",
                        @"/highWhite_mc0105.png",
                        @"/highWhite_mc0106.png",
                        @"/highWhite_mc0107.png",
                        @"/highWhite_mc0108.png",
                        @"/highWhite_mc0109.png",
                        @"/highWhite_mc0110.png",
                        @"/highWhite_mc0111.png",
                        @"/highWhite_mc0112.png",
                        @"/highWhite_mc0113.png",
                        @"/highWhite_mc0114.png",
                        @"/highWhite_mc0115.png",
                        @"/highWhite_mc0116.png",
                        @"/highWhite_mc0117.png",
                        @"/highWhite_mc0118.png",
                        @"/highWhite_mc0119.png",
                        @"/highWhite_mc0120.png",
                        @"/highWhite_mc0121.png",
                        @"/highWhite_mc0122.png",
                        @"/highWhite_mc0123.png",
                        @"/highWhite_mc0124.png",
                        @"/highWhite_mc0125.png",
                        @"/highWhite_mc0126.png",
                        @"/highWhite_mc0127.png",
                        @"/highWhite_mc0128.png",
                        @"/highWhite_mc0129.png",
                        @"/highWhite_mc0130.png",
                        @"/highWhite_mc0131.png",
                        @"/highWhite_mc0132.png",
                        @"/highWhite_mc0133.png",
                        @"/highWhite_mc0134.png",
                        @"/highWhite_mc0135.png",
                        @"/highWhite_mc0136.png",
                        @"/highWhite_mc0137.png",
                        @"/highWhite_mc0138.png",
                        @"/highWhite_mc0139.png",
                        @"/highWhite_mc0140.png",
                        @"/highWhite_mc0141.png",
                        @"/highWhite_mc0142.png",
                        @"/highWhite_mc0143.png",
                        @"/highWhite_mc0144.png",
                        @"/highWhite_mc0145.png",
                        @"/highWhite_mc0146.png",
                        @"/highWhite_mc0147.png",
                        @"/highWhite_mc0148.png",
                        @"/highWhite_mc0149.png",
                        @"/highWhite_mc0150.png",
                        @"/highWhite_mc0151.png",
                        @"/highWhite_mc0152.png",
                        @"/highWhite_mc0153.png",
                        @"/highWhite_mc0154.png",
                        @"/highWhite_mc0155.png",
                        @"/highWhite_mc0156.png",
                        @"/highWhite_mc0157.png",
                        @"/highWhite_mc0158.png",
                        @"/highWhite_mc0159.png",
                        @"/highWhite_mc0160.png",
                        @"/highWhite_mc0161.png",
                        @"/highWhite_mc0162.png",
                        @"/highWhite_mc0163.png",
                        @"/highWhite_mc0164.png",
                        @"/highWhite_mc0165.png",
                        @"/highWhite_mc0166.png",
                        @"/highWhite_mc0167.png",
                        @"/highWhite_mc0168.png",
                        @"/highWhite_mc0169.png",
                        @"/highWhite_mc0170.png",
                        @"/highWhite_mc0171.png",
                        @"/highWhite_mc0172.png",
                        @"/highWhite_mc0173.png",
                        @"/highWhite_mc0174.png",
                        @"/highWhite_mc0175.png",
                        @"/highWhite_mc0176.png",
                        @"/highWhite_mc0177.png",
                        @"/highWhite_mc0178.png",
                        @"/highWhite_mc0179.png",
                        @"/highWhite_mc0180.png",
                        @"/highWhite_mc0181.png",
                        @"/highWhite_mc0182.png",
                        @"/highWhite_mc0183.png",
                        @"/highWhite_mc0184.png",
                        @"/highWhite_mc0185.png",
                        @"/highWhite_mc0186.png",
                        @"/highWhite_mc0187.png",
                        @"/highWhite_mc0188.png",
                        @"/highWhite_mc0189.png",
                        @"/highWhite_mc0190.png",
                        @"/highWhite_mc0191.png",
                        @"/highWhite_mc0192.png",
                        @"/highWhite_mc0193.png",
                        @"/highWhite_mc0194.png",
                        @"/highWhite_mc0195.png",
                        @"/highWhite_mc0196.png",
                        @"/highWhite_mc0197.png",
                        @"/highWhite_mc0198.png",
                        @"/highWhite_mc0199.png",
                        @"/highWhite_mc0200.png",
                        @"/highWhite_mc0201.png",
                        @"/highWhite_mc0202.png",
                        @"/highWhite_mc0203.png",
                        @"/highWhite_mc0204.png",
                        @"/highWhite_mc0205.png",
                        @"/highWhite_mc0206.png",
                        @"/highWhite_mc0207.png",
                        @"/highWhite_mc0208.png",
                        @"/highWhite_mc0209.png",
                        @"/highWhite_mc0210.png",
                        @"/highWhite_mc0211.png",
                        @"/highWhite_mc0212.png",
                        @"/highWhite_mc0213.png",
                        @"/highWhite_mc0214.png",
                        @"/highWhite_mc0215.png",
                        @"/highWhite_mc0216.png",
                        @"/highWhite_mc0217.png",
                        @"/highWhite_mc0218.png",
                        @"/highWhite_mc0219.png",
                        @"/highWhite_mc0220.png",
                        @"/highWhite_mc0221.png",
                        @"/highWhite_mc0222.png",
                        @"/highWhite_mc0223.png",
                        @"/highWhite_mc0224.png",
                        @"/highWhite_mc0225.png",
                        @"/highWhite_mc0226.png",
                        @"/highWhite_mc0227.png",
                        @"/highWhite_mc0228.png",
                        @"/highWhite_mc0229.png",
                        @"/highWhite_mc0230.png",
                        @"/highWhite_mc0231.png",
                        @"/highWhite_mc0232.png",
                        @"/highWhite_mc0233.png",
                        @"/highWhite_mc0234.png",
                        @"/highWhite_mc0235.png",
                        @"/highWhite_mc0236.png",
                        @"/highWhite_mc0237.png",
                        @"/highWhite_mc0238.png",
                        @"/highWhite_mc0239.png",
                        @"/highWhite_mc0240.png",
                        @"/highWhite_mc0241.png",
                        @"/highWhite_mc0242.png",
                        @"/highWhite_mc0243.png",
                        @"/highWhite_mc0244.png",
                        @"/highWhite_mc0245.png",
                        @"/highWhite_mc0246.png",
                        @"/highWhite_mc0247.png",
                        @"/highWhite_mc0248.png",
                        @"/highWhite_mc0249.png",
                        @"/highWhite_mc0250.png",
                        @"/highWhite_mc0251.png",
                        @"/highWhite_mc0252.png",
                        @"/highWhite_mc0253.png",
                        @"/highWhite_mc0254.png",
                        @"/highWhite_mc0255.png",
                        @"/highWhite_mc0256.png",
                        @"/highWhite_mc0257.png",
                        @"/highWhite_mc0258.png",
                        @"/highWhite_mc0259.png",
                        @"/highWhite_mc0260.png",
                        @"/highWhite_mc0261.png",
                        @"/highWhite_mc0262.png",
                        @"/highWhite_mc0263.png",
                        @"/highWhite_mc0264.png",
                        @"/highWhite_mc0265.png",
                        @"/highWhite_mc0266.png",
                        @"/highWhite_mc0267.png",
                        @"/highWhite_mc0268.png",
                        @"/highWhite_mc0269.png",
                        @"/highWhite_mc0270.png",
                        @"/highWhite_mc0271.png",
                        @"/highWhite_mc0272.png",
                        @"/highWhite_mc0273.png",
                        @"/highWhite_mc0274.png",
                        @"/highWhite_mc0275.png",
                        @"/highWhite_mc0276.png",
                        @"/highWhite_mc0277.png",
                        @"/highWhite_mc0278.png",
                        @"/highWhite_mc0279.png",
                        @"/highWhite_mc0280.png",
                        @"/highWhite_mc0281.png",
                        @"/highWhite_mc0282.png",
                        @"/highWhite_mc0283.png",
                        @"/highWhite_mc0284.png",
                        @"/highWhite_mc0285.png",
                        @"/highWhite_mc0286.png",
                        @"/highWhite_mc0287.png",
                        @"/highWhite_mc0288.png",
                        @"/highWhite_mc0289.png",
                        @"/highWhite_mc0290.png",
                        @"/highWhite_mc0291.png",
                        @"/highWhite_mc0292.png",
                        @"/highWhite_mc0293.png",
                        @"/highWhite_mc0294.png",
                        @"/highWhite_mc0295.png",
                        @"/highWhite_mc0296.png",
                        @"/highWhite_mc0297.png",
                        @"/highWhite_mc0298.png",
                        @"/highWhite_mc0299.png",
                        @"/highWhite_mc0300.png",
                        @"/highWhite_mc0301.png",
                        @"/highWhite_mc0302.png",
                        @"/highWhite_mc0303.png",
                        @"/highWhite_mc0304.png",
                        @"/highWhite_mc0305.png",
                        @"/highWhite_mc0306.png",
                        @"/highWhite_mc0307.png",
                        @"/highWhite_mc0308.png",
                        @"/highWhite_mc0309.png",
                        @"/highWhite_mc0310.png",
                        @"/highWhite_mc0311.png",
                        @"/highWhite_mc0312.png",
                        @"/highWhite_mc0313.png",
                        @"/highWhite_mc0314.png",
                        @"/highWhite_mc0315.png",
                        @"/highWhite_mc0316.png",
                        @"/highWhite_mc0317.png",
                        @"/highWhite_mc0318.png",
                        @"/highWhite_mc0319.png",
                        @"/highWhite_mc0320.png",
                        @"/highWhite_mc0321.png",
                        @"/highWhite_mc0322.png",
                        @"/highWhite_mc0323.png",
                        @"/highWhite_mc0324.png",
                        @"/highWhite_mc0325.png",
                        @"/highWhite_mc0326.png",
                        @"/highWhite_mc0327.png",
                        @"/highWhite_mc0328.png",
                        @"/highWhite_mc0329.png",
                        @"/highWhite_mc0330.png",
                        @"/highWhite_mc0331.png",
                        @"/highWhite_mc0332.png",
                        @"/highWhite_mc0333.png",
                        @"/highWhite_mc0334.png",
                        @"/highWhite_mc0335.png",
                        @"/highWhite_mc0336.png",
                        @"/highWhite_mc0337.png",
                        @"/highWhite_mc0338.png",
                        @"/highWhite_mc0339.png",
                        @"/highWhite_mc0340.png",
                        @"/highWhite_mc0341.png",
                        @"/highWhite_mc0342.png",
                        @"/highWhite_mc0343.png",
                        @"/highWhite_mc0344.png",
                        @"/highWhite_mc0345.png",
                        @"/highWhite_mc0346.png",
                        @"/highWhite_mc0347.png",
                        @"/highWhite_mc0348.png",
                        @"/highWhite_mc0349.png",
                        @"/highWhite_mc0350.png",
                        @"/highWhite_mc0351.png",
                        @"/highWhite_mc0352.png",
                        @"/highWhite_mc0353.png",
                        @"/highWhite_mc0354.png",
                        @"/highWhite_mc0355.png",
                        @"/highWhite_mc0356.png",
                        @"/highWhite_mc0357.png",
                        @"/highWhite_mc0358.png",
                        @"/highWhite_mc0359.png",
                        @"/highWhite_mc0360.png",
                        @"/highWhite_mc0361.png",
                        @"/highWhite_mc0362.png",
                        @"/highWhite_mc0363.png",
                        @"/highWhite_mc0364.png",
                        @"/highWhite_mc0365.png",
                        @"/highWhite_mc0366.png",
                        @"/highWhite_mc0367.png",
                        @"/highWhite_mc0368.png",
                        @"/highWhite_mc0369.png",
                        @"/highWhite_mc0370.png",
                        @"/highWhite_mc0371.png",
                        @"/highWhite_mc0372.png",
                        @"/highWhite_mc0373.png",
                        @"/highWhite_mc0374.png",
                        @"/highWhite_mc0375.png",
                        @"/highWhite_mc0376.png",
                        @"/highWhite_mc0377.png",
                        @"/highWhite_mc0378.png",
                        @"/highWhite_mc0379.png",
                        @"/highWhite_mc0380.png",
                        @"/highWhite_mc0381.png",
                        @"/highWhite_mc0382.png",
                        @"/highWhite_mc0383.png",
                        @"/highWhite_mc0384.png",
                        @"/highWhite_mc0385.png",
                        @"/highWhite_mc0386.png",
                        @"/highWhite_mc0387.png",
                        @"/highWhite_mc0388.png",
                        @"/highWhite_mc0389.png",
                        @"/highWhite_mc0390.png",
                        @"/highWhite_mc0391.png",
                        @"/highWhite_mc0392.png",
                        @"/highWhite_mc0393.png",
                        @"/highWhite_mc0394.png",
                        @"/highWhite_mc0395.png",
                        @"/highWhite_mc0396.png",
                        @"/highWhite_mc0397.png",
                        @"/highWhite_mc0398.png",
                        @"/highWhite_mc0399.png",
                        @"/highWhite_mc0400.png",
                        @"/highWhite_mc0401.png",
                        @"/highWhite_mc0402.png",
                        @"/highWhite_mc0403.png",
                        @"/highWhite_mc0404.png",
                        @"/highWhite_mc0405.png",
                        @"/highWhite_mc0406.png",
                        @"/highWhite_mc0407.png",
                        @"/highWhite_mc0408.png",
                        @"/highWhite_mc0409.png",
                        @"/highWhite_mc0410.png",
                        @"/highWhite_mc0411.png",
                        @"/highWhite_mc0412.png",
                        @"/highWhite_mc0413.png",
                        @"/highWhite_mc0414.png",
                        @"/highWhite_mc0415.png",
                        @"/highWhite_mc0416.png",
                        @"/highWhite_mc0417.png",
                        @"/highWhite_mc0418.png",
                        @"/highWhite_mc0419.png",
                        @"/highWhite_mc0420.png"];
    
    procalImages = @[@"/procalDemo_mc0001.png",
                     @"/procalDemo_mc0002.png",
                     @"/procalDemo_mc0003.png",
                     @"/procalDemo_mc0004.png",
                     @"/procalDemo_mc0005.png",
                     @"/procalDemo_mc0006.png",
                     @"/procalDemo_mc0007.png",
                     @"/procalDemo_mc0008.png",
                     @"/procalDemo_mc0009.png",
                     @"/procalDemo_mc0010.png",
                     @"/procalDemo_mc0011.png",
                     @"/procalDemo_mc0012.png",
                     @"/procalDemo_mc0013.png",
                     @"/procalDemo_mc0014.png",
                     @"/procalDemo_mc0015.png",
                     @"/procalDemo_mc0016.png",
                     @"/procalDemo_mc0017.png",
                     @"/procalDemo_mc0018.png",
                     @"/procalDemo_mc0019.png",
                     @"/procalDemo_mc0020.png",
                     @"/procalDemo_mc0021.png",
                     @"/procalDemo_mc0022.png",
                     @"/procalDemo_mc0023.png",
                     @"/procalDemo_mc0024.png",
                     @"/procalDemo_mc0025.png",
                     @"/procalDemo_mc0026.png",
                     @"/procalDemo_mc0027.png",
                     @"/procalDemo_mc0028.png",
                     @"/procalDemo_mc0029.png",
                     @"/procalDemo_mc0030.png",
                     @"/procalDemo_mc0031.png",
                     @"/procalDemo_mc0032.png",
                     @"/procalDemo_mc0033.png",
                     @"/procalDemo_mc0034.png",
                     @"/procalDemo_mc0035.png",
                     @"/procalDemo_mc0036.png",
                     @"/procalDemo_mc0037.png",
                     @"/procalDemo_mc0038.png",
                     @"/procalDemo_mc0039.png",
                     @"/procalDemo_mc0040.png",
                     @"/procalDemo_mc0041.png",
                     @"/procalDemo_mc0042.png",
                     @"/procalDemo_mc0043.png",
                     @"/procalDemo_mc0044.png",
                     @"/procalDemo_mc0045.png",
                     @"/procalDemo_mc0046.png",
                     @"/procalDemo_mc0047.png",
                     @"/procalDemo_mc0048.png",
                     @"/procalDemo_mc0049.png",
                     @"/procalDemo_mc0050.png",
                     @"/procalDemo_mc0051.png",
                     @"/procalDemo_mc0052.png",
                     @"/procalDemo_mc0053.png",
                     @"/procalDemo_mc0054.png",
                     @"/procalDemo_mc0055.png",
                     @"/procalDemo_mc0056.png",
                     @"/procalDemo_mc0057.png",
                     @"/procalDemo_mc0058.png",
                     @"/procalDemo_mc0059.png",
                     @"/procalDemo_mc0060.png",
                     @"/procalDemo_mc0061.png",
                     @"/procalDemo_mc0062.png",
                     @"/procalDemo_mc0063.png",
                     @"/procalDemo_mc0064.png",
                     @"/procalDemo_mc0065.png",
                     @"/procalDemo_mc0066.png",
                     @"/procalDemo_mc0067.png",
                     @"/procalDemo_mc0068.png",
                     @"/procalDemo_mc0069.png",
                     @"/procalDemo_mc0070.png",
                     @"/procalDemo_mc0071.png",
                     @"/procalDemo_mc0072.png",
                     @"/procalDemo_mc0073.png",
                     @"/procalDemo_mc0074.png",
                     @"/procalDemo_mc0075.png",
                     @"/procalDemo_mc0076.png",
                     @"/procalDemo_mc0077.png",
                     @"/procalDemo_mc0078.png",
                     @"/procalDemo_mc0079.png",
                     @"/procalDemo_mc0080.png",
                     @"/procalDemo_mc0081.png",
                     @"/procalDemo_mc0082.png",
                     @"/procalDemo_mc0083.png",
                     @"/procalDemo_mc0084.png",
                     @"/procalDemo_mc0085.png",
                     @"/procalDemo_mc0086.png",
                     @"/procalDemo_mc0087.png",
                     @"/procalDemo_mc0088.png",
                     @"/procalDemo_mc0089.png",
                     @"/procalDemo_mc0090.png",
                     @"/procalDemo_mc0091.png",
                     @"/procalDemo_mc0092.png",
                     @"/procalDemo_mc0093.png",
                     @"/procalDemo_mc0094.png",
                     @"/procalDemo_mc0095.png",
                     @"/procalDemo_mc0096.png",
                     @"/procalDemo_mc0097.png",
                     @"/procalDemo_mc0098.png",
                     @"/procalDemo_mc0099.png",
                     @"/procalDemo_mc0100.png",
                     @"/procalDemo_mc0101.png",
                     @"/procalDemo_mc0102.png",
                     @"/procalDemo_mc0103.png",
                     @"/procalDemo_mc0104.png",
                     @"/procalDemo_mc0105.png",
                     @"/procalDemo_mc0106.png",
                     @"/procalDemo_mc0107.png",
                     @"/procalDemo_mc0108.png",
                     @"/procalDemo_mc0109.png",
                     @"/procalDemo_mc0110.png",
                     @"/procalDemo_mc0111.png",
                     @"/procalDemo_mc0112.png",
                     @"/procalDemo_mc0113.png",
                     @"/procalDemo_mc0114.png",
                     @"/procalDemo_mc0115.png",
                     @"/procalDemo_mc0116.png",
                     @"/procalDemo_mc0117.png",
                     @"/procalDemo_mc0118.png",
                     @"/procalDemo_mc0119.png",
                     @"/procalDemo_mc0120.png",
                     @"/procalDemo_mc0121.png",
                     @"/procalDemo_mc0122.png",
                     @"/procalDemo_mc0123.png",
                     @"/procalDemo_mc0124.png",
                     @"/procalDemo_mc0125.png",
                     @"/procalDemo_mc0126.png",
                     @"/procalDemo_mc0127.png",
                     @"/procalDemo_mc0128.png",
                     @"/procalDemo_mc0129.png",
                     @"/procalDemo_mc0130.png",
                     @"/procalDemo_mc0131.png",
                     @"/procalDemo_mc0132.png",
                     @"/procalDemo_mc0133.png",
                     @"/procalDemo_mc0134.png",
                     @"/procalDemo_mc0135.png",
                     @"/procalDemo_mc0136.png",
                     @"/procalDemo_mc0137.png",
                     @"/procalDemo_mc0138.png",
                     @"/procalDemo_mc0139.png",
                     @"/procalDemo_mc0140.png",
                     @"/procalDemo_mc0141.png",
                     @"/procalDemo_mc0142.png",
                     @"/procalDemo_mc0143.png",
                     @"/procalDemo_mc0144.png",
                     @"/procalDemo_mc0145.png",
                     @"/procalDemo_mc0146.png",
                     @"/procalDemo_mc0147.png",
                     @"/procalDemo_mc0148.png",
                     @"/procalDemo_mc0149.png",
                     @"/procalDemo_mc0150.png",
                     @"/procalDemo_mc0151.png",
                     @"/procalDemo_mc0152.png",
                     @"/procalDemo_mc0153.png",
                     @"/procalDemo_mc0154.png",
                     @"/procalDemo_mc0155.png",
                     @"/procalDemo_mc0156.png",
                     @"/procalDemo_mc0157.png",
                     @"/procalDemo_mc0158.png",
                     @"/procalDemo_mc0159.png",
                     @"/procalDemo_mc0160.png",
                     @"/procalDemo_mc0161.png",
                     @"/procalDemo_mc0162.png",
                     @"/procalDemo_mc0163.png",
                     @"/procalDemo_mc0164.png",
                     @"/procalDemo_mc0165.png",
                     @"/procalDemo_mc0166.png",
                     @"/procalDemo_mc0167.png",
                     @"/procalDemo_mc0168.png",
                     @"/procalDemo_mc0169.png",
                     @"/procalDemo_mc0170.png",
                     @"/procalDemo_mc0171.png",
                     @"/procalDemo_mc0172.png",
                     @"/procalDemo_mc0173.png",
                     @"/procalDemo_mc0174.png",
                     @"/procalDemo_mc0175.png",
                     @"/procalDemo_mc0176.png",
                     @"/procalDemo_mc0177.png",
                     @"/procalDemo_mc0178.png",
                     @"/procalDemo_mc0179.png",
                     @"/procalDemo_mc0180.png",
                     @"/procalDemo_mc0181.png",
                     @"/procalDemo_mc0182.png",
                     @"/procalDemo_mc0183.png",
                     @"/procalDemo_mc0184.png",
                     @"/procalDemo_mc0185.png",
                     @"/procalDemo_mc0186.png",
                     @"/procalDemo_mc0187.png",
                     @"/procalDemo_mc0188.png",
                     @"/procalDemo_mc0189.png",
                     @"/procalDemo_mc0190.png",
                     @"/procalDemo_mc0191.png",
                     @"/procalDemo_mc0192.png",
                     @"/procalDemo_mc0193.png",
                     @"/procalDemo_mc0194.png",
                     @"/procalDemo_mc0195.png",
                     @"/procalDemo_mc0196.png",
                     @"/procalDemo_mc0197.png",
                     @"/procalDemo_mc0198.png",
                     @"/procalDemo_mc0199.png",
                     @"/procalDemo_mc0200.png",
                     @"/procalDemo_mc0201.png",
                     @"/procalDemo_mc0202.png",
                     @"/procalDemo_mc0203.png",
                     @"/procalDemo_mc0204.png",
                     @"/procalDemo_mc0205.png",
                     @"/procalDemo_mc0206.png",
                     @"/procalDemo_mc0207.png",
                     @"/procalDemo_mc0208.png",
                     @"/procalDemo_mc0209.png",
                     @"/procalDemo_mc0210.png",
                     @"/procalDemo_mc0211.png",
                     @"/procalDemo_mc0212.png",
                     @"/procalDemo_mc0213.png",
                     @"/procalDemo_mc0214.png",
                     @"/procalDemo_mc0215.png",
                     @"/procalDemo_mc0216.png",
                     @"/procalDemo_mc0217.png",
                     @"/procalDemo_mc0218.png",
                     @"/procalDemo_mc0219.png",
                     @"/procalDemo_mc0220.png",
                     @"/procalDemo_mc0221.png",
                     @"/procalDemo_mc0222.png",
                     @"/procalDemo_mc0223.png",
                     @"/procalDemo_mc0224.png",
                     @"/procalDemo_mc0225.png",
                     @"/procalDemo_mc0226.png",
                     @"/procalDemo_mc0227.png",
                     @"/procalDemo_mc0228.png",
                     @"/procalDemo_mc0229.png",
                     @"/procalDemo_mc0230.png",
                     @"/procalDemo_mc0231.png",
                     @"/procalDemo_mc0232.png",
                     @"/procalDemo_mc0233.png",
                     @"/procalDemo_mc0234.png",
                     @"/procalDemo_mc0235.png",
                     @"/procalDemo_mc0236.png",
                     @"/procalDemo_mc0237.png",
                     @"/procalDemo_mc0238.png",
                     @"/procalDemo_mc0239.png",
                     @"/procalDemo_mc0240.png",
                     @"/procalDemo_mc0241.png",
                     @"/procalDemo_mc0242.png",
                     @"/procalDemo_mc0243.png",
                     @"/procalDemo_mc0244.png",
                     @"/procalDemo_mc0245.png",
                     @"/procalDemo_mc0246.png",
                     @"/procalDemo_mc0247.png",
                     @"/procalDemo_mc0248.png",
                     @"/procalDemo_mc0249.png",
                     @"/procalDemo_mc0250.png",
                     @"/procalDemo_mc0251.png",
                     @"/procalDemo_mc0252.png",
                     @"/procalDemo_mc0253.png",
                     @"/procalDemo_mc0254.png",
                     @"/procalDemo_mc0255.png",
                     @"/procalDemo_mc0256.png",
                     @"/procalDemo_mc0257.png",
                     @"/procalDemo_mc0258.png",
                     @"/procalDemo_mc0259.png",
                     @"/procalDemo_mc0260.png",
                     @"/procalDemo_mc0261.png",
                     @"/procalDemo_mc0262.png",
                     @"/procalDemo_mc0263.png",
                     @"/procalDemo_mc0264.png",
                     @"/procalDemo_mc0265.png",
                     @"/procalDemo_mc0266.png",
                     @"/procalDemo_mc0267.png",
                     @"/procalDemo_mc0268.png",
                     @"/procalDemo_mc0269.png",
                     @"/procalDemo_mc0270.png",
                     @"/procalDemo_mc0271.png",
                     @"/procalDemo_mc0272.png",
                     @"/procalDemo_mc0273.png",
                     @"/procalDemo_mc0274.png",
                     @"/procalDemo_mc0275.png",
                     @"/procalDemo_mc0276.png",
                     @"/procalDemo_mc0277.png",
                     @"/procalDemo_mc0278.png",
                     @"/procalDemo_mc0279.png",
                     @"/procalDemo_mc0280.png",
                     @"/procalDemo_mc0281.png",
                     @"/procalDemo_mc0282.png",
                     @"/procalDemo_mc0283.png",
                     @"/procalDemo_mc0284.png",
                     @"/procalDemo_mc0285.png",
                     @"/procalDemo_mc0286.png",
                     @"/procalDemo_mc0287.png",
                     @"/procalDemo_mc0288.png",
                     @"/procalDemo_mc0289.png",
                     @"/procalDemo_mc0290.png",
                     @"/procalDemo_mc0291.png",
                     @"/procalDemo_mc0292.png",
                     @"/procalDemo_mc0293.png",
                     @"/procalDemo_mc0294.png",
                     @"/procalDemo_mc0295.png",
                     @"/procalDemo_mc0296.png",
                     @"/procalDemo_mc0297.png",
                     @"/procalDemo_mc0298.png",
                     @"/procalDemo_mc0299.png",
                     @"/procalDemo_mc0300.png",
                     @"/procalDemo_mc0301.png",
                     @"/procalDemo_mc0302.png",
                     @"/procalDemo_mc0303.png",
                     @"/procalDemo_mc0304.png",
                     @"/procalDemo_mc0305.png",
                     @"/procalDemo_mc0306.png",
                     @"/procalDemo_mc0307.png",
                     @"/procalDemo_mc0308.png",
                     @"/procalDemo_mc0309.png",
                     @"/procalDemo_mc0310.png",
                     @"/procalDemo_mc0311.png",
                     @"/procalDemo_mc0312.png",
                     @"/procalDemo_mc0313.png",
                     @"/procalDemo_mc0314.png",
                     @"/procalDemo_mc0315.png",
                     @"/procalDemo_mc0316.png",
                     @"/procalDemo_mc0317.png",
                     @"/procalDemo_mc0318.png",
                     @"/procalDemo_mc0319.png",
                     @"/procalDemo_mc0320.png",
                     @"/procalDemo_mc0321.png",
                     @"/procalDemo_mc0322.png",
                     @"/procalDemo_mc0323.png",
                     @"/procalDemo_mc0324.png",
                     @"/procalDemo_mc0325.png",
                     @"/procalDemo_mc0326.png",
                     @"/procalDemo_mc0327.png",
                     @"/procalDemo_mc0328.png",
                     @"/procalDemo_mc0329.png",
                     @"/procalDemo_mc0330.png",
                     @"/procalDemo_mc0331.png",
                     @"/procalDemo_mc0332.png",
                     @"/procalDemo_mc0333.png",
                     @"/procalDemo_mc0334.png",
                     @"/procalDemo_mc0335.png",
                     @"/procalDemo_mc0336.png",
                     @"/procalDemo_mc0337.png",
                     @"/procalDemo_mc0338.png",
                     @"/procalDemo_mc0339.png",
                     @"/procalDemo_mc0340.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)selectTest:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {//lactate button tapped
        active = @"lactate";
        lactateDescription.textColor = [UIColor whiteColor];
        rootView.hidden = YES;
        lactateView.hidden = NO;
        lactateStrip.enabled = false;
        touchArea.enabled = false;
        backBtn.hidden = true;
    }else if (button.tag == 1)
    {//procal button tapped
        animationCounter = 0;
        active = @"proCal";
        rootView.hidden = YES;
        procalView.hidden = NO;
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateProcal) userInfo:nil repeats:YES];
    } else if (button.tag == 2)
    {//white blood cell button tapped
        animationCounter = 0;
        active = @"whiteCells";
        rootView.hidden = YES;
        whiteCellView.hidden = NO;
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateWhiteCells) userInfo:nil repeats:YES];
    }
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    //initial tap to turn on lactate device
    if (button.tag == 0)
    {
        lactateStrip.enabled = true;
        lactateDevice.enabled = false;
        touchArea.enabled = true;
        UIImage *beforeImage = [UIImage imageNamed:@"lactateScreen_beforeResult.png"];
        deviceScreen.image = beforeImage;
        lactateDescription.text = @"Now that the unit is turned on, in order to check the lactate level, a few drops of blood are needed.";
        lactateDescription.textColor = [UIColor whiteColor];
        lactateDescription.textAlignment = NSTextAlignmentCenter;
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:19]];
        } else {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:11]];
        }
        lactateInstruction.text = @"Touch the top strip to start the test!";
    } else if (button.tag == 1)
    {//tap to add blood to lactate strip
        UIImage *blood = [UIImage imageNamed:@"bloodDroplet.png"];
        [lactateStrip setBackgroundImage:blood forState:UIControlStateNormal];
        lactateDescription.text = @"Generally levels higher than 2 are potentially dangerous.  Levels over four are usually a medical emergency.  Ask your medical provider if they do blood lactate testing.";
        lactateDescription.textColor = [UIColor whiteColor];
        lactateDescription.textAlignment = NSTextAlignmentCenter;
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:19]];
        } else {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:11]];
        }
        UIImage *afterImage = [UIImage imageNamed:@"lactateScreen_afterResult.png"];
        deviceScreen.image = afterImage;
        lactateInstruction.text = @"";
        backBtn.hidden = false;
    } else if (button.tag == 2)
    {//selected back to tests view button
        [self killSubviews];
    }
}

-(void)animateWhiteCells
{
    NSString *whiteCellPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[whiteCellImages objectAtIndex:animationCounter]];
    
    
    whiteCellanimation.image = nil;
    whiteCellanimation.image = [UIImage imageWithContentsOfFile:whiteCellPath];
    animationCounter ++;
    if (animationCounter == 420)
    {
        animationCounter = 0;
    }
}

-(void)animateProcal
{
    NSString *procalPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[procalImages objectAtIndex:animationCounter]];
    procalAnimation.image = [UIImage imageWithContentsOfFile:procalPath];
    animationCounter ++;
    if (animationCounter == 340)
    {
        animationCounter = 0;
    }
}

-(void)killSubviews
{
    if ([active  isEqual: @"lactate"])
    {
        lactateView.hidden = true;
        rootView.hidden = false;
        lactateDevice.enabled = true;
        lactateStrip.enabled = false;
        deviceScreen.image = nil;
        [lactateStrip setBackgroundImage:nil forState:UIControlStateNormal];
        lactateDescription.text = @"Lactate values, which are normally between 1 and 2, are elevated when cells cannot get enough oxygen.  In sepsis, high lactate levels are associated with a greater risk of death.  Dropping lactate levels usually indicate a person is recovering.";
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:19]];
        } else {
            [lactateDescription setFont:[UIFont boldSystemFontOfSize:11]];
        }
        lactateDescription.textColor = [UIColor whiteColor];
        lactateDescription.textAlignment = NSTextAlignmentCenter;
        lactateInstruction.text = @"Tap to turn on!";
    } else if ([active  isEqual: @"whiteCells"])
    {
        [animationTimer invalidate];
        animationTimer = nil;
        whiteCellView.hidden = YES;
        rootView.hidden = NO;
    } else if ([active  isEqual: @"proCal"])
    {
        [animationTimer invalidate];
        animationTimer = nil;
        procalView.hidden = YES;
        rootView.hidden = NO;
    }
}

-(void)resetAll
{
    [animationTimer invalidate];
    animationTimer = nil;
    lactateView.hidden = true;
    whiteCellView.hidden = true;
    procalView.hidden = true;
    lactateDevice.enabled = true;
    lactateStrip.enabled = false;
    touchArea.enabled = false;
    lactateDescription.text = @"Lactate values, which are normally between 1 and 2, are elevated when cells cannot get enough oxygen.  In sepsis, high lactate levels are associated with a greater risk of death.  Dropping lactate levels usually indicate a person is recovering.";
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        [lactateDescription setFont:[UIFont boldSystemFontOfSize:19]];
    } else {
        [lactateDescription setFont:[UIFont boldSystemFontOfSize:11]];
    }
    lactateDescription.textColor = [UIColor whiteColor];
    lactateDescription.textAlignment = NSTextAlignmentCenter;
    lactateInstruction.text = @"Tap to turn on!";
    deviceScreen.image = nil;
    rootView.hidden = false;
    [lactateStrip setBackgroundImage:nil forState:UIControlStateNormal];
}

@end
