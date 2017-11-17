use feature ":5.10";


@words = ("messi", "ronaldo", "silva", "puyol");
@guesses = ();
$solved = 0;
$num_of_tries = 0;

&main();

sub main {

        
        $word = @words [int(rand(3)) - 1];
        $size = length($word);
        print"The word is: " . $word . "\n";
        for ($i=0; $i < $size; $i++) {
                $guesses [$i] = '_';
        }
        while (!$solved) {
                &hangmanDisplay();

                print join(" ", @guesses);
                print "\n\nEnter a letter: ";
                my $guess = <>;
                chomp($guess);
                
                &checkLetter($word, $guess);

                $solved = &checkWin($word);

               
        }

    print join(" ", @guesses);
    print "\n\nYay you win!\n";
	
	system("python", "won.py") == 0 or die "Python script returned error $?";
}
sub hangmanDisplay() {
     {
        if($num_of_tries==0) {&Display1();}
        elsif($num_of_tries==1) {&Display2();}
        elsif($num_of_tries==2) {&Display3();}
        elsif($num_of_tries==3) {&Display4();}
        elsif($num_of_tries==4) {&Display5();}
        elsif($num_of_tries==5) {&Display6();}
        elsif($num_of_tries==6) {&Display7();}
    }
}
sub checkLetter {
    ($word, $guess) = @_;
    $letterIndex = index($word, $guess);

    if ($letterIndex == -1) {
        print "Wrong!\n";
        $num_of_tries++;
    } else {
        for ($i=0; $i < length($word); $i++) {
            $c_letter = substr($word, $i, 1);
            if ($guess eq $guesses[$i]) {
                print "You already guessed $guess!\n";
            }
            if ($guess eq $c_letter) {
                $guesses [$i] = $c_letter;
            }
        }
    }
}
sub checkWin {
    ($word) = @_;
    $letter;
    for ($i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $guesses [$i]) {
            return 0;
        }
    }
    return 1;
}
sub Display1
{
        print "  -------\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display2
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display3
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display4
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display5
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display6
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub Display7
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     x\n";
        print "  |    \\|/\n";
        print "  |     /\\\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    print "You lost!\n";
	system("python", "lost.py") == 0 or die "Python script returned error $?";
    exit 0;
}