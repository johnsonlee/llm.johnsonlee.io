<!-- .slide: class="center" -->

## 3. Scaling Laws & Training Theory

*Bigger is better — but how far can it go?*

----

## We saw that bigger models are smarter...

GPT-2 (1.5B) → GPT-3 (175B) → each jump brought new abilities.

But training bigger models costs **millions of dollars**. So we need to ask:

> If I have a fixed budget, should I build a **bigger model** or use **more data**?

----

## Scaling Laws: A recipe for spending wisely

Researchers discovered a surprisingly simple rule:

- Model performance follows a simple math pattern — predictable curves!
- More parameters → better (but each extra bit helps a little less)
- More data → better (but each extra bit helps a little less)
- More compute → better (but each extra bit helps a little less)

You can actually **predict** how good a model will be before training it!

> [Scaling Laws (Kaplan)](https://arxiv.org/abs/2001.08361) (2020) — the formula for AI performance

----

## Scaling Laws in Everyday Life

Scaling laws work like learning a musical instrument:

- **First week**: Huge improvement — you go from noise to simple tunes
- **First month**: Good progress — you can play real songs
- **First year**: Slower improvement — you're getting better, but each hour of practice adds less

LLMs follow the same pattern. Doubling the size doesn't double the performance — but the improvement is **predictable**, and that's the breakthrough.

----

## Bigger Model = Better Performance?

![Scaling law curve](src/en/images/scaling-curve.svg)

----

## But wait — the recipe was wrong!

The original recipe said: **spend most of your budget on a bigger model**.

A team at DeepMind found the opposite:

- Most people were using **too few data** for their model size
- A 70B model trained on 4x more data beat a 280B model trained on less data
- Data and parameters should grow **together**

> [Chinchilla](https://arxiv.org/abs/2203.15556) (2022) — "you're underfeeding your models!"

----

## The Chinchilla Recipe

Think of training an LLM like baking a cake:

- **Old recipe (Kaplan)**: Use a HUGE oven (big model) with a small amount of batter (less data)
- **Chinchilla recipe**: Use a medium oven with the RIGHT amount of batter

The key insight: for every dollar you spend, split it roughly **equally** between making the model bigger and feeding it more data. Most labs were spending too much on model size and not enough on data.

----

## Emergent Abilities: Unexpected Skills

With the right recipe, models kept growing. But along the way, something unexpected started happening:

- Small model: can't do arithmetic → bigger model: still can't → even bigger: **suddenly can!**
- It's like a light switch — abilities appear out of nowhere
- These are called **emergent abilities** — they weren't explicitly taught

> [Emergent Abilities](https://arxiv.org/abs/2206.07682) (2022) — new abilities that appear at scale

----

## Why Emergence Is Surprising

Imagine teaching a child to add numbers. They practice 1+1, 2+3, 5+7...

Then one day you ask: "What's 1,247 + 3,856?" and they get it right — even though you never taught them numbers that big!

That's emergence: the LLM learns basic patterns, and at some point, those patterns combine into entirely new abilities that nobody explicitly programmed.

----

## Or is it just a measurement trick?

Other researchers pushed back:

- The original evaluation used "all-or-nothing" scoring — one wrong step = 0 points
- Small model: 0%. Bigger: still 0%. Even bigger: suddenly 80%! — **looks like emergence**
- Switch to "partial credit" scoring (how many steps were right?), and improvement looks **gradual**
- The "magic" might be in how we measure, not in the model

> [Are Emergent Abilities a Mirage?](https://arxiv.org/abs/2304.15004) (2023) — a healthy dose of skepticism

----

## What if we run out of data?

Whether emergence is real or a mirage, one practical problem remains: the internet is big, but not infinite. What happens when models need **more data than exists**?

![Three strategies for the data bottleneck](src/en/images/data-wall-solutions.svg)

> [Scaling Data-Constrained Language Models](https://arxiv.org/abs/2305.16264) (2023) — when data is the bottleneck

----

## Chapter 3 Summary

| Paper | Key Idea |
|-------|----------|
| [Scaling Laws](https://arxiv.org/abs/2001.08361) (2020) | Performance follows predictable power laws |
| [Chinchilla](https://arxiv.org/abs/2203.15556) (2022) | Use more data — models were underfed |
| [Emergent Abilities](https://arxiv.org/abs/2206.07682) (2022) | New abilities appear suddenly at scale |
| [Mirage?](https://arxiv.org/abs/2304.15004) (2023) | Maybe it's the metric, not the model |
| [Data-Constrained](https://arxiv.org/abs/2305.16264) (2023) | Strategies for when data runs out |

----

## Want to Learn More?

- [Chinchilla's Wild Implications (nostalgebraist)](https://www.lesswrong.com/posts/6Fpvch8RR29qLEWNH/chinchilla-s-wild-implications) — What Chinchilla means for the future of AI scaling
- [Emergent Abilities Explained (AI Explained)](https://www.youtube.com/watch?v=dDUC-LqVrPU) — Video walkthrough of emergent abilities with examples
- [The Scaling Hypothesis (Gwern)](https://gwern.net/scaling-hypothesis) — Deep dive into why bigger might be better
- [Are Emergent Abilities a Mirage? (Yannic Kilcher)](https://www.youtube.com/watch?v=hQQUkbJHJg4) — Video explaining the debate

----

## Think About It

- If you had $10 million to train an LLM, would you build a bigger model or get more data? Why?
- Emergent abilities appear "suddenly." Can you think of something in your own learning that felt like a sudden breakthrough after lots of practice?
- The internet has a limited amount of text. What would you do if you needed more training data than exists?
- If the "mirage" paper is right and emergence is just a measurement trick, does that make LLMs less impressive? Why or why not?
