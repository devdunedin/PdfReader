//
//  ReaderDocument.h
//  PdfReader
//
//  Created by Purushottam Dev on 9/26/13.
//  Copyright (c) 2013 Purushottam Dev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>


@interface ReaderDocument : NSDocument <NSTextFieldDelegate>
{
    NSMutableArray *searchResults;
    NSString *searchValue;
    int selectionPos;
  //  IBOutlet NSWindow *_splashScreen;
    int i;
    
}



//various outlets and actions
@property (weak) IBOutlet PDFView *ReaderFrontPage;

@property (weak) IBOutlet PDFThumbnailView *PdfThumbnail;

@property (weak) IBOutlet NSTextField *pageNumber;

@property (weak) IBOutlet NSToolbar *toolbar;

@property (strong) IBOutlet NSWindow *pdfWindow;

@property (weak) IBOutlet NSSearchField *searchStuff;



- (IBAction)goBack:(id)sender;
- (IBAction)goFront:(id)sender;
- (IBAction)zoomIn:(id)sender;
- (IBAction)thePageYouWereBefore:(id)sender;

- (IBAction)theLastPageYouWere:(id)sender;

- (IBAction)zoomOut:(id)sender;

- (IBAction)zoomToFit:(id)sender;

- (IBAction)singleView:(id)sender;
- (IBAction)singleContinuousView:(id)sender;
- (IBAction)doubleView:(id)sender;
- (IBAction)doubleContinuousView:(id)sender;
- (IBAction) doFind: (id) sender ;

- (IBAction)goHome:(id)sender;
- (IBAction)goEnd:(id)sender;
- (IBAction) doFindPrevious: (id) sender;



@end
