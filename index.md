---
layout: page
#title: eiro > /dev/web
#tagline: Supporting tagline
---
{% include JB/setup %}

# Blog posts

{% for p in site.posts %}
* [{{ p.title }}]({{ p.url}}), {{ p.date | date_to_string }}
{% endfor %}


