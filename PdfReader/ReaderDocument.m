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
    
    //setting up pdfview file
    [_ReaderFrontPage setDocument:pdfDoc];
    [_PdfThumbnail setPDFView:_ReaderFrontPage];
    [_pageNumber setIntegerValue:[[_ReaderFrontPage document] indexForPage:[_ReaderFrontPage currentPage]]+1];
    [self.ReaderFrontPage setFrame:[[NSScreen mainScreen] frame]];
    
    
    
    //notification for page change
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(pageChanger:)
     name:PDFViewPageChangedNotification
     object:nil];
    
    
    //notification for entry to full screen
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(fullViewEntry:)
     name:NSWindowDidEnterFullScreenNotification
     object:nil];
    
    //notification for exit from full screen
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(fullViewExit:)
     name:NSWindowDidExitFullScreenNotification
     object:nil];
    
}

- (void) awakeFromNib{
    
    
}

//go back method to go to previous page
- (IBAction)goBack:(id)sender {
    if([_ReaderFrontPage canGoToPreviousPage]){
        [_ReaderFrontPage goToPreviousPage:sender];
    }
    
}

//go front method to go to next page
- (IBAction)goFront:(id)sender {
    if([_ReaderFrontPage canGoToNextPage]){
        [_ReaderFrontPage goToNextPage:sender];
    }
}
//Page you were before method to go to back
- (IBAction)thePageYouWereBefore:(id)sender {
    if([_ReaderFrontPage canGoBack]){
        [_ReaderFrontPage goBack:sender];
    }
}

//LastPageyouwere method to go to the last page you visisted or go next
- (IBAction)theLastPageYouWere:(id)sender {
    if([_ReaderFrontPage canGoForward]){
        [_ReaderFrontPage goForward:sender];
    }
    
}
//zoom in method to zoom in
- (IBAction)zoomIn:(id)sender {
    
    [_ReaderFrontPage zoomIn:sender];
}

//zoom out method to zoom out
- (IBAction)zoomOut:(id)sender {
    
    [_ReaderFrontPage zoomOut:sender];
    
}

//zoom to fit method to zoom to fit the screen
- (IBAction)zoomToFit:(id)sender {
    [_ReaderFrontPage setAutoScales:YES];
}




//single view method to show just a single page
- (IBAction)singleView:(id)sender {
    [_ReaderFrontPage setDisplayMode:kPDFDisplaySinglePage];
}

//single continuous view method to show just a single continuous page
- (IBAction)singleContinuousView:(id)sender {
    [_ReaderFrontPage setDisplayMode:kPDFDisplaySinglePageContinuous];
}

//double view method to show two pages
- (IBAction)doubleView:(id)sender {
    [_ReaderFrontPage setDisplayMode:kPDFDisplayTwoUp];
}

//double continuous view method to show two continuous pages
- (IBAction)doubleContinuousView:(id)sender {
    [_ReaderFrontPage setDisplayMode:kPDFDisplayTwoUpContinuous];
}










//method calculates page number and assigns them
-(void)controlTextDidEndEditing:(NSNotification *)notification{
    long int page_count = [pdfDoc pageCount];
    
    if ([_pageNumber intValue] <= 0) {
        
    }
    
    if(([_pageNumber intValue]-1 >= 0)){
        
        if([_pageNumber intValue]-1 < page_count){
            PDFPage *pageValueEntered = [[_ReaderFrontPage document] pageAtIndex:[_pageNumber intValue]-1];
            
            [_ReaderFrontPage goToPage:pageValueEntered];
        }
    }
    
}

//search next method
- (IBAction) doFind: (id) sender {
    
    
    if ([[self.ReaderFrontPage document] isFinding]) {
        [[self.ReaderFrontPage document] cancelFindString];
    }
    if (![[_searchStuff stringValue] isEqualToString:searchValue]) {
        searchResults = NULL;
    }
    if (searchResults == NULL) {
        searchResults = [NSMutableArray arrayWithCapacity: 10];
        searchValue = [sender stringValue];
        selectionPos = 0;
    }
    NSArray *selection = [[self.ReaderFrontPage document] findString: [_searchStuff stringValue] withOptions:NSCaseInsensitiveSearch];
    
    if (selection.count != 0) {
        [self.ReaderFrontPage setCurrentSelection:selection[selectionPos]];
        selectionPos++;
        if (selectionPos > selection.count - 1) {
            selectionPos = 0; }
        [self.ReaderFrontPage scrollSelectionToVisible:sender];
    }
    
}

//search backwards method
- (IBAction) doFindPrevious: (id) sender {
    
    
    if ([[self.ReaderFrontPage document] isFinding]) {
        [[self.ReaderFrontPage document] cancelFindString];
    }
    if (![[_searchStuff stringValue] isEqualToString:searchValue]) {
        searchResults = NULL;
    }
    if (searchResults == NULL) {
        searchResults = [NSMutableArray arrayWithCapacity: 10];
        searchValue = [sender stringValue];
        selectionPos = 0;
    }
    NSArray *selection = [[self.ReaderFrontPage document] findString: [_searchStuff stringValue] withOptions:NSBackwardsSearch];
    
    if (selection.count != 0) {
        [self.ReaderFrontPage setCurrentSelection:selection[selectionPos]];
        selectionPos++;
        if (selectionPos > selection.count - 1) {
            selectionPos = 0; }
        [self.ReaderFrontPage scrollSelectionToVisible:sender];
    }
    
}

//go to home page
- (IBAction)goHome:(id)sender {
    if([_ReaderFrontPage canGoToFirstPage]){
        [_ReaderFrontPage goToFirstPage:sender];
    }
}

//go to last page
- (IBAction)goEnd:(id)sender {
    if([_ReaderFrontPage canGoToLastPage]){
        [_ReaderFrontPage goToLastPage:sender];
    }
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

//pagechanger selector for notification
-(void)pageChanger:(NSNotification *)notification{
    
    [_pageNumber setIntegerValue:[[_ReaderFrontPage document] indexForPage:[_ReaderFrontPage currentPage]]+1];
    
    [self.ReaderFrontPage setFrame:[[NSScreen mainScreen] frame]];
    
    
}

//full screen entry selector for notification
-(void)fullViewEntry:(NSNotification *)notification{
    
    
    [self.ReaderFrontPage setFrame:[[NSScreen mainScreen] frame]];
    [self.PdfThumbnail setHidden:YES];
    [self.toolbar setVisible:FALSE];
    
}

//full screen exit selector for notification
-(void)fullViewExit:(NSNotification *)notification{
    
    [_toolbar setVisible:YES];
    [self.PdfThumbnail setHidden:NO];
    
}


@end


