% sympa to comment blog posts: how? 

I explained [why](http://eiro.github.io/news.html#sympa-to-comment-blog-posts-why) 
i want to use sympa to manage comments. this is the "how" (as an experiment)

## create a blogcomment scenario

the idea of this scenario is you can publish in 2 cases: 

* you are a member of the list
* you're commenting a blog post

so my `/etc/sympa/scenari/send.blogcomment` file is 

    title.gettext Blogpost comment
    title.fr Blogpost Comment

    match([msg_header->X-Spam-Status], /^YES/)            smtp,smime,md5  -> reject,quiet 
    match([msg_header->In-Reply-To], /eiro.github.io/)    smtp,smime,md5  -> do_it
    match([msg_header->In-Reply-To], /blog/)              smtp,smime,md5  -> do_it
    is_subscriber([listname],[sender])                    smtp,smime,md5  -> do_it
    true()                                                smtp,smime,md5  -> reject,quiet  

now the list itself is configured to use the blogcomment scenario. which means that you
must have this in in the list root

     grep '^send' config
     send blogcomment

## create posts from your webpage 

what you need is add an mailto: URL with 

* the subject of the post as subject
* a `Reply-To` header to please the `blogcomment` scenario

i use [this simple script](add_comment_links.pl) in combination with
[atombomb](https://github.com/eiro/app-atombomb) to achieve that on this site. 
