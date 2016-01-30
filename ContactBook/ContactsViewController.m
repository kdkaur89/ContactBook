//
//  MasterViewController.m
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactDetailsViewController.h"
#import "ContactBook.h"
#import "ContactsTableViewCell.h"
#import "AddContactViewController.h"
@interface ContactsViewController ()


@property (nonatomic, strong) Person *personObject;
@end

@implementation ContactsViewController

#pragma mark - View lifecycle methods

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContactsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ContactsCell"];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    ContactBook *contactBook = [[ContactBook alloc]init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _contacts = [contactBook getContacts].mutableCopy;
        [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
      
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view configurations

-(void)reloadTableView{
    
    [self.tableView reloadData];
    [self updateTotalNumberOfContacts];
}

- (void)updateTotalNumberOfContacts{
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@%ld",NSLocalizedString(@"numberOfContacts", nil), _contacts.count];
}

- (ContactsTableViewCell *)configureCellForIndexPath:(NSIndexPath *)indexPath {
    
    ContactsTableViewCell *contactsCell  = [self.tableView dequeueReusableCellWithIdentifier:@"ContactsCell"];
    
    if(contactsCell == nil) {
        contactsCell = [[ContactsTableViewCell alloc]init];
    }
    
    Person *person = [_contacts objectAtIndex:indexPath.row];
    contactsCell.name.text = person.personName;
    contactsCell.phone.text = person.phoneNumber;
    return contactsCell;
}

- (void)deleteContactAtIndexPath:(NSIndexPath *)indexPath {
    [_contacts removeObjectAtIndex:(int)indexPath.row ];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ContactDetailsViewController *controller = (ContactDetailsViewController *)[[segue destinationViewController] topViewController];
        [controller setPerson:[_contacts objectAtIndex:indexPath.row]];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    else if ([segue.identifier isEqualToString:@"addContacts"]) {
        self.tableView.editing = NO;
        AddContactViewController *addContactsViewController = (AddContactViewController *)segue.destinationViewController;
        addContactsViewController.masterViewController = self;
        
    }
}

#pragma mark - Table View delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *cell = [self configureCellForIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteContactAtIndexPath:indexPath];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self updateTotalNumberOfContacts];
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

@end
