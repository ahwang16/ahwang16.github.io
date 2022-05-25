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

<p><b>How to use my advice</b>: Good advice should be specific to the person 
   receiving it, but it's hard to personalize what you're going to read when I 
   can't get to know you first! Instead of making lists of recommendations 
   (which I still include from time to time), I've opted for telling stories. 
   When evaluating if what I did makes sense for you, you should first check if 
   our goals and values align and extrapolate from there. I also love talking 
   to undergrads, prospective PhD students, and pretty much everyone, so feel 
   free to send me an email (located at the bottom of the page) if you'd ever 
   like to chat.</p>

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
    <h1 style="text-align: center">DivE In 2021</h1>
    <p>DivE In Weekend is the University of Pennsylvania’s diversity welcome weekend for the mind sciences. I was very excited to be head of the Programming Development Committee for our very first DivE In on October 8-10, 2021. Check out our <a href="https://web.sas.upenn.edu/dive/">website</a>, <a href="https://web.sas.upenn.edu/dive/event-resources/">event recordings and resources</a>, and <a href="https://web.sas.upenn.edu/dive/">Twitter</a>! Recordings and slides from my workshops are below.</p>

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