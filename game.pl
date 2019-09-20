#!/usr/bin/perl -w
my %board;
for(my $i=1;$i<=9;$i++){
  $board{$i}=$i;
}
$player_one = 0;
$player_two = 0;
$playing=1;
sub greeting
{
        print "\nWelcome to Tic Tac Toe by Nick O'Keefe and Russell Molimock\n\n";
        print "Enter Player One's Name (X): ";
        $ARGV[0] = <STDIN>;
        print "\nEnter Player Two's Name (O): ";
        $ARGV[1] = <STDIN>;
        print "---------------\n\n";
        display();
        print "To select a square, enter the corresponding number.\n";
}
sub game
{
	$player_one = $ARGV[0];
	$player_two = $ARGV[1];
	$board = $ARGV[2];
	while(@_[0])
	{
		print $player_one;
		print "\nIt's your turn! What square do you choose?";
		$p1_choice = <STDIN>;
	        while(update_board($p1_choice, 1, $board)==0)                                                                                                                                               {
        	        print "Bad selection.\n";
			print $player_one;
        	        print "\nIt's your turn! What square do you choose?";
	                $p1_choice = <STDIN>;
	        }
		print $player_two;
                print "\nIt's your turn! What square do you choose?";
                $p2_choice = <STDIN>;
                while(update_board($p2_choice, 2, $board)==0)                                                                                                                                               {
                        print "Bad selection.\n";
                        print $player_two;
                        print "\nIt's your turn! What square do you choose?";
                        $p2_choice = <STDIN>;
                }
	}
}
sub update_board
{
	$choice = $ARGV[3];
	$flag = $ARGV[1];
	$board = $ARGV[2];
	print "11111: $choice";
	print "flaaggg $flag";
	print "board $board";
	if($board{$choice}!=$choice)
	{
		return(0);
	}
}
sub display
{
	print "\n\n-------------\n";
	for (my $i=1;$i<=9;$i++)
	{
		if($i==1||$i==4||$i==7)
		{
			print "|";
		}
		print " $board{$i} |";
		if($i==3||$i==6||$i==9)
		{
			print "\n-------------\n";
		}
	}
print "\n\n";
}
greeting($player_one, $player_two);
game($playing, $player_one, $player_two, $board);
