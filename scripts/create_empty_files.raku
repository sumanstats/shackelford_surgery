my $source = "chapters".IO;
my $target = "presentation".IO;

# Create target directory if it doesn't exist
$target.mkdir unless $target.d;


for $source.dir -> $file {
    next unless $file.basename ~~ / \.qmd $ /;
    my $new-path = $target.add($file.basename);
    # Skip this file if something already exists at the target path
    if $new-path.e {
        say "Skipped (already exists): $new-path";
        next;
    }
    spurt $new-path, "";
    say "Created: $new-path";
}






