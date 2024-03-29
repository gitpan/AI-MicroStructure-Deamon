#!/usr/bin/perl -w
package AI::MicroStructure::Deamon;

use strict;
use utf8;
use File::Spec;
#use AI::MicroStructure;
use JSON::XS;
use Data::Printer;

binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';


BEGIN 
{
`IFS_BAK=\$IFS;
IFS=\$'\n'`;

push @ARGV,"New_World_Order conspiracy";


}
# Library path bootstrap
my @path;
if (defined $ENV{PAR_TEMP}) { # See PAR.pm
	@path = ($ENV{PAR_TEMP}, 'inc');
}
else {
	my $binary = File::Spec->rel2abs($0);
	my ($vol, $dirs, undef) = File::Spec->splitpath($binary);
	@path = ($vol, $dirs, File::Spec->updir);
}
my $libdir = File::Spec->catdir(@path, 'lib');
unshift @INC, $libdir if -d $libdir;

# Load modules needed in this script

eval q/
	use AI::MicroStructure::Cache;
	use AI::MicroStructure::Relations;
/;
die $@ if $@;


my $cache = {};
my $new = AI::MicroStructure::Relations->new();
$new->{scale} = 0.1;
#my $page_iter = iterate(\&gofor,[map{$_=sprintf("http://en.wikipedia.org/wiki/%s",$_)}@ARGV]);
#print Dumper [iterate(\&fetch,[$urls[0]])];


push @ARGV,$_ for qw("Lie Conspiracy Politics President NWO International_relations War Crime Freedom Weapon Ufo");

foreach(@ARGV)
{
  $new->gofor($_);#
}


#die(ref $new->{storage});
$new->{storage}->{data} = $new->inspect($new->{scale});

my $sense = JSON::XS->new->pretty(1)->allow_blessed($new->{storage});

foreach(sort {$a <=> $b} keys %{$new->{storage}->{dominant}}){

printf("\n%s = %d",$new->{storage}->{dominant}->{$_},$_) unless($_==1);

}

`IFS=\$IFS_BAK;`;


p $new->{storage}->{data};







__DATA__


#print Dumper $micro;

# ABSTRACT: AI::MicroStructure   Starts some relation aggregation supposed to grow to a server

=head1 NAME
  AI::MicroStructure::Deamon
=head1 DESCRIPTION
  Creates a session 
=head1 SYNOPSIS    
  
  perl Deamon.pm ufo secret
  
=head1 AUTHOR

  Hagen Geissler <santex@cpan.org>

=head1 COPYRIGHT AND LICENCE

  Hagen Geissler <santex@cpan.org>

=head1 SUPPORT AND DOCUMENTATION

  ☞ [sample using concepts](http://quantup.com)

  ☞ [PDF info on my works](https://github.com/santex)

  
=head1 SEE ALSO

  AI-MicroStructure
  AI-MicroStructure-Cache
  AI-MicroStructure-Deamon
  AI-MicroStructure-Relations
  AI-MicroStructure-Concept
  AI-MicroStructure-Data
  AI-MicroStructure-Driver
  AI-MicroStructure-Plugin-Pdf
  AI-MicroStructure-Plugin-Twitter
  AI-MicroStructure-Plugin-Wiki

  
__END__
__DATA__

