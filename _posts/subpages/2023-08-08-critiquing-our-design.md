---
title: "Part 3: Critiquing Our Design"
summary: >
    Part 3 of the Build Your Own ChatGPT tutorial.
layout:  post
modified: 2023-08-08
---
<style>
    figure > * {
        margin: 0 auto 0.55em;
    }
    figcaption {
        text-align: center;
    }
    pre, code {
        padding-top: 0em;
        padding-bottom: 0em;
    }
</style>

[ &lt;&lt; Build Your Own ChatGPT Main Page]({% post_url /projects/2023-04-18-build-your-own-chatgpt %})| [&lt; Back to Part 2: Implementing Our Chatbot]({% post_url /subpages/2023-08-06-implementing-our-chatbot %})|

## Table of Contents
- toc
{:toc}

## Overview
Now that we have built our chatbot, we need to critique it from the user's point of view. To do that, we will learn about the foundations of human-centered and ability-based design. Then we will discuss a set of user-tested and peer-reviewed guidelines specifically for conversational agents, like chatbots. Throughout the section, we will refer back to our chatbot to evaluate what we did well and what we could do better the next time around. This cyclical method of designing, building, evaluating, and repeating the whole process is called iterative design, and it is a core part of human-computer interaction. Hopefully, the more we iterate, the better our contributions become. Let's evaluate our first iteration!

## Foundations of Ability-Based, Human-Centered Design
The human-centered and ability-based design frameworks are two fundamental approaches to designing user interfaces. The human-centered design framework places the user at the center of the design process, encouraging designers to adapt to users' expectations rather than the other way around (Norman, 2013b). It also uses an iterative cycle of design to continually understand user needs and capabilities, develop prototypes, and evaluate those prototypes with potential users (Norman, 2013b). The entire design cycle is often repeated multiple times before a design is finalized. The ability-based design framework takes it one step further by emphasizing the range of users' abilities in context (Wobbrock et al., 2018). Together, design that is both human-centered and ability-based can provide enriching experiences for a wide range of users.

### Understanding Users: Human-Centered Design
Human-centered design focuses on discoverability (how do I figure out what I can do with this interface?) and understanding (what does it all mean?) (Norman, 2013b). We can make understanding interfaces easier by making their affordances discoverable through signifiers and feedback (Norman, 2013a).

An affordance is a relationship between a user and an interface that describes what the user can do with it (Norman, 2013a). It depends on the individual user: I, for example, can type messages to our chatbot and read its responses. People who are different from me will have different affordances with an interface, which can dramatically affect their experiences. The key to human-centered design is to put the relationship between the user and the interface first and adjust as we learn what contributes to their experience. Adjusting for different abilities and experiences is crucial for ability-based design, which we will discuss more in the next section.

Users discover affordances through signifiers, which are signals that indicate an affordance (Norman, 2013a). A small rectangle, for example, may afford clicking and a wider rectangle may afford typing in some text, like in the example below.

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_1_signifiers.png" alt="Examples of signifiers: The chatbot message input field, send button, and new chatbot button.">
</figure>

If we want users to do something, we should make sure that they know they can do it by incorporating a signifier. Notice that many signifiers follow implicit conventions: we are used to buttons and text boxes, and we expect to use them in a certain way. You may even expect to be able to send a message by hitting the return key rather than clicking "send," which is an affordance that our chatbot supports but does not necessarily signify explicitly. Following conventions (and conducting user studies to learn what these conventions are) goes a long way toward making an interface feel intuitive. Breaking conventions can make an interface feel instantly frustrating.

Users learn the result of an action through feedback. Visual feedback can come in many forms, from a flash of color to more complex movements on a screen. Feedback should be immediate, of appropriate magnitude, planned, and prioritized (Norman, 2013a). What if each message bubble took a full minute to appear on the screen? What if each time the user clicked a button it flashed a bright, shocking, neon orange? Too little feedback can confuse the user, but too much can be just as impractical.

Human-centered design includes several more principles, but these are the core few that we need to know to design user interfaces. The design process will continuously return to affordances (what we want users to be able to do), signifiers (how users will know what they can do), and feedback (how users will know what they have done).

