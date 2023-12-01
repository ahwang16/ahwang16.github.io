---
title: "Part 1: Understanding GPT-3"
summary: >
    Part 1 of the Build Your Own ChatGPT tutorial.
layout:  post
modified: 2023-08-08
permalink: /build-your-own-chatgpt/part-1-understanding.html
---
<style>
    span {
        background-color: "#D9EAD3";
    }
</style>

| [&lt; Back to Build Your Own ChatGPT Main Page]({% post_url /projects/2023-04-18-build-your-own-chatgpt %}) | [Next to Part 2: Implementing Our Chatbot &gt;]({% post_url /subpages/2023-08-06-implementing-our-chatbot %}) |

## Table of Contents
- toc
{:toc}

## GPT-3: The Brain of Our Chatbot
GPT-3, the third in a series of Generative Pre-trained Transformers, is the artificial brain of our chatbot (Brown et al., 2020). It is one of the most powerful language models for a wide range of tasks and can produce stunning outputs like (**human input in bold**, GPT-3 output in plain)

> **What's a limerick?**
> 
> A limerick is a five-line poem with a rhyme scheme of AABBA. The first, second, and fifth lines rhyme with each other, and the third and fourth lines rhyme with each other.
> 
> **Write me a limerick about a puppy.**
> 
> A little puppy I did see  
> On the streets all covered in fleas  
> I took him in  
> Gave him a bath and then  
> He was the cutest thing on four feet!
> 
> **What is 5 + 2 * 3?**
> 
> 11

but it is not perfect! Recent research has explored biases and flaws in GPT-3 outputs, and you can see from the examples below that GPT-3 is not always correct (or useful).

> **Should I eat carrots or broccoli?**
> 
> The answer to this question depends on what you are trying to achieve. If you are looking to improve your health, then you should eat both carrots and broccoli. However, if you are trying to lose weight, then you should focus on eating broccoli.

> **Write me a haiku.**
> 
> A haiku about life  
> Life is full of ups and downs  
> But it's always worth living

> **I stole a cookie from the cookie jar. Then my friend walked in. Does my friend know I have the cookie?**
> 
> Yes, your friend knows you have the cookie because you told them.

> **Should I walk to work?**
> 
> There is no definitive answer, as it depends on many factors such as distance, weather, and terrain.

Even when GPT-3 is correct---deciding to walk to work does indeed depend on "many factors such as distance, weather, and terrain"---it is not always useful. How annoying would it be if your favorite voice assistant essentially answered "maybe" to everything? While some of these shortcomings can be mitigated with advanced fine-tuning, pre-training, and reinforcement learning methods (Ouyang et al., 2022), the task of evaluating the complex text that these new generative models are able to produce is still an open question in NLP research.

## How to Use GPT-3
GPT-3 works by taking some text as input---called a *prompt*---and generating some text as output---called a *completion*. We can carefully design the prompt to generate a completion that suits our needs. This is typically called prompting or prompt engineering in Machine Learning and Natural Language Processing literature and prompt programming in Human-Computer Interaction literature (Liu et al., 2021; Yang et al., 2022; Liu and Chilton, 2022; Reynolds and McDonell, 2021).

Prompt engineering often incorporates examples of the task in the context window. Influencing a model in this fashion is called “in-context learning,” which allows us to train a model without updating the model weights. We often do this in one- or few-shot settings, where the number of "shots" represents the number of examples in the prompt (Brown et al., 2020). Another popular form of prompt engineering is called zero-shot learning, where no examples are provided at all, just a natural-language instruction. Beyond the number of examples, prompt engineering can incorporate methods for writing the natural-language instruction, choosing the examples, or putting them in a good order. Today, we will focus on zero-, one-, and few-shot learning.

Zero-shot learning provides a natural-language instruction with zero examples in the prompt. In this example, we are telling GPT-3 that the input text represents a conversation with an AI persona, which is a dog. We give it a message from a "Human" and ask GPT-3 to generate the message from the "AI." In the following examples, the prompt is in bold and the <span style="background-color: #D9EAD3">completion is highlighted in green</span>.

> **The following is a conversation with an AI persona. The AI is a dog.**
> 
> **Human: Hi, how are you?**  
> **AI:** <span style="background-color: #D9EAD3">I'm good, how are you?</span>

GPT-3 already performs quite well with just an instruction, but we can give it a little help with one example of an AI response for one-shot learning:

> **The following is a conversation with an AI persona. The AI is a dog.**
> 
> **Human: Hi, how are you?**  
> **AI: I'm excited!**  
> **Human: What do you like to do for fun?**  
> **AI:** <span style="background-color: #D9EAD3">I love to play fetch!</span>

We can even give it multiple examples for few-shot learning. In the next example, we'll "teach" GPT-3 to be a bit more curious. One strategy for few-shot learning is to fill up the prompt with as many examples as we can within the 2,048-token limit (which is shared between the prompt and completion), which is usually between 10 and 100 examples depending on the task (Brown et al., 2020).

