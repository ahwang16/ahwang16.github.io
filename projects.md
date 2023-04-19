---
layout: default
title: Projects
---
<h1 style="text-align: center;">Projects</h1>

<p>Major projects, along with papers, talks, code, slides, posters, and other resources when available. I care about inclusive interfaces---if you have feedback on how I can make my work more accessible, send me an email!</p>

<p>Feel free to use my slides to reverse-engineer my figures for your talks. If you find my slides helpful, I would love to hear from you or be cited in your presentation. 😊</p>

<div>
    {% for post in site.posts %}
        {% if post.path contains 'projects' %}
        <div style="display: flex; column-gap: 3%;">
            <img src="{{ post.thumbnail }}" alt="Diagram of chatbot" style="width: 20%; height: auto; display: block; object-fit: scale-down;">
            <div style="display: flex; flex-direction: column; align-items: flex-start;">
                <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
                <p>Posted: {{ post.date | date: "%b %d, %Y" }} | Modified: {{ post.modified | date: "%b %d, %Y" }}</p>
                <p>{{ post.summary }}</p>
            </div>
        </div>
        {% endif %}
    {% endfor %}
</div>