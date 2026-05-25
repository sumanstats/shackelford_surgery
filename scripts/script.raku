my $input = "chapters.book";

my $current-dir = "default".IO;  # fallback directory
$current-dir.mkdir unless $current-dir.e;

for $input.IO.lines -> $line {

    my $trim = $line.trim;

    # Skip empty lines
    next if $trim eq '';

    # Match Volume header
    if $trim ~~ /^Volume\s+(\d+)/ {
        $current-dir = "Volume_$0".IO;

        # Create directory if not exists
        $current-dir.mkdir unless $current-dir.e;
        next;
    }

    # Match chapter lines like "1. Title ..."
    if $trim ~~ /^(\d+)\s+(.+)/ {
        my $title = $1;



        # sanitize filename: replace spaces with _
        my $filename = "$0_" ~ $title.subst(/\s+/, '_', :g)
                                .subst(/<[\\ \/ : * ? " < > | ,]>/, '', :g);

        my $file = $current-dir.add("$filename.qmd");

        if !$file.e {
           $file.spurt("");  # create empty file (or write template content)
           say "Created: $file";
           }
           else {
            say "Skipped (already exists): $file";  # optional feedback
            }
}
    }