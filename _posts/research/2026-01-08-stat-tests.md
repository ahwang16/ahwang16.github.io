---
title: Statistical Tests Cheatsheet
summary: A decision-tree-ish thing for choosing a statistical significance test.
layout:  post
modified: 2026-01-08
category: research-tips
---

I am always forgetting when to use which statistical test, so I wrote them down here in case it helps anyone else. I am certainly not an expert so be sure to double check for your own purposes!

<style>
    details {
        background-color: hsla(216, 100%, 90%, 0.25);
        border-radius: 0.1em;
        padding-left: 0.2em;
    }
    details details {
        border-left: 3px solid gray;
        margin-left: 1em;
        margin-top: 1em;
    }
    details.next {
        margin-top: 1em;
    }
    span.answer {
        background-color: hsla(216, 100%, 80%, 1.00); 
        border-radius: 0.5em;
        font-weight: bold;
        padding: 0.3em;
    }
</style>

<details><summary>Start here if your outcomes are categorical...</summary>
This means that your data is not continuous and have no inherent order. For example: red, green, blue. If your data looks more like "scale of 1 to 10" or "rarely vs. sometimes vs. often," it is probably continuous or ordinal (see next section).
<details><summary>If your observations are independent...</summary>
For example, in a between-subjects study.

<details><summary>and your sample size is small...</summary>
<span class="answer">Fisher's exact test.</span>
</details>

<details><summary>and your sample size is moderate or large...</summary>
<span class="answer">chi-squared test.</span>
</details>

</details>
<details>
<summary>or the groups are paired (within-subjects)...</summary>
<details>
<summary>and the categories are binary...</summary>
<span class="answer">McNemar's test.</span>
</details>

<details>
<summary>or there are more than 3 categories...</summary>
<span class="answer">Stuart-Maxwell test</span> or <span class="answer">Bowker's test of symmetry.</span>
</details>
</details>
</details>

<details class="next">
<summary>or here if your outcomes are continuous or ordinal.</summary>

Continuous = full numerical range, like time or percentile. Ordinal = ordered but discrete, like 5-point Likert scales or poor/fair/excellent ratings. Some ordinal data may be numerical, like the number of stars for a product review. This does not mean that ordinal data can be averaged because the distance between two points may not be consistent.

<details>
<summary>If you are comparing 2 groups...</summary>

<details>
<summary>and the groups are independent (between-subjects)...</summary>

<details>
<summary>and you can assume the distributions are normal (parametric)...</summary>
<span class="answer">t-test.</span>
</details>

<details>
<summary>and the distributions are unknown or skewed (nonparametric)...</summary>
<span class="answer">Mann-Whitney U test.</span>
</details>

</details>

<details>
<summary>or the groups are paired (within-subjects)...</summary>
<details>
<summary>and you can assume the distributions are normal (parametric)...</summary>
<span class="answer">paired t-test.</span>
</details>

<details>
<summary>and the distributions are unknown or skewed (nonparametric)...</summary>
<span class="answer">Wilcoxon signed-rank test.</span>
</details>
</details>
</details>
<details>
<summary>or you are comparing more than 2 groups...</summary>


<details>
<summary>and you can assume the distributions are normal (parametric)...</summary>
<span class="answer">ANOVA.</span>
</details>

<details>
<summary>and the distributions are unknown or skewed (nonparametric)...</summary>
<span class="answer">Kruskal-Wallis test.</span>
</details>


</details>


If you have many more groups or categories, you should probably look into regressions. Please email me if you see any errors or have any suggestions.