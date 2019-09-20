#!/usr/bin/perl -w
my %board;
for(my $i=1;$i<=9;$i++){
  $board{$i}=$i;
}
$playing=1;
sub greeting
{
	print "\nWelcome to Tic Tac Toe by Nick O'Keefe and Russell Molimock\n\n";
	print "Enter Player One's Name (X): ";
	my $player_one = <STDIN>;
	print "\nEnter Player Two's Name (O): ";
	my $player_two = <STDIN>;
	print "---------------\n\n";
	display();
	print "To select a square, enter the corresponding number.";
	print "$player_one: ";
	$p1_choice = <STDIN>;
	print $p1_choice "\n";
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