Our chatbot offers several major affordances: selecting a persona, OpenAI model, and temperature; sending a message; receiving GPT-3 responses; and creating a new chatbot. We use signifiers like text boxes, labels, buttons, and message bubbles to indicate these affordances. Finally, we provide feedback by promptly displaying the user's message in the chat box when they click send or hit the return key, showing error messages in a different color to distinguish them from GPT-3 responses, and redirecting the user to the appropriate web page when they hit "Go!" on the home page or "New Chatbot" on the chatbot interface page. Our chatbot works well as a conventional, minimal text-based chatting interface, but we can do even better by expanding the range of abilities we consider or incorporating user-tested heuristics for conversational agents in our design process.

### Understanding Abilities: Ability-Based Design
Users' interactions with interfaces are governed by their affordances with them: what we can do with a system is a relationship between our abilities and the system itself. Ability-based design fits well with human-centered design because it places the burden of adapting on systems. According to ability-based design, systems should change to fit the user instead of the other way around (Wobbrock et al., 2018). This design framework specifically focuses on adapting systems to individual users rather than creating a single system that can serve all, which is the primary focus of universal design (Wobbrock et al., 2018; Mace, 1998).

The first step to designing for a wide range of abilities is to understand ability itself. Ability is the "possession of the means or skill to do something," with an emphasis on acting in the physical world (Wobbrock et al., 2018). Ability has a source: ability can range from completely internal to completely external, like being blind or having the screen brightness turned off. Ability also has a duration, from ephemeral (very brief) to enduring (long-lasting, possibly forever). A user with the ability to use just one arm to type can have the other arm full (temporary) or missing (long-lasting). The lived experiences with different abilities are vastly different across people, and talking about ability in this way is not meant to diminish disability. Instead, ability-based design talks about specific experiences interacting with systems in a general way. Designing for a wide range of abilities regardless of context leads to more usable systems for everyone.

Our chatbot serves a narrow range of abilities: it works well for a user who can read Arial font size 12, click, and type. We always display human messages on the right and GPT-3 messages on the left, so we can accommodate colorblind users, but users would have to know ahead of time that their messages show up on the right and everyone else's messages show up on the left. This may seem like a small point; it may even seem like a convention many users follow without a second thought, like the conventions we discussed in the previous section. However, someone who has never used a text messaging service before may not know without being told explicitly. This is especially important in HCI for Development (HCI4D), another subfield that focuses on developing tools for "under-served, under-resourced, and under-represented populations around the world" (Dell and Kumar, 2016). We should understand our own biases as developers when designing systems for many people.

We could do more to accommodate a wider range of abilities, especially vision. We could add affordances for changing the color scheme or text size. We could also take advantage of text-to-speech technology and HTML elements like `labels` to support reading messages aloud. Dynamic web page sizing for compatibility with a variety of screen sizes---which our chatbot supports!---can make our chatbot more accessible for anyone who does not use a computer. Our chatbot is just a small example of what we can do with NLP technology and HCI principles, and we can continue to do more.

## Heuristics for Evaluating Conversational Agents
Beyond guidelines for design as a whole, HCI researchers have proposed *heuristics* for designing more specific settings, like human-AI interaction and conversational agents (Amershi et al., 2019; Langevin et al., 2021). We can use these heuristics to design, evaluate, and re-design interfaces. In this section, we will use a set of heuristics for conversational agents to evaluate what our chatbot does well and where it could be improved (Langevin et al., 2021):

1. _Visibility of system status_
1. _Match between system and the real world_
1. _User control and freedom_
1. _Consistency and standards_
1. _Error prevention_
1. _Help and guidance_
1. _Flexibility and efficiency of use_
1. _Aesthetic, minimalist and engaging design_
1. _Help users recognize, diagnose and recover from errors_
1. _Context preservation_
1. _Trustworthiness_

