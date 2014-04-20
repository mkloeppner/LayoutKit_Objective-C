//
//  MKFlowLayoutTestsSpec.m
//  MKLayoutLibrary
//
//  Created by Martin Klöppner on 20/04/14.
//  Copyright 2014 Martin Klöppner. All rights reserved.
//

#import "Specta.h"
#import "MKFlowLayout.h"

#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(MKFlowLayoutTests)

describe(@"MKFlowLayoutTests", ^{
    
    __block UIView *container;
    
    __block MKFlowLayout *layout;
    
    __block UIView *view1;
    __block UIView *view2;
    __block UIView *view3;
    __block UIView *view4;
    
    beforeEach(^{
        
        container = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
        
        layout = [[MKFlowLayout alloc] initWithView:container];
        
        view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
        view2 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
        view3 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
        view4 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 10.0f, 10.0f)];
        
    });
    
    it(@"should layout a single view with match parent in width and height", ^{
        
        [layout addSubview:view1];
        
        [layout layout];
        
        expect(view1.frame.origin.x).to.equal(0);
        expect(view1.frame.origin.y).to.equal(0);
        expect(view1.frame.size.width).to.equal(container.frame.size.width);
        expect(view1.frame.size.height).to.equal(container.frame.size.height);
        
    });
    
    it(@"should layout a single sublayout with match parent in width and height", ^{
        
        MKFlowLayout *flowLayout = [[MKFlowLayout alloc] init];
        [flowLayout addSubview:view1];
        
        [layout addSublayout:flowLayout];
        
        [layout layout];
        
        expect(view1.frame.origin.x).to.equal(0);
        expect(view1.frame.origin.y).to.equal(0);
        expect(view1.frame.size.width).to.equal(container.frame.size.width);
        expect(view1.frame.size.height).to.equal(container.frame.size.height);
        
    });
    
    it(@"should layout two single items and break the line if the second item exceeds the available space", ^{
       
        [layout addSubview:view1];
        [layout addSubview:view2];
        
        [layout layout];
        
        expect(view1.frame.origin.x).to.equal(0);
        expect(view1.frame.origin.y).to.equal(0);
        expect(view1.frame.size.width).to.equal(container.frame.size.width);
        expect(view1.frame.size.height).to.equal(container.frame.size.height);

        expect(view2.frame.origin.x).to.equal(0);
        expect(view2.frame.origin.y).to.equal(container.frame.size.height);
        expect(view2.frame.size.width).to.equal(container.frame.size.width);
        expect(view2.frame.size.height).to.equal(container.frame.size.height);
        
    });
    
});

SpecEnd