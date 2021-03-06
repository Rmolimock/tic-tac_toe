#!/usr/bin/perl -w
my %board;
for(my $i=1;$i<=9;$i++){
  $board{$i}=$i;
}
$player_one = 0;
$player_two = 0;
$turns=0;
sub win
{
	$flag=$_[0];
	$player=$_[1];

	if($flag==1)
	{
		$symbol=10;
	}
	elsif($flag==2)
	{
		$symbol=11;
	}	
	if($board{1} eq $symbol && $board{2} eq $symbol && $board{3} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{4} eq $symbol && $board{5} eq $symbol && $board{6} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{7} eq $symbol && $board{8} eq $symbol && $board{9} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{1} eq $symbol && $board{4} eq $symbol && $board{7} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{2} eq $symbol && $board{5} eq $symbol && $board{8} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{3} eq $symbol && $board{6} eq $symbol && $board{9} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{1} eq $symbol && $board{5} eq $symbol && $board{9} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	elsif($board{3} eq $symbol && $board{5} eq $symbol && $board{7} eq $symbol)
	{
		print "The winner of the game we call tic tac toe is $player";
		return(1);
	}
	else
	{
		return(0);
	}
}
sub greeting
{
        print "\nWelcome to Tic Tac Toe\n\n";
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
	$player_one=$ARGV[0];
	$player_two=$ARGV[1];
	$board=$ARGV[2];
	$turns=$_[0];
	$again=0;
	while(1)
	{
		while(1)
		{
			print "(X) $player_one";
			print "\nIt's your turn! What square do you choose? ";
			$p1_choice = <STDIN>;
			while(update_board($p1_choice, 1, $board)==0)
			{
				display();
				print "Bad selection.\n\n";
				print $player_one;
				print "It's your turn! What square do you choose? ";
				$p1_choice = <STDIN>;
			}
			display();
			if(win(1, $player_one)==1)
			{
				last;
			}
			$turns +=  1;
			if($turns == 9)
			{
				display();
				print "Good job! You tied.\n\n";
				last;
			}
			print "(O) $player_two";
			print "\nIt's your turn! What square do you choose? ";
			$p2_choice = <STDIN>;
			while(update_board($p2_choice, 2, $board)==0)
			{
				print "Bad selection.\n";
				print $player_two;
				print "\nIt's your turn! What square do you choose? ";
				$p2_choice = <STDIN>;
			}
			display();
			if(win(2, $player_two)==1)
			{
				last;
			}
			$turns +=  1;
		}
		print "\n################################\n\nWould you like to play again (1 if yes)/(0 if no)\n";
		while(1)
		{
			$again=<STDIN>;
			if ($again =~ /\b([0|1])\b/)
			{
				$again = int($again);
				if($again == 1)
				{
					for(my $i=1;$i<=9;$i++){
						$board{$i}=$i;
					}
					display();
					last;
				}
				elsif($again == 0)
				{
					print "Not everyone has good taste\n";
					exit;
				}
			}
			print "Please enter 1/0\n";
		}
	}
}
sub update_board
{
	$flag = $_[1];
	$board = $_[2];
	if ($_[0] =~ /\b([1-9])\b/)
	{ 
		$choice = int($_[0]);
		if($board{$choice}!=$choice)
		{
			return(0);
		}
		else
		{
			if($flag==1)
			{
				$board{$choice} = 10;
			}
			if($flag==2)
			{
				$board{$choice} = 11;
			}
			return(1);
		}
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
		if($board{$i}<=9)
		{
			print " $board{$i} |";
		}
		if ($board{$i}==10)
		{
			print " X |";
		}
		if ($board{$i}==11)
		{
                        print " O |";                                                                  }
		if($i==3||$i==6||$i==9)
		{
			print "\n-------------\n";
		}
	}
print "\n\n";
}
greeting($player_one, $player_two);
game($turns, $player_one, $player_two, $board);
