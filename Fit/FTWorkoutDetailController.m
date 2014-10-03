//
//  FTWorkoutDetailController.m
//  Livefit
//
//  Created by folse on 8/7/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTWorkoutDetailController.h"

@interface FTWorkoutDetailController ()
{
    NSString *content;
    NSString *headerScrollViewImagePrefixName;
    int totalPageNumber;
}

@property (strong, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation FTWorkoutDetailController

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
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",_workoutName);
    
    // NSMutableArray *contentArray = [NSMutableArray new];
    
    // NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"plist"];
    // contentArray = [NSMutableArray arrayWithArray:[[NSArray alloc] initWithContentsOfFile:plistPath]];
    
    if ([_workoutName isEqualToString:@"01"]) {
        
        content = @"仰躺于平板上，采用中宽度握法（在动作中途小臂与上臂成9O°角）。从架子上取下杠铃，平举在身体正上方，手臂固定。此为开始姿势。\r\r在开始姿势下，吸气，使杠铃缓慢下落，直到贴住胸口的中部。\r\r停留片刻，把杠铃推回到开始姿势，同时呼气。注意用胸肌推举杠铃，在动作的顶端手臂固定，胸部紧崩，停留片刻，然后重新开始下落。\r\r提示：杠铃下落的时间最好为上举时间的2倍左右。\r\r重复这一动作，直到完成规定次数。\r\r练习完成后把杠铃放回到架子上。\r\r注意：\r初次进行练习时最好有辅助人员在场协助，如没有辅助人员，举重重量不可过重。\r\r杠铃落下时注意勿使太靠前，以贴住胸的中部为宜。\r\r勿使杠铃弹离胸部，要始终牢固控制杠铃。";
        self.title = @"杠铃平卧推举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s1_";
        
    }else if ([_workoutName isEqualToString:@"02"]) {
        
        content = @"躺在一个斜板上，采用中宽距握法（在运动中途小臂与上臂成9O°角）。从架子上取下杠铃，平举在身体正上方，手臂固定。此为开始姿势。\r\r吸气，缓慢使杠铃下落，直到感觉贴于你的上胸部。\r\r停留片刻，然后把杠铃推回到开始姿势，同时呼气，用胸肌推举。在紧崩姿势时使手臂固定，挤压胸部，停留片刻，然后再次使杠铃缓慢下落。提示：下落时间应为上举时间的两倍。\r\r重复这一动作，直到完成规定次数。\r\r练习完成后把杠铃放回到架子上。\r\r注意：\r初次进行练习时最好有辅助人员在场协助，如没有辅助人员，举重重量不可过重。\r\r勿使杠铃落下时太靠前，以落到上胸部为宜。\r\r变化：如果所使用的斜板是可调节的，可转换不同的倾斜角度进行练习。";
        self.title = @"上斜杠铃卧推";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s2_";
        
    }else if ([_workoutName isEqualToString:@"03"]) {
        
        content = @"双手持握哑铃躺于斜板上，斜板角度不可超过在15°-30°。\r\r向身体上方伸展胳膊，臂肘略微弯曲。\r\r旋转手腕使手心朝向自己。提示：两小拇指相邻。此为开始姿势。\r\r吸气，胳膊缓慢向两侧下落，保持手臂张开，旋转手腕直到两手心相对。提示：在动作的末尾，手臂伸展于两侧，手心朝向天花板。\r\r吸气，反向运动使哑铃回到开始姿势，旋转手心使小拇指重新相邻。提示：只使肩关节和手腕活动，肘关节不活动。\r\r重复这一动作，直到完成规定次数。";
        self.title = @"上斜哑铃飞鸟";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s3_";
        
    }else if ([_workoutName isEqualToString:@"04"]) {
        
        content = @"进入开始姿势。使滑轮置于高位（高于头顶），选择适当阻力，两手分别紧握带轮。\r\r沿两滑轮之间设想的直线向前跨步，使两臂拉向胸前。腰部以上躯干略向前倾。此为开始姿势。\r\r肘部略微弯曲以免二头肌腱受力。侧向伸展手臂（向两侧伸直）成宽弓形，直至胸部有牵拉感。在做上述运作时注意吸气。提示：在做这套运作时手臂和躯干应保持不晃动，只有肩部关节活动。\r\r使手臂回到开始姿势，重复上述动作直到完成规定次数。变化：手臂在胸前的相交点可以变化。";
        self.title = @"拉力器夹胸";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s4_";
        
    }else if ([_workoutName isEqualToString:@"05"]) {
        
        content = @"手心向前按规定的握法握住引体向上横杠。握杆要领：采用宽握时，两手距离大于肩宽；中握时两手距离与肩宽相同；窄握时两手距离小于肩宽。\r\r两臂根据选择的宽度张开，手握横杠，身体向后成30O左右，背下部弯曲，胸部前挺。此为开始姿势。\r\r肩部和上臂向下后方拉，引体向上，使横杠触及上胸部，在做这一动作的同时呼气。提示：在达到完全紧崩状态时注意挤压背部肌肉，在身体移动过程中上躯干保持不动。小臂除握杆以外不做其他功。\r\r在紧崩状态停留片刻，然后吸气，躯干缓慢向下回到开始姿势，背阔肌充分舒展。\r\r重复这一动作，直到完成规定次数。\r\r变化：\r初学或没有力量完成动作者可借助托力板（chin assist machine），它可以利用训练者自身的重力帮助向上提拉身体。\r\r也可让一个辅助人员扶住腿进行练习。\r\r进阶的训练者则可加上负重带（weight belt），通过附加配重盘（weighted plates）进行加重练习。\r\r不建议进行颈后引体向上练习，因为这一动作的过度伸展会使肩部回旋肌群受力过大。";
        self.title = @"引体向上";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s5_";
        
    }else if ([_workoutName isEqualToString:@"06"]) {
        
        content = @"坐在一个顶滑轮上附有宽把手的下拉机上。把膝护档（knee pad）调到适当的高度，这两个护档的作用是防止身体被附加于横把手上的阻力提起。\r\r按照规定的握法手心朝前握住把手。\r握法提示：采用宽握时两手的距离大于肩宽；中握时两手距离等同于肩宽；窄握时两手距离小于肩宽。\r\r两臂向前按规定握法握住把手，躯干向后倾斜30O左右，背的下部弯曲，胸部前挺。此为开始姿势。\r\r呼气，肩和小臂向下和后拉，向下拉把手直到触及上胸部。提示：在达到紧崩状态时注意挤压背部肌肉。上躯干保持不动，只使胳膊活动。小臂除了握把手外不做其他功，因此不要借助小臂向下拉把手。\r\r肩胛骨下方紧缩在一起、在紧崩状态停留片刻，缓慢抬高把手回到开始姿势，手臂伸直，背阔肌充分伸展。在做上述动作时吸气。\r\r重复这一动作，直到完成规定次数。\r\r不建议进行颈后下拉练习，因为这一动作的过度伸展会使肩部回旋肌群受力过大。";
        self.title = @"宽握下拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s6_";
        
    }else if ([_workoutName isEqualToString:@"07"]) {
        
        content = @"content";
        self.title = @"站姿胸前下拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s7_";
        
    }else if ([_workoutName isEqualToString:@"08"]) {
        
        content = @"用超过肩宽的正握（手心朝下）方式握住下拉机顶滑轮下的宽把手，后退2英尺左右。\r\r躯干自腰部向前倾斜30°左右，胳膊向前伸直，肘部略为弯曲，如胳膊没有伸直，向后退一点直到伸直。胳膊伸直、躯干自腰部略微倾斜后，崩紧背阔肌，准备开始。\r\r保持胳膊伸直，收缩背阔肌向下拉把手，直到双手贴到大腿两侧。做这一动作时呼气。\r\r保持胳膊伸直，回到开始姿势，同时吸气。\r\r重复这一动作，直到完成规定次数。\r\r变化：也可用窄于肩宽的横把手或附加绳带练习。";
        self.title = @"直立站姿直臂下拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s8_";
        
    }else if ([_workoutName isEqualToString:@"11"]) {
        
        content = @"首先选择适当杠铃高度，选好高度及杠铃加载后，走到杠铃下，使肩背部（略低于颈部）横过杠铃。\r\r用双臂从两侧抓住杠铃（手心朝前），两腿用力，挺直躯干，打开杠铃锁，从杠铃架上取下杠铃。\r\r采用中开立步（shoulder width medium stance），脚趾略向外张。始终保持抬头，背部挺直。此为开始姿势。（为了照顾全面练习，本节中采用中开立步，但实际可按照脚的姿势一节中的讨论，采用三种姿势中的任何一种）。\r\r曲膝使杠铃缓慢下落，抬头，保持躯干直立。继续下蹲，直到大腿与小腿肚夹角略小于90°（大腿低于与地面平行）。在做上述动作时吸气。\r提示：正确的练习作法是，设想一条膝盖和脚趾前断之间的直线并垂直于地面。如膝盖超过假想直线（膝盖超过脚趾），说明膝盖受力过大，练习的作法不正确。\r\r脚后跟用力压地，使腿部挺直，向上挺举杠铃，同时呼气，回到开始姿势。\r\r重复这一动作，直到完成规定次数。\r\r注意：做这项运动时需小心。背部有问题的人可改换腿部推蹬练习。背部没有问题的人在练习时勿使背部松驰前倾，那样会使背部受伤。采用的重量也需注意，在拿不准的情况下，请选择较轻重量。深蹲是一项十分安全的练习，但要掌握正确训练方法。";
        self.title = @"史密斯架深蹲";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s9_";
        
    }else if ([_workoutName isEqualToString:@"12"]) {
        
        content = @"双手持哑铃底盘，身体直立，两腿叉开略宽于肩部，膝盖略为弯曲。\r\r脚趾向外，在做动作时注意胳膊保持不动。此为开始姿势。\r\r脚趾向外，在做动作时注意胳膊保持不动。此为开始姿势。\r\r缓慢曲膝，降低腿部位置直到大腿与地面平行。注意吸气，这是本练习的重要部分。\r\r主要通过脚后跟向下用力使身体回到直立姿势，同时呼气。\r\r重复这一动作，直到完成规定次数。\r\r注意：背部需保持挺直，否则可能导致背部受伤。";
        self.title = @"哑铃深蹲";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s10_";
        
    }else if ([_workoutName isEqualToString:@"13"]) {
        
        content = @"这项练习需要使用腿部伸展训练器。首先选择适当重量，坐于练习器上，使腿在横垫(pad)后面（脚朝前），手扶两侧把手。此为开始姿势。\r\r提示：你需要调节脚垫，使其在你的小腿前方（比脚略高）。小腿和大腿成90°角，如此角小于90°意味膝盖比脚指高，这会使膝关节受力过大。如器械的设计如此，最好另换器械，或者在练习过程中腿部成90O角时就不再向下。\r\r运用股四头肌使腿伸直到最大限度，同时呼气。注意身体其他部位应保持坐姿不动，在紧崩状态停留片刻。\r\r缓慢放下负重回到原始位置，同时吸气，注意收腿时不要超过90°角限度。\r\r重复这一动作，直到完成规定次数。\r\r变化：如在脚的位置一节中所提到的，可以变换脚的位置从而达到对大腿的某一部位的最大刺激。也可以进行单腿练习（一次用一只腿）。";
        self.title = @"腿屈伸";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"s11_";
        
    }else if ([_workoutName isEqualToString:@"14"]) {
        
        content = @"首先把杠铃高度调节到与大腿中部平齐，调整到合适的重量，采用与肩同宽的正握（手心向前）握住杠铃。重量较大时可加护腕。\r\r提起杠铃，胳膊伸直，背部挺直。躯干直立，两腿分开与肩宽或略窄，膝盖略微弯曲。此为开始姿势。\r\r膝盖保持不动，弯腰使杠铃向脚面下落，背部挺直。继续前倾，好似要从地上拾取东西，直到腿筋感觉紧崩。在做上述动作时吸气。\r\r重复这一动作，直到完成规定次数。\r\r注意：下背部有问题的人不建议做此项练习。此项练习要十分小心，特别要注意当躯干向下移动时背部不要弓起，要保持挺直。猛拉或重量过大可导致背部受伤。\r\r变化：此项练习也可用哑铃或横杠进行。";
        self.title = @"史密斯架硬拉";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s12_";
        
    }else if ([_workoutName isEqualToString:@"15"]) {
        
        content = @"调节器械横档（level）以适合你的高度，坐在器械上，背部靠在靠垫上。\r\r把小腿后侧放在有衬垫的横档上（腓肌以下几英寸），把腿垫（lap pad）固定在大腿上，略高于膝盖。手握器械侧把手，脚指向前伸（也可用其他两个姿势），使双腿在身前伸直。此为开始姿势。\r\r呼气，曲膝，把器械横档尽量向后拉近大腿。始终使躯干保持不动，保持紧崩姿势片刻。\r\r吸气，缓慢回到开始姿势。\r\r重复这一动作，直到完成规定次数。\r\r注意：不要使用过大重量以至需要借助身体摆动或颤动，那样有可能伤及下腰或肌腱。\r\r变化：由于腿部可采用三种姿势，因此可做三种练习。";
        self.title = @"坐姿/俯卧腿弯举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s13_";
        
    }else if ([_workoutName isEqualToString:@"16"]) {
        
        content = @"在史密斯器械的杠铃下放置一木块或铃盘，把杠铃调到最适合你身高的高度。调好杠铃高度和加载后，用脚掌的前部踩在举重盘上，把杠铃置于肩膀的后部。\r\r双手手心朝前握住杠铃，旋转杠铃使之解锁。此为开始姿势。\r\r向下压前脚掌使脚后跟抬起，在崩紧时收缩小腿肚，两膝保持张开。在紧崩姿势停留片刻，然后退回。\r\r吸气，放下后脚跟，缓慢回到开始姿势。\r\r重复这一动作，直到完成规定次数。";
        self.title = @"史密斯架举踵";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s14_";
        
    }else if ([_workoutName isEqualToString:@"17"]) {
        
        content = @"content";
        self.title = @"腹肌轮";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s15_";
        
    }else if ([_workoutName isEqualToString:@"18"]) {
        
        content = @"身体俯卧在地板上，以脚趾和小臂支撑身体，胳膊弯曲垂直在肩膀下方。\r\r始终使身体保持竖直，尽可能长时间地（或按规定时间）保持这种姿势。为增加难度可使一只胳膊或腿抬起。";
        self.title = @"平板支撑";
        
        totalPageNumber = 1;
        headerScrollViewImagePrefixName = @"s16_";
        
    }else if ([_workoutName isEqualToString:@"21"]) {
        
        content = @"手握一对哑铃，坐在有靠背的臥推凳或三角椅上，把哑铃竖直放在大腿上\r\r用大腿顶起哑铃，一次顶起一个，把哑铃向两侧举起到与肩相同高度。\r\r旋转手腕使手心朝前。此为开始姿势。\r\r呼气，向上推举哑铃，直到两个哑铃的顶端相触。\r\r停留片刻，缓慢回到开始姿势，同时呼气。\r\r重复这一动作，直到完成规定次数。\r\r变化：\r可以站着或坐在一张普通凳子上做这项练习。对背下部有问题的人，建议采用这种方式。";
        self.title = @"坐姿肩上推举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s17_";
        
    }else if ([_workoutName isEqualToString:@"22"]) {
        
        content = @"手持一对哑铃，坐于平椅一端，双脚牢固踩地。手心向内握住哑铃，手臂伸直贴于两侧。此为开始姿势。\r\r躯干保持不动（不摇摆），胳膊肘略微弯曲，向两侧举起哑铃，手略微向前倾斜，如同从水杯里向外倒水。持续向上直到手臂与地面平行。做动作的同时呼气，抬到最高点时停留片刻。\r\r缓慢将哑铃落下回到开始姿势，同时吸气。\r\r重复这一动作，直到完成规定次数。\r\r变化：此项练习也可以站立进行。";
        self.title = @"哑铃侧平举";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s18_";
        
    }else if ([_workoutName isEqualToString:@"23"]) {
        
        content = @"手拿一对哑铃，躯干挺直，胳膊伸直，哑铃位于大腿前方，手心面向大腿。此为开始姿势。\r\r躯干保持不动（不摇摆），左手哑铃向前举起，肘部略为弯曲，手心始终朝下。继续上举直到手臂略高于与地面平行。在做上述运作过程中呼气，在动作达到最高点时停留片刻，然后吸气。\r\r使哑铃缓慢回落到初始姿势，同时举起右手哑铃，\r\r继续这种交替动作，直到每只胳膊完成规定的次数。\r\r变化：这项锻炼也可两只胳膊同时进行。另外也可使用杠铃进行。";
        self.title = @"哑铃前平举";
        
        totalPageNumber = 5;
        headerScrollViewImagePrefixName = @"s19_";
        
    }else if ([_workoutName isEqualToString:@"24"]) {
        
        content = @"以比肩宽略窄的宽度正握杠铃，把杠铃提到与大腿上端相平，胳膊伸直，肘部略微弯曲，背部挺直。此为开始姿势。\r\r呼气，用肩的两侧提向上提杠铃，胳膊肘向上和侧面抬起。抬举杠铃时尽量使其紧靠身体。继续向上抬举杠铃直到接近下颏。提示：动作由肘部带动，肘部始终要高于小臂。注意躯干保持不动，在动作达到顶端时停留片刻。\r\r使杠铃缓慢回落到开始姿势，在做这一动作时吸气。\r\r变化：此项练习也可用附在一个低滑轮上的横杠做，也可用哑铃做，但采用后一方法的人应熟悉动作要领。";
        self.title = @"正立划船";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s20_";
        
    }else if ([_workoutName isEqualToString:@"25"]) {
        
        content = @"在平椅前方摆放一对哑铃头朝前。坐在椅子一端，腿并紧，哑铃位于腿肚子后方。\r\r弯腰，背部保持平直，双手手心相对，准备拾取哑铃。此为开始姿势。\r\r躯干前倾保持不动，胳膊肘弯曲，向两侧举起哑铃直到与地面平行，举起哑铃时呼气（注意避免躯干摆动或使胳膊向后而不向两侧抬起）。\r\r在最高点紧崩状态停留片刻，缓慢放下哑铃回到开始始姿势。\r\r重复这一动作，直到完成规定次数。\r\r变化：此项练习也可以站着进行，但是下背部有问题者最好采用这种坐姿。";
        self.title = @"拉力器交叉后飞鸟";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s21_";
        
    }else if ([_workoutName isEqualToString:@"26"]) {
        
        content = @"身体站立，双手各握一哑铃（手心朝向躯干），胳膊两侧略微张开。肩部尽可能高聳以提起哑铃，同时吸气。在肩部达到最高时保持紧崩状态片刻。提示：手臂应一直保持略微张开，避免用二头肌帮助提升哑铃，只使肩膀上下运动。\r\r使哑铃回到初始位置。\r\r重复这一动作，直到完成规定次数。\r\r变化：可用手、杠铃或带轮（cable）进行这项练习，也可只用一只哑铃进行单侧练习。";
        self.title = @"哑铃耸肩";
        
        totalPageNumber = 2;
        headerScrollViewImagePrefixName = @"s22_";
        
    }else if ([_workoutName isEqualToString:@"27"]) {
        
        content = @"开始取俯卧撑姿势，用手和脚趾支撑身体重量。曲膝和臀部，一只脚向前抬使膝盖接近臀部下方位置。此是开始姿势。\r\r用暴发力转换两腿位置，使弯曲的腿伸直，以脚趾支撑。同时臀部和膝盖弯曲，使另一只脚前抬。在规定的时间内重复做交替练习。";
        self.title = @"山地蹬腿";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s23_";
        
    }else {
        content = @"平臥于地板上，用手和脚趾支撑身体，双腿并拢，身体挺直。胳膊弯曲成90°。此为开始姿势。\r\r一只脚抬离地面，向外旋腿使膝盖尽量接近肘部。\r\r使该腿回到开始姿势，另一侧腿做同样动作。";
        self.title = @"蜘蛛人平板";
        
        totalPageNumber = 3;
        headerScrollViewImagePrefixName = @"s24_";
    }
    [_contentTextView setText:content];

    [_headerScrollView setDelegate:self];
    [_headerScrollView setPagingEnabled:YES];
    [_headerScrollView setContentSize:CGSizeMake(320*totalPageNumber, 250)];
    
    for ( int i = 1; i < totalPageNumber+1; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@%d", headerScrollViewImagePrefixName, i];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*i-320, 0, 320, 250)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        [_headerScrollView addSubview:imageView];
    }
    
    _pageControl.numberOfPages = totalPageNumber;
    _pageControl.currentPage = 0;

	
}

- (void)viewWillLayoutSubviews{
	_contentTextView.font = [UIFont systemFontOfSize:15];
	CGFloat fixedWidth = _contentTextView.frame.size.width;
	CGSize newSize = [_contentTextView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
	CGRect newFrame = _contentTextView.frame;
	newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
	_contentTextView.frame = newFrame;
	self.tableView.contentSize = CGSizeMake(self.view.frame.size.width, _headerScrollView.frame.size.height + _contentTextView.frame.size.height + 20);
}

//pagecontrol的点跟着页数改变
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageControl setCurrentPage:offset.x/bounds.size.width];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
