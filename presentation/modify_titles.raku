my @folders = <Volume_1 Volume_2>;

for @folders -> $folder {

    next unless $folder.IO.d;

    for $folder.IO.dir -> $file {

        next unless $file.basename ~~ /^\d+ '_'/;

        my $content = $file.slurp;

        next if $content ~~ /^ \s* '#'/;

        my $title =
            $file.basename
                 .subst(/\.qmd$/, '')
                 .subst('_', ' ', :g);

        $file.spurt("# $title\n\n" ~ $content);
    }
}


