---
title: Build Your Own ChatGPT
summary: >
    Tutorial on implementing and critiquing a chatbot powered by large language models, written for my PhD candidacy exam.
layout:  post
modified: 2023-08-08
thumbnail: /assets/images/project_thumbnails/chatbot_icon.jpg
---
<style>
.responsive-wrap iframe {
    max-width: 100%; aspect-ratio: 16 / 9;
}
h3 {
    display: inline;
}
figure > * {
    margin: 0 auto 0.55em;
}
figcaption {
    text-align: center;
}
ol {
    list-style: none;
    counter-reset: ref-counter;
}
ol li:nth-of-type(1) {
    font-weight: normal;
}
ol li{
    position: relative;
    list-style: none;
    margin-left: 1em; 
    padding-left: 0px;
    counter-increment: ref-counter;
    padding-bottom: 5px;
}
ol li:before {
    position: absolute;
    left: -2em;
    content: "[" counter(ref-counter) "] ";
}
</style>
 <script>
    window.addEventListener("load", (event) => {
        if (window.location.href.includes("#conclusion")) {
            var b = document.querySelectorAll("details#conclusion");
            console.log(b);
            b[0].open = true;
        }
    })
    
</script>

# Resources
- [GitHub repo](https://github.com/ahwang16/gpt3-chatbot){:target="_blank"}
- [Fine-tuning notebook](https://github.com/ahwang16/gpt3-chatbot/blob/master/Finetune_GPT_3_for_Persona_Chatbot.ipynb){:target="_blank"}
- [Talk recording](https://www.youtube.com/watch?v=RrGXDKZcCN4){:target="_blank"}
- Slides
    - [Presentation Keynote](/assets/files/project_resources/Build%20Your%20Own%20ChatGPT%20Presentation.key)
    - [Presentation PDF](/assets/files/project_resources/Build%20Your%20Own%20ChatGPT%20Presentation.pdf)
    - [Printer-Friendly Keynote](/assets/files/project_resources/Build%20Your%20Own%20ChatGPT%20Printer-Friendly.key)
    - [Printer-Friendly PDF](/assets/files/project_resources/Build%20Your%20Own%20ChatGPT%20Printer-Friendly.pdf)

<div class="responsive-wrap">
    <iframe width="100%" height="auto" src="https://www.youtube.com/embed/RrGXDKZcCN4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" style="display: block; margin: 0 auto;" allowfullscreen></iframe>
</div>

<details open>
    <summary><h3>Abstract</h3></summary>
    <br>
    <p>
        Language models developed in the past several years are very powerful, and they started to dominate public discussion with the release of ChatGPT. In this tutorial, we will learn how to use the OpenAI API to build our own chatbot powered by GPT-3, the only OpenAI model that can be fine-tuned. We will start with an overview of GPT-3 and what we can do with it: prompt engineering, few-shot learning, and fine-tuning. We will also fine-tune GPT-3 to have a persona: a personality like "wizard" or "dog" powered by GPT-3. Then we will review the key components of implementing the chatbot, including an introduction to web development, backend infrastructure (Python Flask), and frontend engineering (HTML, CSS, JavaScript). Finally, we will critique our own chatbot based on the principles of ability-based, human-centered design and user-tested heuristics for conversational agents. ChatGPT helped bring advanced AI research to the public eye by providing an interface that made interacting with language models easier. Chatbots are just the beginning of this new age of human-AI interaction.
    </p>
</details>

<details>
    <summary><h3>Target Audience</h3></summary>
    <br>
    <p>
        This tutorial is intended for early-career computer science PhD students with an introductory background in Natural Language Processing. It will be particularly interesting for NLP researchers who are interested in learning more about Human-Computer Interaction. Audience members should be comfortable with Python and ready to pick up key concepts of JavaScript, HTML, and CSS as they are presented.
    </p>
</details>

<details style="margin-bottom: 0.5em;">
    <summary><h3>Introduction</h3></summary>
    <br>
    <figure>
        <img src="/assets/images/build_your_own_chatgpt/wizard.gif" alt="Demonstration of the chatbot we will build. It contains a home screen that allows the user to choose the persona, model, and temperature. It then leads to a simple text-based interface.">
        <figcaption>An overview of the chatbot.</figcaption>
    </figure>
    <p>
        Recent work in natural language processing (NLP), programming tools, and design have made state-of-the-art research more accessible than ever. In this tutorial, we will be building and critiquing a chatbot powered by GPT-3 as a novice-friendly introduction to human-AI interaction. GPT-3 was launched by OpenAI, the same company that recently released ChatGPT. A recent predecessor of ChatGPT, GPT-3 is one of the most powerful language models on a variety of natural-language tasks. It is also the only OpenAI model that is available for fine-tuning. In this tutorial, we'll learn how to use the OpenAI API to build a chatbot powered by GPT-3. The true magic of this tutorial is its flexibility: by swapping out the prompting method or language model on the backend, anyone can make a chatbot powered by anything for any use case.
    </p>
    <p>
        Our chatbot is a web app containing two pages. The first is the home page, which welcomes the user and allows them to choose a persona, OpenAI model, and temperature parameter for the model. The persona is a personality like "wizard" or "dog" that the model will emulate. The temperature is one control for the variability of the text the model outputs. The second page is the chatbot interface page, where the user chats with the GPT-3 persona. We will walk through the key parts of the Python backend and JavaScript/HTML/CSS frontend together, and the full codebase is provided in a <a href="https://github.com/ahwang16/gpt3-chatbot">public GitHub repository</a>. This tutorial is designed for researchers without much web development experience who want to spin up a prototype to evaluate a variety of interaction methods as quickly as possible. This is one way, not necessarily the best way, to build a visual interface from scratch.
    </p>
    <p>
        After we build our chatbot, we will critique its design. Thoughtfully evaluating our prototypes is an important part of the design process. Designing, prototyping, evaluating, and repeating the whole process in small, iterative steps is a core part of human-computer interaction (HCI) research as a whole. In HCI, we focus on understanding how people want to use the technology we create. In this tutorial, we will start the design critique by learning about the fundamental principles of human-centered and ability-based design. Then we will dive into specific guidelines for conversational agents that have been thoughtfully evaluated through user-centered research. Whether it is with a chatbot, voice assistant, or even voice-enabled navigation system, we have been talking with language models for quite some time. This tutorial aims to explain important concepts from human-computer interaction and natural language processing to help all of us understand, build, and critique AI systems easier.
    </p>
</details>

# [Part 1: Understanding GPT-3]({% post_url /subpages/2023-08-06-understanding-gpt %})

# [Part 2: Implementing Our Chatbot]({% post_url /subpages/2023-08-06-implementing-our-chatbot %})

# [Part 3: Critiquing Our Design]({% post_url /subpages/2023-08-08-critiquing-our-design %})

<details id="conclusion">
    <summary><a name="conclusion" style="color: black; text-decoration: none;"><h3>Conclusion</h3></a></summary>
    <br>
    <p>
        We covered a lot of ground in this tutorial: we reviewed the basics of GPT-3, walked through the codebase for the chatbot, and critiqued the design of our final product. In the iterative design process, however, a product is never truly finished. We can keep building and critiquing forever. We can swap out the language model, try different prompting techniques, fine-tune on different datasets, focus on specific user needs, and so on. This process gives us many opportunities to consider both machine-centered and human-centered components of NLP and HCI. <em>How can we incorporate NLP technology into thoughtfully designed interfaces? How can we incorporate HCI methods to develop language models worth using?</em>
    </p>
    <p>
        These two questions are more important now than ever, as language models become capable of generating increasingly complex output. Some output is so good that humans have trouble identifying if it was written by a human or a machine (Dugan et al., 2023). Evaluating if a piece of text is "good"—subjectively valid, useful, helpful—is an inherently human-centered issue that is central to evaluating current models that can answer complex questions, write essays, debug code, and more (OpenAI, 2022). Today, NLP and HCI can produce incredible technology that we barely imagined possible even a year ago. I invite you to keep building and evaluating, over and over again. Iteratively. Together.
    </p>
</details>

<details>
    <summary><h3>References</h3></summary>
    <br>
    <ol>
        <li>Saleema Amershi, Dan Weld, Mihaela Vorvoreanu, Adam Fourney, Besmira Nushi, Penny Collisson, Jina Suh, Shamsi Iqbal, Paul N. Bennett, Kori Inkpen, Jaime Teevan, Ruth Kikin-Gil, and Eric Horvitz. 2019. Guidelines for Human-AI Interaction. In <i>Proceedings of the 2019 CHI Conference on Human Factors in Computing Systems</i>, pages 1–13, Glasgow, Scotland, UK. ACM.</li>
        <li>Tom B. Brown, Benjamin Mann, Nick Ryder, Melanie Subbiah, Jared Kaplan, Prafulla Dhariwal, Arvind Neelakantan, Pranav Shyam, Girish Sastry, Amanda Askell, Sandhini Agarwal, Ariel Herbert-Voss, Gretchen Krueger, Tom Henighan, Rewon Child, Aditya Ramesh, Daniel M. Ziegler, Jeffrey Wu, Clemens Winter, et al. 2020. Language Models are Few-Shot Learners. <i>arXiv:2005.14165 [cs]</i>. arXiv: 2005.14165.</li>
        <li>Nicola Dell and Neha Kumar. 2016. The Ins and Outs of HCI for Development. In <i>Proceedings of the 2016 CHI Conference on Human Factors in Computing Systems</i>, pages 2220–2232, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Liam Dugan, Daphne Ippolito, Arun Kirubarajan, Sherry Shi, and Chris Callison-Burch. 2023. Real or Fake Text?: Investigating Human Ability to Detect Boundaries Between Human-Written and Machine-Generated Text. In <i>Proceedings of the 2023 AAAI Conference on Artificial Intelligence</i>.</li>
        <li>Mohit Jain, Pratyush Kumar, Ramachandra Kota, and Shwetak N. Patel. 2018. Evaluating and Informing the Design of Chatbots. In <i>Proceedings of the 2018 Designing Interactive Systems Conference</i>, pages 895–906, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Tuan Manh Lai, Quan Hung Tran, Trung Bui, and Daisuke Kihara. 2020. A Simple But Effective Bert Model for Dialog State Tracking on Resource-Limited Systems. In <i>ICASSP 2020--2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)</i>, pages 8034--8038.</li>
        <li>Raina Langevin, Ross J Lordon, Thi Avrahami, Benjamin R. Cowan, Tad Hirsch, and Gary Hsieh. 2021. Heuristic Evaluation of Conversational Agents. In <i>Proceedings of the 2021 CHI Conference on Human Factors in Computing Systems</i>, pages 1–-15. Association for Computing Machinery, New York, NY, USA.</li>
        <li>Vivian Liu and Lydia B Chilton. 2022. Design Guidelines for Prompt Engineering Text-to-Image Generative Models. In <i>Proceedings of the 2022 CHI Conference on Human Factors in Computing Systems</i>, pages 1–-23, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Xiao Liu, Yanan Zheng, Zhengxiao Du, Ming Ding, Yujie Qian, Zhilin Yang, and Jie Tang. 2021. GPT Understands, Too. number: arXiv:2103.10385arXiv:2103.10385 [cs].</li>
        <li>Ronald L. Mace. 1998. Universal Design in Housing. <i>Assistive Technology</i>, 10(1):21–28.</li>
        <li>Jakob Nielsen and Rolf Molich. 1990. Heuristic evaluation of user interfaces. In <i>Proceedings of the SIGCHI Conference on Human Factors in Computing Systems</i>, pages 249--256, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Don Norman. 2013a. The Psychopathology of Everyday Things. In <i>The Design of Everyday Things</i>. Basic Books.</li>
        <li>Donald A. Norman. 2013b. <i>The Design of Everyday Things</i>. Basic Books, New York, New York, Revised and expanded edition.</li>
        <li>OpenAI. 2022. ChatGPT: Optimizing Language Models for Dialogue.</li>
        <li>Long Ouyang, Jeff Wu, Xu Jiang, Diogo Almeida, Carroll L Wainwright, Pamela Mishkin, Chong Zhang, Sandhini Agarwal, Katarina Slama, Alex Ray, and others. 2022. Training language models to follow instructions with human feedback. <i>arXiv preprint arXiv:2203.02155</i>.</li>
        <li>Laria Reynolds and Kyle McDonell. 2021. Prompt Programming for Large Language Models: Beyond the Few-Shot Paradigm. In <i>Extended Abstracts of the 2021 CHI Conference on Human Factors in Computing Systems</i>, pages 1–-7, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Geovana Ramos Sousa Silva and Edna Dias Canedo. 2022. Towards User-Centric Guidelines for Chatbot Conversational Design. <i>International Journal of Human–Computer Interaction</i>, 0(0):1–23.</li>
        <li>Marita Skjuve, Asbjørn Følstad, and Petter Bae Brandtzæg. 2023. The User Experience of ChatGPT: Findings From a Questionnaire Study of Early Users. In <i>Proceedings of the 5th Conference on Conversational User Interfaces (CUI ’23)</i>, Eindhoven, Netherlands. Association for Computing Machinery.</li>
        <li>Hendrik Strobelt, Daniela Oelke, Bum Chul Kwon, Tobias Schreck, and Hanspeter Pfister. 2016. Guidelines for Effective Usage of Text Highlighting Techniques. <i>IEEE Transactions on Visualization and Computer Graphics</i>, 22(1):489–498.</li>
        <li>Hariharan Subramonyam and Eytan Adar. 2019. SmartCues: A Multitouch Query Approach for Details-on-Demand through Dynamically Computed Overlays. <i>IEEE Transactions on Visualization and Computer Graphics</i>, 25(1):597–607.</li>
        <li>Jack Urbanek, Angela Fan, Siddharth Karamcheti, Saachi Jain, Samuel Humeau, Emily Dinan, Tim Rocktäschel, Douwe Kiela, Arthur Szlam, and Jason Weston. 2019. Learning to Speak and Act in a Fantasy Text Adventure Game. number: arXiv:1903.03094arXiv:1903.03094 [cs].</li>
        <li>Jacob O. Wobbrock, Krzysztof Z. Gajos, Shaun K. Kane, and Gregg C. Vanderheiden. 2018. Ability-Based Design. <i>Communications of the ACM</i>, 61(6):62–71.</li>
        <li>Xiaohan Yang, Eduardo Peynetti, Vasco Meerman, and Chris Tanner. 2022. What GPT Knows About Who is Who. number: arXiv:2205.07407arXiv:2205.07407 [cs].</li>
        <li>Su-Fang Yeh, Meng-Hsin Wu, Tze-Yu Chen, Yen-Chun Lin, XiJing Chang, You-Hsuan Chiang, and Yung-Ju Chang. 2022. How to Guide Task-oriented Chatbot Users, and When: A Mixed-methods Study of Combinations of Chatbot Guidance Types and Timings. In <i>Proceedings of the 2022 CHI Conference on Human Factors in Computing Systems</i>, pages 1–16, New York, NY, USA. Association for Computing Machinery.</li>
        <li>J.D. Zamfirescu-Pereira, Heather Wei, Amy Xiao, Kitty Gu, Grace Jung, Matthew G Lee, Bjoern Hartmann, and Qian Yang. 2023. Herding AI Cats: Lessons from Designing a Chatbot by Prompting GPT-3. In <i>Proceedings of the 2023 ACM Designing Interactive Systems Conference</i>, pages 2206–2220, New York, NY, USA. Association for Computing Machinery.</li>
        <li>Victor Zhong, Caiming Xiong, and Richard Socher. 2018. Global-Locally Self-Attentive Dialogue State Tracker. arXiv:1805.09655 [cs].</li>
    </ol>
</details>


# Suggested Citation
{% raw %}
```
@article{Hwang_Build_Your_Own_2023,
    author = {Hwang, Alyssa},
    journal = {Alyssa Hwang},
    month = apr,
    title = {{Build Your Own ChatGPT}},
    url = {https://alyssahwang.com/2023/04/18/build-your-own-chatgpt.html},
    year = {2023}
}
```
{% endraw %}
