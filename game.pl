#!/usr/bin/perl -w
my %board;
for(my $i=1;$i<=9;$i++){
  $board{$i}=$i;
}
$playing=1;

sub game
{
	while(@_[0])
	{
		print $player_one;
		print "\nIt's your turn! What square do you choose?";
		$p1_choice = <STDIN>;
	        while(update_board($p1_choice)==0)                                                                                                                                               {
        	        print "Bad selection.\n";
			print $player_one;
        	        print "\nIt's your turn! What square do you choose?";
	                $p1_choice = <STDIN>;
	        }
		print $player_two;
                print "\nIt's your turn! What square do you choose?";
                $p2_choice = <STDIN>;
                while(update_board($p2_choice)==0)                                                                                                                                               {
                        print "Bad selection.\n";
                        print $player_two;
                        print "\nIt's your turn! What square do you choose?";
                        $p2_choice = <STDIN>;
                }
	}
}
sub update
{
	
}
sub greeting
{
	print "\nWelcome to Tic Tac Toe by Nick O'Keefe and Russell Molimock\n\n";
	print "Enter Player One's Name (X): ";
	my $player_one = <STDIN>;
	print "\nEnter Player Two's Name (O): ";
	my $player_two = <STDIN>;
	print "---------------\n\n";
	display();
	print "To select a square, enter the corresponding number.\n";
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
greeting();
for(my $i=0;$i<=9;$i++){
  $board{$i}=' ';
}
game($playing);
