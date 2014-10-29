while {read created file title} {
    local id="tag:eiro.github.com,${created%T*}:$file"
    print "<entry><id>$id</id><title>$title</title>"
    print '<content type="html">'
    pandoc -thtml5 $file | perl -CSD -MHTML::Entities -lne 'print encode_entities $_,q(<>&)'
    print '</content>'
    print '<link rel="alternate"
        type="text/html" href="http://eiro.github.com/aposts/2014/'${file%.md}.html'"/>'
    print "<published>$created</published><updated>$created</updated></entry>"
}
