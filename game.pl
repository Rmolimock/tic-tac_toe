#!/usr/bin/perl -w
my %board;
for(my $i=0;$i<=9;$i++){
  $board{$i}=' ';
}
$playing=1;
sub display
{
	print "\n\n-------------------\n";
	for (my $i=0;$i<9;$i++)
	{
		if($i==0||$i==3||$i==6)
		{
			print "|";
		}
		$n=$i+1;
		print "$n: $board{$i} |";
		if($i==2||$i==5||$i==8)
		{
			print "\n-------------------\n";
		}
	}
print "\n\n";
}
display();
