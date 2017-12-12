
#import "ViewController.h"
#import "SCSuspendedViewController.h"
#import "UIViewController+SCSuspendedView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"左，透明";
            break;
            
        case 1:
            cell.textLabel.text = @"左，不透明";
            break;
            
        case 2:
            cell.textLabel.text = @"右，透明";
            break;
            
        case 3:
            cell.textLabel.text = @"右，不透明";
            break;
            
        case 4:
            cell.textLabel.text = @"上，透明";
            break;
            
        case 5:
            cell.textLabel.text = @"上，不透明";
            break;
            
        case 6:
            cell.textLabel.text = @"下，透明";
            break;
            
        case 7:
            cell.textLabel.text = @"下，不透明";
            break;
            
        case 8:
            cell.textLabel.text = @"中，透明";
            break;
            
        case 9:
            cell.textLabel.text = @"中，不透明";
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    SCSuspendedViewConfiguration *configuration;
    switch (indexPath.row) {
        case 0:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionLeft transparent:YES hasGestureRecognizer:NO backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(0, 0, 100, screenSize.height) transitionDuration:0.25];
            break;
            
        case 1:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionLeft transparent:NO hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(0, 0, 100, screenSize.height) transitionDuration:0.25];
            break;
            
        case 2:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionRight transparent:YES hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(screenSize.width - 205, 100, 200, screenSize.height - 200) transitionDuration:0.25];
            break;
            
        case 3:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionRight transparent:NO hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(screenSize.width - 205, 100, 200, screenSize.height - 200) transitionDuration:0.25];
            break;
            
        case 4:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionTop transparent:YES hasGestureRecognizer:NO backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(0, 0, screenSize.width, 100) transitionDuration:0.25];
            break;
            
        case 5:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionTop transparent:NO hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(0, 0, screenSize.width, 100) transitionDuration:0.25];
            break;
            
        case 6:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionBottom transparent:YES hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(5, screenSize.height - 395, screenSize.width - 10, 400) transitionDuration:0.25];
            break;
            
        case 7:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionBottom transparent:NO hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(5, screenSize.height - 395, screenSize.width - 10, 400) transitionDuration:0.25];
            break;
            
        case 8:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionCenter transparent:YES hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(15, screenSize.height / 2 - 150, screenSize.width - 30, 300) transitionDuration:0.25];
            break;
            
        case 9:
            configuration = [SCSuspendedViewConfiguration configurationWithDirection:SCSuspendedViewDirectionCenter transparent:NO hasGestureRecognizer:YES backgroundMaskColor:[UIColor colorWithWhite:0x000000 alpha:0.3] suspendedViewFrameInWindow:CGRectMake(15, screenSize.height / 2 - 150, screenSize.width - 30, 300) transitionDuration:0.25];
            break;
            
        default:
            break;
    }
    
    
    SCSuspendedViewController *controller = [SCSuspendedViewController new];
    controller.sc_suspendedViewConfiguration = configuration;
    [self presentViewController:controller animated:YES completion:nil];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
