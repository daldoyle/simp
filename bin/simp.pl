#!/usr/bin/perl -I ../lib 
use strict;
use warnings;

use Getopt::Long;
use GRNOC::Simp::Poller;

sub usage {
    print "Usage: $0 [--config <file path>] [--logging <file path>] [--nofork]\n";
    exit( 1 );
}


use constant DEFAULT_CONFIG_FILE => '/etc/grnoc/simp/config.xml';

my $config_file = DEFAULT_CONFIG_FILE;
my $logging;
my $nofork;
my $help;

GetOptions( 'config=s' => \$config_file,
 	    'logging=s' => \$logging,
	    'nofork' => \$nofork,
            'help|h|?' => \$help );

usage() if $help;


my $poller = GRNOC::Simp::Poller->new(
			config_file    => $config_file,
                        logging_file   => $logging,
			daemonize      => !$nofork );

$poller->start();

