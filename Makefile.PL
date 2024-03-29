use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Tk::LogScale',
    'VERSION_FROM' => 'LogScale.pm', # finds $VERSION
#    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => '.gz',
#                    'POSTOP'=>'-$(CHMOD) 644 $(DISTVNAME).tar$(SUFFIX)'},
    'PREREQ_PM'    => {'Tk' => 0,
		       # 'Tie::Watch' => 1.00, # usually already included in modern Tk's
		      },
    'ABSTRACT_FROM' => 'LogScale.pm',
    'AUTHOR' => 'Slaven Rezic (srezic@cpan.org)',
    'LICENSE' => 'perl',
);

sub MY::postamble {
    my $postamble = '';

    $postamble .= <<'EOF';
demo :: pure_all
	$(FULLPERL) -w -Mblib t/logscale.t -demo

EOF

    if (defined $ENV{USER} && $ENV{USER} eq 'eserte' && $^O =~ /bsd/i && -f "../../perl.release.mk") {
	$postamble .= <<'EOF';

.include "../../perl.release.mk"
.include "../../perl.cvs.mk"

EOF
    }

    $postamble;
}
