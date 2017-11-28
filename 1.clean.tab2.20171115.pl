#! /usr/bin/perl

# usage:
# ~/pypeworks/biogrid/00_cleanup_biogrid_table.pl  BIOGRID-ORGANISM-Homo_sapiens-3.2.117.tab2.txt > BIOGRID-ORGANISM-Homo_sapiens-3.2.117.tab2.clean.txt
# can use bash to apply it to more species as needed
# modified from https://github.com/ivanamihalek/biogrid/blob/master/00_cleanup_biogrid_table.pl

while ( <>) {
    chomp;
    @aux = split "\t";
    @new = ();
    foreach (@aux) {
        $blah = $_;
        $blah =~ s/\s//g;
        ($blah eq '-') && ($blah='');
        if (! $blah) {
            push @new, 'NA';
        } else {
            # somebody in BioGRID thought it would be cute to use backslash
            # as quotes
            $blah = $_;
            $blah =~ s/\\//g;
            push @new, $blah;
        }
    }
    
    print join ("\t", @new), "\n";
}
