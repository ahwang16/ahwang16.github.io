---
title: How to Read a Research Paper
summary: >
    Literature review? Just starting out? I have a few tips on how to read a research 
    paper more effectively.
layout:  post
modified: 2022-07-10
category: research-tips
---
Reading a research paper isn't the same as reading a story, a newspaper 
article, or even a textbook. Research papers tend to be dense, filled with 
(unfamiliar at first) technical terms, and more difficult to understand than 
anything else you'll read in your daily life. One advantage that research 
papers have, however, is that they tend to be written systematically---
because many of us aim for the same few top-tier conferences, with 
similar reviewing guidelines and expectations---which means that they can also 
be read systematically.

This will of course vary by field and even subfield. The NLP papers I'm 
familiar with tend to be on the shorter side: a "long paper" submitted to a 
conference like ACL or EMNLP has a limit of 8 pages plus references and a newly 
required "Limitations" section. A "short paper" is limited to 4 pages and 
describes a smaller contribution, negative result, or other kind of work. HCI 
papers, as I understand, actually have no page limit, but longer papers are 
expected to describe fuller, more significant, more complete work.

Whether you're reading for breadth or depth, we can take advantage of a paper's 
predictable structure to read it more quickly and efficiently.

***Tip***: Pay attention to what you do or don't like about what you read. Then 
apply your observations the next time you write!

**Table of Contents**
- toc
{:toc}