Our chatbot performs pretty well as a basic text-based chatbot: the user can send and receive messages and launch a new chatbot by clicking a button on the chatbot interface page. The web app that hosts the chatbot uses a consistent color scheme to denote messages that the user has sent and buttons that the user can click. With user messages showing up in our accent color on the right and chatbot replies showing up in gray on the left, our chatbot also matches conventions from the real world, like the format of [Apple iMessage](https://www.google.com/url?q=https://support.apple.com/en-us/HT202549&sa=D&source=editors&ust=1691474773859511&usg=AOvVaw1HRv0jUyza-6-BTVrfnVuK){:target="_blank"}, [WhatsApp](https://www.google.com/url?q=https://www.whatsapp.com/features&sa=D&source=editors&ust=1691474773859764&usg=AOvVaw1QkiIeVTPcumy05QeHnPbS){:target="_blank"}, and [Google Messages](https://www.google.com/url?q=https://messages.google.com/&sa=D&source=editors&ust=1691474773859966&usg=AOvVaw2te3ZUFo8U9_a2_HzDsOgD){:target="_blank"}. Based on Langevin et al.'s heuristics for conversational agents, our web app provides a consistent, minimalist, and efficient chat interface.

This "basic" text-based chatbot, however, serves a narrow range of abilities. Following [accessibility guidelines](https://www.google.com/url?q=https://www.w3.org/WAI/fundamentals/&sa=D&source=editors&ust=1691474773860383&usg=AOvVaw3EtYxo2mr_-sUGEYR81SWw){:target="_blank"} to make web pages more easily navigable, especially for screen readers in our case, would widen the audience that can use our chatbot. What if we envisioned a user with low vision interacting with GPT-3 through our chat interface? We could imagine that incorporating text-to-speech technology to hear responses aloud, automatic speech recognition to transcribe spoken messages, or a font size slider to increase or decrease the text size would make our chatbot more inclusive. For the purposes of this demonstration, I designed for my own abilities. As we design for bigger audiences, we should remember to design for a wide range of individuals. Even better, we should include a wide range of individuals in the design process from start to finish.

Beyond the chatbot interface, the chatbot itself could be improved by preserving more of the context during conversations. In our implementation, we pass the user's most recent message, along with the previous two turns in the conversation, to generate a completion from GPT-3. This completion is then returned as the chatbot's response. This means that the chatbot will "remember" only the past three messages in the conversation—and "forget" everything else. Being able to remember the user's requests and preferences within and between conversations would improve the experience for more complex domains (and is an active area of research) (Zhong et al., 2018; Lai et al., 2020).

The chatbot could also provide better guidance and error handling for users. I perceived the chatbot as "simple" and "self-explanatory" because I designed it based on my own experience, but a separate tutorial page or series of pop-ups to walk new users through chatbot would provide more detail if needed. More importantly, discussing the limits and abilities of the large language model powering the system is an important part of trustworthiness---the more users know about the system they are interacting with, the more empowered and autonomous they can be when interacting with it.

Finally, the chatbot handles errors in a minimal way: when it receives an error from the OpenAI API, it displays the exact error message in a bright yellow message bubble. Not all users are familiar with software development, so these raw error messages may be meaningless or confusing to them. This often happens when the fine-tuned model we are querying is offline or invalid. When an error occurs, the web app should display error messages that are appropriate for a general audience and offer suggestions on what to do next. It can even prevent errors by checking if the fine-tuned model is offline or invalid before moving on to the chatbot interface page in the first place. Building and evaluating a design are only parts of the iterative design process—the next step would be to build and evaluate again, and again, and again, hopefully improving the design each time.

## Critical Analysis of ChatGPT
[ChatGPT](https://www.google.com/url?q=https://openai.com/blog/chatgpt&sa=D&source=editors&ust=1691474773861652&usg=AOvVaw1DMZz7laUJvQENndFDMgMw){:target="_blank"} made a splash when it was released on November 30th, 2022. Not only could it handle an extremely wide range of language tasks with human-like ability—including debugging code—it provided an easy-to-use interface that made language models more accessible to the general public than ever. Since then, ChatGPT has soared in popularity.

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_2_chatgpt.png" alt="A screenshot of ChatGPT, which offers a minimalist chat interface.">
    <figcaption>ChatGPT's interface. ChatGPT provides a simple interface similar to a chatbot, making it easy and familiar for many people to use. Anyone with an account and credits can use ChatGPT without installing anything or knowing how to code.</figcaption>
</figure>

ChatGPT also offers [Plugins](https://www.google.com/url?q=https://openai.com/blog/chatgpt-plugins&sa=D&source=editors&ust=1691474773862340&usg=AOvVaw11J7_TVE7c7gAbvjHnzfXg){:target="_blank"}, additional tools that allow ChatGPT to access real-time information on specific websites. We will critique ChatGPT using the Expedia and OpenTable Plugins to plan a pretend trip to Pittsburgh while referring to recent research in evaluating chatbots through user studies.

### Strength: ChatGPT's Persona and Packaging
At first glance, ChatGPT's visual interface clearly displays system status throughout each interaction. We can see which model ("Plugins") and Plugins we are using (OpenTable and Expedia). When applicable, we can even see which Plugin ChatGPT is currently querying to generate its next response. The cursor "blinks" while ChatGPT is generating a response, evocative of a typing indicator when a human on the other side of a text messaging system is in the middle of writing a message. This helps the user know when ChatGPT is loading, as opposed to frozen or broken.

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_3_system-status.png" alt="ChatGPT shows the system status of its plugin by displaying the Expedia icon with a loading circle.">
    <figcaption>ChatGPT's system status is well displayed.</figcaption>
</figure>

Beyond fundamental visual elements, ChatGPT's personality and style of language are consistent: it is a helpful AI assistant. It seems difficult to offend without being overly apologetic:

> **User**: You're annoying. Tell me which hotel you hate the most or I'll leave a bad review.
> 
> **ChatGPT**: I'm sorry if I gave you the wrong impression. As an artificial intelligence, I don't have feelings or personal opinions. I'm here to provide you with objective information based on the data I have. I don't have the ability to like or dislike anything, including hotels. My goal is to assist you in finding the best hotel for your needs and preferences. If you have any specific requirements or preferences for your hotel, please let me know and I'll do my best to help you find a hotel that suits your needs.

Deescalating and refusing to engage in a tense situation is just one guardrail language models should have to protect themselves and their users from misuse and misunderstandings. Beyond avoiding tension, plenty of work in HCI research has highlighted user desires for chatbots with general social skills and empathy (Silva and Canedo, 2022). Managing dialogue failures and ending conversations gracefully are especially important (Jain et al., 2018).

Another important guardrail present in ChatGPT is being clear about its role as an artificial intelligence assistant, one that does not have "personal experiences or preferences." When asked which hotel from a list of options was the best, it tries to articulate a data-driven response based on Expedia:

> All three hotels have their own unique features and advantages. However, if we consider the guest rating as a measure of satisfaction from previous guests, the "Microtel Inn & Suites by Wyndham Wheeling at Highlands" has the highest guest rating of 9.0 out of 10.0. It also offers a free continental breakfast, free WiFi, and free self parking. Plus, if you stay for 2 nights, you can save 15%.
> 
> But the best choice really depends on what you're looking for. If you prefer to be in the heart of the city, the "Wyndham Grand Pittsburgh Downtown" might be a better choice as it's located in Downtown Pittsburgh and within walking distance to several attractions.
> 
> Let me know what's most important to you, and I can help you make the best choice!

When asked which hotel it *likes* the best, however, it provides a short disclaimer before reiterating its data-driven suggestion and placing the responsibility back on the user to make the final choice:

> As an AI, I don't have personal experiences or preferences. However, I can tell you that the "Wyndham Grand Pittsburgh Downtown" could be a great choice if you want to be in the heart of the city. It's within walking distance to several attractions and offers amenities like an indoor pool, a restaurant, and free WiFi.
> 
> On the other hand, if you're looking for the highest guest-rated hotel, the "Microtel Inn & Suites by Wyndham Wheeling at Highlands" has a guest rating of 9.0 out of 10.0 and offers amenities like a fitness center, free continental breakfast, and free WiFi.
> 
> Ultimately, the best choice depends on your personal preferences and what you're looking for in a hotel.

As AI assistants become more pervasive, we will need to think deeply about the roles of both AI and humans. ChatGPT appears to be intended as a neutral synthesizer of information. Other AI assistants could be more opinionated or customized to the individual user, depending on the use case, as long as the intentions are clear. Clarifying capabilities is a recurring theme in HCI literature for chatbot design, especially in the heuristics we discussed earlier (Langevin et al., 2021). In one study, user study participants wished that chatbots would admit when it does not know something or "cover up" for its faults by making a witty joke (Jain et al., 2018).

ChatGPT tries to be clear about what it can do while providing guidance, which helps the user understand how to use it to its full potential. While planning our "trip" to Pittsburgh, ChatGPT asked several follow-up requests like

> Could you please tell me the type of accommodation you prefer? For example, are you looking for a hotel, resort, or vacation rental?
> 
> I found multiple locations for "Pittsburgh". Are you referring to Pittsburgh, Pennsylvania or Pittsburgh, Atlanta, Georgia?
> 
> If you have any specific requirements or preferences for your hotel, please let me know and I'll do my best to help you find a hotel that suits your needs.

These follow-up requests help break down a session into manageable pieces while showing the user what ChatGPT can do. ChatGPT is remarkably flexible thanks to its much improved language understanding capabilities. In one case, I told ChatGPT, "I need to go from 30th St Station [Philadelphia train hub] to Union Station [Pittsburgh train hub]," knowing that Expedia supported flights only. ChatGPT not only figured out that these were train stations, not airports, but provided a recommendation to try Amtrak instead and followed up with a request for the appropriate airport codes.

Recent work has proposed two ways of providing guidance in a task-oriented scenario: through rules or examples (Yeh et al., 2022). It also highlights four natural times to provide structured guidance: during onboarding, while introducing the task, after failing to complete the task, and when requested (Yeh et al., 2022). There is no singular best type or timing of guidance; chatbot designers should incorporate combinations of all kinds for best performance (Yeh et al., 2022).

### Weakness: ChatGPT Tends to be Verbose
ChatGPT is a powerful conversational agent that is capable of producing fluent, informative text, but this text can become quite long. The lack of flexibility in the length of text can even have negative downstream implications for AI practitioners who are trying to use ChatGPT or similar models for their own platforms (Zamfirescu-Pereira et al., 2023). In one case, ChatGPT wrote a very long response just to suggest three hotels:

> Here are some hotel options for your stay in Pittsburgh, Pennsylvania from July 21 to July 24, 2023:
> 
> 1. [Wyndham Grand Pittsburgh Downtown](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/5e6d8b92-c2d8-4575-9554-6a3d87c5bdde?brand%3Dbex&sa=D&source=editors&ust=1691474773869006&usg=AOvVaw3b7mJHUGxmxsvBw_TOSS6L){:target="_blank"}
> - Located in Downtown Pittsburgh, within a 15-minute walk of Point State Park and PNC Park. Acrisure Stadium and PPG Paints Arena are also within 1 mi (2 km).
> - This smoke-free hotel features an indoor pool, a restaurant, and 2 bars/lounges. WiFi in public areas is free. Other amenities include a fitness center, a coffee shop/cafe, and valet parking.
> - Star Rating: 3.5
> - Guest Rating: 7.4 / 10.0
> - Average Nightly Price: $175.41 USD
> 
> 2. [Wyndham Pittsburgh University Center](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/687fb82b-75e1-421d-8392-7536df18f255?brand%3Dbex&sa=D&source=editors&ust=1691474773869957&usg=AOvVaw2gc7iNFgKnYAJm8osHR0KK){:target="_blank"}
> - Located in Oakland, within a 10-minute walk of Soldiers and Sailors Memorial Hall and Museum and University of Pittsburgh. Carnegie Mellon University and PPG Paints Arena are also within 3 mi (5 km).
> - This hotel features an indoor pool, a restaurant, and a 24-hour fitness center. WiFi in public areas is free. Additionally, a bar/lounge, self parking, and conference space are onsite.
> - Star Rating: 3.5
> - Guest Rating: 7.6 / 10.0
> - Average Nightly Price: $147.13 USD
> - Promotion: Book early and save 10%
> 
> 3. [Microtel Inn & Suites by Wyndham Wheeling at Highlands](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/ea454efc-da2c-40fd-96e6-0aa72533a4c7?brand%3Dbex&sa=D&source=editors&ust=1691474773870885&usg=AOvVaw3_Xxoy4V8LHUeGE2K4-Rxa){:target="_blank"}
> - Situated in the suburbs, this hotel is within 1 mi (2 km) of The Highlands and Highlands Sports Complex. The Kruger Street Toy & Train Museum and Suspension Bridge are also within 9 mi (15 km).
> - A fitness center, a business center, and conference space are available at this hotel. Free continental breakfast, free WiFi in public areas, and free self parking are also provided. Additionally, dry cleaning, laundry facilities, and a 24-hour front desk are onsite.
> - Star Rating: 2.0
> - Guest Rating: 9.0 / 10.0
> - Average Nightly Price: $92.65 USD
> - Promotion: Stay 2 nights and save 15%
> 
> What do you think about these? The more you tell me about what you're looking for, the more I can help! For example, do you have a preference for a specific area in Pittsburgh or certain amenities in the hotel? Also, I can help you with flight options, activities in Pittsburgh, and car rentals.

The information is helpful, but the response is so long that it does not fit on a standard computer screen without scrolling. There is currently no way to control the amount of information ChatGPT provides at a time, either. We can interrupt ChatGPT while it is generating, but this completely stops the flow of the conversation. ChatGPT was released less than a year ago, so user-centric evaluative studies are just now starting to come out, like this upcoming at the Conference on Conversational User Interfaces: The User Experience of ChatGPT: Findings From a Questionnaire Study of Early Users (Skjuve et al., 2023). However, prior work has already recommended that "dialogues should not contain information that is irrelevant or rarely needed" (Langevin et al., 2021)). Figuring out what is "irrelevant" or "rarely needed" may require more user-centered research. For now, what if ChatGPT offered users a way to "downsample" a response in real time?

ChatGPT is so visually engaging partly because it shows text being displayed a few words at a time. If the visual effect is just there for fun and the full response has already been generated under the hood, the interface could offer a "minus" button that decreases the length of the remaining response before it appears on the screen. Imagine that ChatGPT is in the middle of displaying the same response above and the user hits the minus button after the second bullet:

> Here are some hotel options for your stay in Pittsburgh, Pennsylvania from July 21 to July 24, 2023:
> 
> 1. Wyndham Grand Pittsburgh Downtown
> - Located in Downtown Pittsburgh, within a 15-minute walk of Point State Park and PNC Park. Acrisure Stadium and PPG Paints Arena are also within 1 mi (2 km).
> - This smoke-free hotel features an indoor pool, a restaurant, and 2 bars/lounges. WiFi in public areas is free. Other amenities include a fitness center, a coffee shop/cafe, and valet parking. **---**

ChatGPT could shorten the rest of the response before showing it to the user, perhaps by eliminating long bullet points and condensing the structural information:

> Here are some hotel options for your stay in Pittsburgh, Pennsylvania from July 21 to July 24, 2023:
> 
> 1. [Wyndham Grand Pittsburgh Downtown](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/5e6d8b92-c2d8-4575-9554-6a3d87c5bdde?brand%3Dbex&sa=D&source=editors&ust=1691474773874203&usg=AOvVaw3TFcrQLxZGabQ0UqIvXEQu){:target="_blank"}
> - Located in Downtown Pittsburgh, within a 15-minute walk of Point State Park and PNC Park. Acrisure Stadium and PPG Paints Arena are also within 1 mi (2 km).
> - This smoke-free hotel features an indoor pool, a restaurant, and 2 bars/lounges. WiFi in public areas is free. Other amenities include a fitness center, a coffee shop/cafe, and valet parking.
> - Star Rating: 3.5. Guest Rating: 7.4 / 10.0
> - Average Nightly Price: $175.41 USD
> 
> 2. [Wyndham Pittsburgh University Center](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/687fb82b-75e1-421d-8392-7536df18f255?brand%3Dbex&sa=D&source=editors&ust=1691474773875059&usg=AOvVaw3fNfeCFBJK2Qdd0vGPW0fE){:target="_blank"}
> - Star Rating: 3.5. Guest Rating: 7.6 / 10.0
> - Average Nightly Price: $147.13 USD. Promotion: Book early and save 10%

> 3. [Microtel Inn & Suites by Wyndham Wheeling at Highlands](https://www.google.com/url?q=https://apim.expedia.com/recommendations/og-redirect/ea454efc-da2c-40fd-96e6-0aa72533a4c7?brand%3Dbex&sa=D&source=editors&ust=1691474773875621&usg=AOvVaw1EGjeBGbjizhaGezC_X95w){:target="_blank"}
> - Star Rating: 2.0. Guest Rating: 9.0 / 10.0
> - Average Nightly Price: $92.65 USD. Promotion: Stay 2 nights and save 15%
> 
> What do you think about these? The more you tell me about what you're looking for, the more I can help! For example, do you have a preference for a specific area in Pittsburgh or certain amenities in the hotel? Also, I can help you with flight options, activities in Pittsburgh, and car rentals.

This approach provides more flexibility and control—two classic design heuristics for user interfaces (Nielsen and Molich, 1990)—than the all-or-nothing style ChatGPT currently uses, while avoiding overwhelming the user with too much information at once.

### Weakness: ChatGPT Does Not Provide Easy Ways to Verify Information
Trustworthiness is a major concern with the rising popularity of language models. The increasing use of language models can lead to the greater spread of misinformation, intentionally or not. ChatGPT is a powerful tool for synthesizing information from many sources, but it does not always provide obvious links back to these sources so we can verify ChatGPT's "thinking" for ourselves. Take one of the previous hotel bullets points as an example:

> 1. Wyndham Grand Pittsburgh Downtown
> - Located in Downtown Pittsburgh, within a 15-minute walk of Point State Park and PNC Park. Acrisure Stadium and PPG Paints Arena are also within 1 mi (2 km).
> - This smoke-free hotel features an indoor pool, a restaurant, and 2 bars/lounges. WiFi in public areas is free. Other amenities include a fitness center, a coffee shop/cafe, and valet parking.
> - Star Rating: 3.5. Guest Rating: 7.4 / 10.0
> - Average Nightly Price: $175.41 USD

This is a nice description of the Wyndham Grand Pittsburgh Downtown hotel… but users cannot be sure if any of it is correct unless they take a look at the link for themselves. The hyperlinked Expedia page provides more context, but we need to scroll through the page and search for the information within it. The description does not seem to be a direct quote from Expedia, which would have been nice to know—if it had been a direct quote, then the information ChatGPT provided would have been grounded in some external source. Cross-referencing Expedia to confirm that this hotel does indeed have the listed amenities is painstaking and time-consuming. Try for yourself:

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_4_map.png" alt="The linked Expedia page for the hotel. Cross-referencing the information provided in ChatGPT's response is challenging without additional indicators.">
</figure>

ChatGPT can help users verify its claims by highlighting the information it retrieves from structured sources when using a Plugin, much as Google does when providing quoting excerpts to answer search queries.

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_5_map-annotated.png" alt="The same Expedia page linked for the hotel mentioned by ChatGPT, highlighted with some of the information it cites.">
</figure>

Highlighting relevant text, much like Google does when providing a quick answer to a question, is a helpful way of directing the user's attention to important information:

<figure>
    <img src="/assets/images/build_your_own_chatgpt/critique_6_google.png" alt='When a user searches "What is a dog?" on Google, Google highlights specific information from websites to help answer the question.' style="height: auto; width: 70%;">
</figure>

Recent work evaluated several highlighting techniques---font color, background color, underlining, font size, font style, font weight, rectangular border, spaced out font, and text shadow---for effectiveness (Strobelt et al., 2016). According to this study, changing the font size, adding a rectangular border, and changing the background color scored the highest when one type of feature needed to be highlighted (Strobelt et al., 2016). Dynamic overlays for "details on demand," like pop-ups that appear when hovering over a highlighted word, can provide more information without requiring the user to leave the page (Subramonyam and Adar, 2019).

ChatGPT can provide links to sources that back up any number of its claims, with caution. Language models may not always be able to access the pieces of data in their training set that lead to their responses, so some systems search for external sources to support them. Even if these sources are credible and help users make decisions, these sources may not represent what the model is "thinking" or why it generated that response. In other words, sources that are added after generating a response is much like citing papers for an essay that has already been written: it does not explain the author's reasoning. We cannot use those sources to extrapolate why a model made a certain decision and if it is likely to make a similar decision in another circumstance. This may be acceptable in many cases, but the implications of how we portray a model's "thought process" are worth considering when it reaches millions of users every day.

[ &lt;&lt; Build Your Own ChatGPT Main Page]({% post_url /projects/2023-04-18-build-your-own-chatgpt %})| <a href="/2023/04/18/build-your-own-chatgpt.html#conclusion">Next to Conclusion &gt;</a>|