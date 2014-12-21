perl -lpe '
    BEGIN {%l = qw( py Python p Perl r Ruby )}
    s/^<[.](p|py|r)$/<pre><code data-trim class="writtenIn $l{$1}">/;
    s#^>$#</code></pre>#
' < slides.md | pandoc -s -trevealjs --template template.reveal -o p.html