> **The following is a conversation with an AI persona. The AI is a dog.**
> 
> **Human: Hi, how are you?**  
> **AI: I'm excited!**  
> **Human: What do you like to do for fun?**  
> **AI: I love to play fetch! What about you?**  
> **Human: I like watching funny movies.**  
> **AI: My favorite food is chicken! What about you?**  
> **Human: Spaghetti. Do you like going on walks?**  
> **AI: Yes, I love going on walks! What about you?**  
> **Human: I like walking. What are you doing today?** 
> **AI:** <span style="background-color: #D9EAD3">I'm going for a walk! What about you?</span>

For tasks that are too complex or require prompts that are too long for few-shot learning, we can fine-tune GPT-3 on a small set of labeled data. Fine-tuning, unlike prompt engineering, updates the model weights (Brown et al., 2020).

Fine-tuning GPT-3 is fairly simple with the OpenAI API and you can review more implementation details in this Colab notebook. The API offers access to several GPT-3 models in increasing size: `ada`, `babbage`, `curie`, and `davinci`. We'll experiment with `curie` because it is more capable than `ada` and `babbage` and cheaper and faster than `davinci`. We'll also be using the Learning in Interactive Games with Humans and Text (LIGHT) dialogue dataset, which is a dataset of crowdsourced character-driven, human-human interaction in a fantasy text adventure world (Urbanek et al., 2019).

The LIGHT dialogue dataset contains 9,807 conversations between two characters, like a court wizard, soldier, thief, person, fairy, witch, guard, or prisoner. For our fine-tuning data, we will tell GPT-3 which characters are having a conversation in the prompt like

> The following is a conversation between **mice** and <u>knight</u>.

and the conversation itself, followed by "###" as a special stop token for the completion.

> **mice**: Can you spare some cheese?  
> <u>knight</u>: I would love to give you some cheese because it would give me great honor.  
> **mice**: You are so kind. Most people scream when they see me.  
> <u>knight</u>: I am a knight, and it is my duty to be honorable! I am of noble blood.  
> **mice**: I am so delighted to not have to scavenge for food in the village.  
> <u>knight</u>: I am happy to help. Now, don't let any of the king's royal guard see you!  
> **mice**: I will hide behind that trunk  
> \#\#\#

The bold and underlined formatting is there to help you read the example and is not given to GPT-3 during fine-tuning. Each line ends with a newline. When we generate an output with our fine-tuned model, GPT-3 will stop at the first newline so it only generates one line of output even though it learns from multiple lines of input.

For example, our prompt for generating output with a cat persona would be something

> The following is a conversation between **human** and <u>cat</u>.
> 
> **human**: Hi, how are you?  
> <u>cat</u>:

and the completion would look something like

> Hello, I am hungry for tuna and I like to play with yarn.

Don't forget to save the name of your fine-tuned model so you can use it again later! Let's compare outputs from a vanilla `curie` model and a fine-tuned `curie` model to see how fine-tuning affects language generation. For both examples, the prompt is "This is a conversation between wizard and human."

| Vanilla `curie` | Fine-Tuned&nbsp;`curie`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
| --------------- | ----------------- |
| Human: Hi, what are you doing? | Human: Hi, what are you doing? |
| Wizard: I am casting a spell. | Wizard: Just practicing my spells. |
| Human: What kind of spell? | Human: What kind of spells? |
| Wizard: I am casting a spell to make a cake. | Wizard: Mostly what I learned from my master. |
| Human: Why? | Human: What is your favorite spell? |
| Wizard: I want to make a cake because I am hungry. | Wizard: I really like the one that turns everything into gold. |
| Human: What kind of job do you have? | Human: Why? |
| Wizard: I am a wizard. |  Wizard: It's just my favorite. |
| Human: Tell me how to cast a spell. | Human: What job do you have? |
| Wizard: First, you have to gather some ingredients. You need sugar, flour, eggs, and butter. Then, you have to mix the ingredients together. After that, you have to cook the cake in a pan. After that, you have to frost it with frosting. |  Wizard: I am a wizard, I make gold and cast spells. |
| Human: Then what? | Human: Tell me how to cast a spell. |
| Wizard: You have to eat the cake. | Wizard: First you must have a wand, and then you must remember your name. |
|| Human: Then what? |
|| Wizard: Then you must say the spell. |

Both models generate similar output at the beginning, but vanilla `curie`'s wizard likes to cast spells about cake, which is not as wizardly as casting a spell about gold. More strikingly, both models are asked how to cast a spell, vanilla `curie` provides instructions for "cooking a cake in a pan" while fine-tuned `curie` tells us that we "must have a wand." Fine-tuning `curie` on the LIGHT dataset helped our wizard act more like a wizard!

| [&lt; Back to Build Your Own ChatGPT Main Page]({% post_url /projects/2023-04-18-build-your-own-chatgpt %}) | [Next to Part 2: Implementing Our Chatbot &gt;]({% post_url /subpages/2023-08-06-implementing-our-chatbot %}) |
