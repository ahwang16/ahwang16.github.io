---
layout: default
title: Advice
---
<h1 style="text-align: center;">Advice</h1>

<p>I've learned a lot while making my way through college, internships, and the
   first couple of years of a PhD program. I've relied on Reddit posts, advice
   from friends/peers/mentors, and a bunch of trying-and-hoping-for-the-best to
   get to where I am now. I figured I would write my experiences down along the
   way, in hopes that it make someone else's academic journey easier some day.</p>

<p><b>How to use my advice</b>: At my first internship, right before I applied 
for PhD programs, I went around asking different full-time employees with PhDs 
if they would recommend going to a PhD program. Shockingly, most of them said 
no, it's not useful, and I should avoid it if I can. One panic later, I 
realized that I was speaking with the wrong audience: these were software 
engineers, many of whom don't work in research or at least don't aim to publish 
every year. Some of them were from other countries and pursued a PhD to help 
with immigration. Our goals and situations were too different for me to 
directly apply this advice, but I did learn a lot about career planning in 
general.</p>

<p>In this spirit, I try to avoid making universal declarations because I know 
what works for me won't work for everyone because we're all different. I also 
try to be explicit about my thoughts and experiences so you can understand why 
something works for me, not just what works for me. Then you can extrapolate to 
fit your own thoughts and experiences. Or just ignore me. 😅</p>

<p>Happy reading!</p>

<div>
    <h1 style="text-align: center">More About Me</h1>
    {% for post in site.posts %}
        {% if post.path contains 'more_about_me' %}
        <div style="display: flex; flex-direction: column; align-items: flex-start;">
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>Posted: {{ post.date | date: "%b %d, %Y" }} | Modified: {{ post.modified | date: "%b %d, %Y" }}</p>
            <p>{{ post.summary }}</p>
        </div>
        {% endif %}
    {% endfor %}
</div>

<div>
    <h1 style="text-align: center">Applying to PhD Programs and Fellowships</h1>
    {% for post in site.posts %}
        {% if post.path contains 'phd_fellowships' %}
        <div style="display: flex; flex-direction: column; align-items: flex-start;">
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>Posted: {{ post.date | date: "%b %d, %Y" }} | Modified: {{ post.modified | date: "%b %d, %Y" }}</p>
            <p>{{ post.summary }}</p>
        </div>
        {% endif %}
    {% endfor %}
</div>

<div>
    <h1 style="text-align: center">Succeeding as a CS Researcher</h1>
    {% for post in site.posts %}
        {% if post.path contains 'research' %}
        <div style="display: flex; flex-direction: column; align-items: flex-start;">
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>Posted: {{ post.date | date: "%b %d, %Y" }} | Modified: {{ post.modified | date: "%b %d, %Y" }}</p>
            <p>{{ post.summary }}</p>
        </div>
        {% endif %}
    {% endfor %}
</div>
<div>
    <h1 style="text-align: center">DivE In 2021</h1>
    <p>DivE In Weekend is the University of Pennsylvania’s diversity welcome weekend for the mind sciences. I was very excited to be head of the Programming Development Committee for our very first DivE In on October 8-10, 2021. I have since stepped down as a committee leader but I am happy to return every year to present a workshop. Check out our <a href="https://web.sas.upenn.edu/dive/">website</a>, <a href="https://web.sas.upenn.edu/dive/event-resources/">event recordings and resources</a>, and <a href="https://web.sas.upenn.edu/dive/">Twitter</a>! Slides and recordings (when available) from my workshops are below.</p>

   {% for post in site.posts %}
        {% if post.path contains 'dive_in' %}
        <div style="display: flex; flex-direction: column; align-items: flex-start;">
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>Posted: {{ post.date | date: "%b %d, %Y" }} | Modified: {{ post.modified | date: "%b %d, %Y" }}</p>
            <p>{{ post.summary }}</p>
        </div>
        {% endif %}
    {% endfor %} 
</div>