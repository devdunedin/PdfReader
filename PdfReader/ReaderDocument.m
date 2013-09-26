//
//  ReaderDocument.m
//  PdfReader
//
//  Created by Purushottam Dev on 9/26/13.
//  Copyright (c) 2013 Purushottam Dev. All rights reserved.
//

#import "ReaderDocument.h"
#import <Quartz/Quartz.h>

@implementation ReaderDocument
 PDFDocument *pdfDoc;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"ReaderDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
   
    
    [_ReaderFrontPage setDocument:pdfDoc];
    [_PdfThumbnail setPDFView:_ReaderFrontPage];
  
}

- (IBAction)goBack:(id)sender {
    if([_ReaderFrontPage canGoToPreviousPage]){
        [_ReaderFrontPage goToPreviousPage:sender];
    }
    
}

- (IBAction)goFront:(id)sender {
    if([_ReaderFrontPage canGoToNextPage]){
        [_ReaderFrontPage goToNextPage:sender];
    }
}

- (IBAction)zoomOut:(id)sender {
    
    [_ReaderFrontPage zoomOut:sender];

}

- (IBAction)zoomToFit:(id)sender {
    [_ReaderFrontPage setAutoScales:YES];
}

- (IBAction)kindOfView:(id)sender {
    if([_viewType indexOfSelectedItem] == 0){
        [_ReaderFrontPage setDisplayMode:kPDFDisplaySinglePage];
    }
//    else if([_viewType indexOfSelectedItem] == 1){
//        [_ReaderFrontPage setDisplayMode:kPDFDisplaySinglePageContinuous];
//    }
//    else if([_viewType indexOfSelectedItem] == 2){
//        [_ReaderFrontPage setDisplayMode:kPDFDisplayTwoUp];
//    }
//    else if([_viewType indexOfSelectedItem] == 3){
//        [_ReaderFrontPage setDisplayMode:kPDFDisplayTwoUpContinuous];
//    }

    }



- (IBAction)zoomIn:(id)sender {
    
    [_ReaderFrontPage zoomIn:sender];
}







+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (void)canCloseDocumentWithDelegate:(id)delegate shouldCloseSelector:(SEL)shouldCloseSelector contextInfo:(void *)contextInfo {
    pdfDoc = nil;
    [super canCloseDocumentWithDelegate:delegate shouldCloseSelector:shouldCloseSelector contextInfo:contextInfo];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
   //OPen initWithData: data
    pdfDoc = [[PDFDocument alloc] initWithData: data];
    
    return YES;
}



@end


