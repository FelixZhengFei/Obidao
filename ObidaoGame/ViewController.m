//
//  ViewController.m
//  ObidaoGame
//
//  Created by work on 12/16/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import "IslandMapScene.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SKView * skView = (SKView *)self.view;
    SKScene * scene = [IslandMapScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
