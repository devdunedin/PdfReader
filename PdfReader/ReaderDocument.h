//
//  ReaderDocument.h
//  PdfReader
//
//  Created by Purushottam Dev on 9/26/13.
//  Copyright (c) 2013 Purushottam Dev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface ReaderDocument : NSDocument


//@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet PDFView *ReaderFrontPage;

@property (weak) IBOutlet PDFThumbnailView *PdfThumbnail;

@property (weak) IBOutlet NSComboBox *PageCounter;
@property (weak) IBOutlet NSComboBoxCell *currentPageNumber;


- (IBAction)goBack:(id)sender;
- (IBAction)goFront:(id)sender;
- (IBAction)zoomIn:(id)sender;

- (IBAction)zoomOut:(id)sender;

- (IBAction)zoomToFit:(id)sender;

- (IBAction)singleView:(id)sender;
- (IBAction)singleContinuousView:(id)sender;
- (IBAction)doubleView:(id)sender;
- (IBAction)doubleContinuousView:(id)sender;


@end
