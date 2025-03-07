#!/usr/bin/env perl

use 5.012;
use strict;
use warnings;

sub replace_mslink
{
	my ($src, $dst) = @_;
	my ($fin, $out);
	if (defined $src) {
		open $fin, '<', $src or return "cannot open "
			. "for reading $src: $!\n";
	}
	else {
		$fin = \*STDIN;
	}
	if (defined $dst) {
		unless (open $out, '>', $dst) {
			close my $fin;
			return "cannot open for writing $dst: $!\n";
		}
		select $out;
	}
	while (<$fin>) {
		my $sanity;
		while ( m<https://urldefense[.]com/v3/__(.+?)__;(.*?)!.*?\$>g ) {
			#### print STDERR "MATCH on line: ($1, $2)\n";
			if (length $2) {
				return "error on line $.: i don't know "
				. "how to parse base64 bytes (yet): $&\n";
			}
			substr ($_, $-[0], $+[0] - $-[0]) = $1;
			$sanity++;
		}
		unless (print) {
			close $out if defined $dst;
			close $fin if defined $src;
			$dst //= 'stdout';
			return "cannot write to $dst $!\n";
		}
		if ($sanity) {
			my $s = q[s] x ($sanity != 1);
			print STDERR "Replaced $sanity link$s on line $..\n";
		}
	}
	close $out if defined $dst;
	close $fin if defined $src;
	return;
}

sub main
{
	require Getopt::Long;
	Getopt::Long::Configure (qw(bundling permute));
	my $help;
	Getopt::Long::GetOptionsFromArray (\@ARGV, 'help|h' => \$help);
	# i am evil and will force ANSI colors on everyone
	# NOTE: ESC = 0o31 = 0x1b = 27
	my $synopsis = "usage: \031[1m$0\031[0m [\031[1m--help|-h\031[0m] "
		. "[\031[4msrc\031[0m] [\031[4mdst[\031[0m]\n";
	my $usage = <<HELP;
$synopsis
i resolve microsoft URLs. pass me a file i can read, and
i will spew the filtered version back to you over stdout.
if you like, pass another file so i can spew it there.

options:
  --help, -h   print this message

arguments:
  src    path to source file (default: "-" or stdin)
  dst    path to destination (default: "-" or stdout)
HELP
	if ($help) {
		print $usage;
		return 0;
	}
	unless (0 <= @ARGV <= 2) {
		print STDERR $synopsis;
		return 1;
	}
	my ($src, $dst) = @ARGV;
	if (defined $src and $src eq '-') { undef $src; }
	if (defined $dst and $dst eq '-') { undef $dst; }
	my $error = replace_mslink ($src, $dst);
	die $error if $error;
	return 0;
}

exit main (@ARGV) unless caller;

=head1 NAME

replace-mslink.pl - replace microsoft's junk URL with the real ones

=head1 SYNOPSIS

Command call:
B<./replace-mslink.pl> [B<--help>|B<-h>] [I<src>] [I<dst>]

Library call:
   do './replace-mslink.pl';
   replace_mslink ($src, $dst);

=head1 DESCRIPTION

This is a simple filter that replaces Proofpoint v3 URLs with
their encoded content.  The code turned out to be equivalent to
searching for C<https://urldefense[.]com/v3/__(.+?)__;(.*?)!.*?\$>
globally and replacing with the first capture group, but that's
just because I am too lazy to deal with the weird Base64 string
in the second capture group.

B<This isn't proper Perl practice!>  Normally commands like these are
packaged as a Perl module (a C<.pm> file that is), and a package
declaration is used.  I can justify this because it is meant to be
used on the command-line; use of the Perl code directly is just a
niche thing for my email composition script.

Each substitution is printed to standard error; if that is displeasing
to your eyes, silence the error stream by prepending or appending
C<< 2>/dev/null >> to your command.

=head1 OPTIONS/PARAMETERS

=over

=item C<--help>, C<-h>

(Command-line only.) Print help message to standard out.

=back

The following options follow the Unix convention of treating
C<-> as standard input/output.

=over

=item C<src>

Optional source file to read from.  When provided it must be the
first argument.  Read from standard input when C<src> is - or omitted
(in Perl, pass C<undef> instead.)

=item C<dst>

Optional destination to print to.  When provided it must be the
second argument.  Print to standard output when C<dst> is - or omitted
(in Perl, pass C<undef> instead.)

=back

=head1 EXIT STATUS/RETURN VALUE

On success, the command returns 0, and the Perl subroutine return nothing.

On failure, the command returns E<gt>0, and the Perl subroutine returns
a single line of diagnosis ending with a line feed.

=head1 BUGS

This script does not handle the case where the second capture group
of the regular expression presented in I<DESCRIPTION> is nonempty.

Further, it is probably a bad idea to print stuff to standard error
when used as a library call.  But then again, defining library code
in a script is an even worse idea.  So there is no reason to address
this point other than promoting this script to a proper module.

=head1 SEE ALSO

L<sed(1)>, L<perl(1)> with C<-e> might suffice if you just want
the regular expression.

This was based on Proofpoint's Python script, whose link is included in:
L<How do I decode a rewritten URL?|https://help.proofpoint.com/Threat_Insight_Dashboard/Concepts/How_do_I_decode_a_rewritten_URL%3F>.
The link to the script itself was
L<https://help.proofpoint.com/@api/deki/files/2775/urldecoder.py?revision=1>
at the time of writing this, which honestly sucks in my opinion.

=cut

1; # tell 'do' that we survived all that ordeal

__END__