## Before Passing Go: Use a Citation Manager!
A citation manager is a software that helps you keep track of your references. 
Instead of copy and pasting citations into a file and adjusting everything by 
hand, a citation manager can help your citations organized and automatically 
adjust for different citation styles. Citation managers are especially useful if 
you use LaTeX. I like [Zotero](https://www.zotero.org/){:target="_blank"} 
because it is free and open-source. It also has 
a desktop app, Chrome extension, and notes section for each citation. The paid 
version of Overleaf can sync your bib file with Zotero, which is super great. 
Other options include EndNote and Mendeley. Try it out!

If you want to go really bare-bones, you could keep a running plaintext file 
and copy-and-paste all of your bibtex citations in there. Then you can use the 
same giant bibtex file for all LaTeX papers. A citation manager essentially 
does the same thing but manages the giant bibtex file for you with some extra 
functions.

## Reading an Abstract
In my opinion, an abstract is like a cheat sheet for a research paper. It 
should tell you the answers to the following questions...

- **Context**: What is happening in research at that moment that makes this paper 
worth writing (and therefore reading)?
- **Problem/goal**: What task is the work in this paper trying to accomplish?
- **Contribution**: What does this paper deliver?
- **Methods**: What do the researchers do address the problem/goal and create the 
contribution(s)?
- **Results**: What did the study find (and how did they evaluate it)?
- **Impact**: Why is this work important?

...in that order (but that's just my preference).

There's one more thing you need to pay attention to, but this time the answer 
comes from you.

- **Relevance**: How is this work related to your project?

I like to keep track of papers and these characteristics in a spreadsheet. I 
also love analog tools, so I often write notes down on index cards in a 
modified version of the 
[Zettelkasten Method](https://zettelkasten.de/posts/overview/){:target="_blank"}. 
The main idea is that each index card represents a unit of knowledge. Index 
cards are labeled with a unique identifier so cards can reference other cards, 
creating imaginary edges between cards ("nodes"). It's basically an extensible, 
packable, paper web of knowledge.

My favorite abstracts are transparent and specific about each of these 
characteristics. I think the abstract from the 
[BERT paper](https://arxiv.org/abs/1802.05365){:target="_blank"} is particularly strong:

<blockquote><p>We introduce a new language representation model called BERT, which stands for Bidirectional Encoder Representations from Transformers. Unlike recent language representation models, BERT is designed to pre-train deep bidirectional representations from unlabeled text by jointly conditioning on both left and right context in all layers. As a result, the pre-trained BERT model can be fine-tuned with just one additional output layer to create state-of-the-art models for a wide range of tasks, such as question answering and language inference, without substantial task-specific architecture modifications.</p>

<p>BERT is conceptually simple and empirically powerful. It obtains new state-of-the-art results on eleven natural language processing tasks, including pushing the GLUE score to 80.5% (7.7% point absolute improvement), MultiNLI accuracy to 86.7% (4.6% absolute improvement), SQuAD v1.1 question answering Test F1 to 93.2 (1.5 point absolute improvement) and SQuAD v2.0 Test F1 to 83.1 (5.1 point absolute improvement).</p></blockquote>

This abstract packs a lot of information into just 152 words! It is clear about 
the contribution (a new language model called BERT, and they even spell out the 
abbreviation, *and the abbreviation actually makes sense*), context (improving 
language representation models), problem/goal (creating a new SOTA model for a 
wide range of tasks), method (jointly condition on left and right context in all 
layers), and results (SOTA performance on eleven NLP tasks, and they even pick out 
a handful of specific tasks, scores, metrics, and improvement). The impact this 
paper claims to have is 
implicit but obvious: this new BERT thingamabob is (simply and powerfully) a 
big deal. (And it really is: this paper has been cited over 42,000 times.)

The next time you write an abstract, remember the reader. Why do readers read 
abstracts? *Most readers (of research papers) want to read as little as 
possible.* Abstracts are tools to help first-time readers decide if they are 
going to open the PDF and remind repeat readers what the papers were about when 
they forget for the umpteenth time. So spoil the ending. Tell us exactly what 
happens in the end. Don't hide your hard work in vague language!

## Reading for Depth
Sometimes you want to read a paper from top to bottom or understand it more 
thoroughly than a quick scan. When I review literature for a new project, 
I usually start by reading a couple recent or landmark papers for depth and 
then branching out from there. Many research areas---unless they're very very 
new---have a handful of foundational papers that everyone knows about. These 
are also worth reading thoroughly when you get a chance.

### Read introductions to learn about the task.
When reading for depth, I like to start by reading the introduction, especially 
if I'm working in a new topic area. Introductions are great places to learn 
about a task, past approaches, and current challenges. Pay attention to the 
vocabulary that is often used in the papers you read. This is how you learn 
*technical terms*. Technical language isn't inherently a bad thing. When used 
properly, it makes communication more efficient (or even more clear) 
because it gives a common term to a common idea. As opposed to jargon, which is 
unnecessarily complex language for an idea that can be described plainly. 
Josh Schimel gave a great 
[talk](https://www.youtube.com/watch?v=ai0BDpJkfmU&t=1475s){:target="_blank"} 
about this (skip to 24:00 for the part on jargon in particular).

### Check out the contributions at the end of the introduction.
If you have a good idea of what's going on in general, you can skip most of the 
introduction and go right to the last paragraph. The last paragraph often 
contains a description or bullet-point list of the contributions.

### Use the related work section to expand your web of knowledge.
A related work section is almost like a brief history of the relevant research 
that led to the paper you are looking at. Remember that research is not done in 
a vacuum. Each work builds off something in the past---tries to solve a challenge  
that was previously left unconquered. The rest of the paper is dedicated to 
*what this paper* contributes to the field; the related work section focuses 
on *why* they contributed it and *what else* helped them.

Keep a running list of papers that are cited in this section and check if you 
need to read more about them later. Pay extra attention to papers that are cited 
over and over again. You'll end up with a lengthy list of papers to go through. 
You'll know you're familiar with a good chunk of the literature in your topic 
area when your list of new papers becomes shorter and shorter with each paper 
you read.

### Spoil the ending: skip to the discussion section.
Most of the time, you should probably skip the methods and results sections and 
skip right to the discussion, where the authors will discuss the aforementioned 
methods and results (the results are often combined with the discussion, 
anyway). You should have a good enough understanding of the methods by reading 
the abstract or introduction, and the discussion will interpret the results for 
you. It's kind of like a three-in-one shortcut.

Read the discussion section with a critical eye. Don't passively accept the 
authors' explanation of their work---look out for strengths, weaknesses, and 
connections to other work. Some guiding questions:

- What were these authors trying to accomplish? (Task)
- How did the authors attempt to accomplish the task? (Methods)
- How did the authors evaluate their work? (Metrics)

Establishing evaluation metrics for NLP work is difficult. How are you supposed 
to compute a number for how complete a summary or fluent a translation is? 
Automatic metrics are often approximations of human intuition, which means the 
metrics themselves have strengths and weaknesses. Metrics can be gamed, 
uninformative, or just plain confusing. Even so, we still need metrics 
because we need to have some way of quantifying our work and comparing it to 
others'. While evaluating the authors' work, be sure to evaluate their 
evaluation, too. If the paper has a limitations section, see if your thoughts 
align with theirs. You may be surprised by what you see.

### Mostly optional: read the methods section.
For most papers, you'll need to understand *what* the authors do to solve the 
task, not necessarily *how* they do it. You can probably skip or skim the 
methods section for a general idea of the experimental setup. Some key 
information to look out for:

- What kind of contribution does this work make?
    - In NLP, popular contributions focus on a model/computational method or dataset.
    - In HCI, popular contributions focus on a prototype or series of user studies.
- What is the experimental setup?
    - In NLP, this probably looks like some combination of a model (neural or 
      otherwise), dataset, and evaluation metrics.
    - In HCI, this probably looks like some combination of an interactive 
      device, user study participants, and quantitative/qualitative feedback.
- What is the source of data?
    - In NLP, look out for pre-training and fine-tuning datasets. Pay attention 
      to size, leakage between the train and test sets, and domain of the 
      dataset (you may need to read about this elsewhere). The more you understand 
      your data, the better! If you're using large pre-trained language models, 
      keep track of the size of the model and its common strengths and weaknesses.
    - In HCI, look out for the characteristics of user study participants. Is 
      there a range of characteristics and does it matter? (For example, a user 
      study about a cooking app probably doesn't *need* to include people who 
      hate to cook). Are the participants experts or novices and does it matter? 
      How large is the sample size and do you think it's sufficient for the task 
      and evaluation?

## Now on to the next paper, and the next paper, and the next paper...
Literature review never really ends, but eventually the number of papers you 
need to look at will start to plateau... until you start the next project. 
Happy reading!