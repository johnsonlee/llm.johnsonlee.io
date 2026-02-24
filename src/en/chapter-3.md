<!-- .slide: class="center" -->

## 3. Scaling Laws & Training Theory

*Is a bigger brain always a smarter brain?*

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

## But wait — the recipe was wrong!

The original recipe said: **spend most of your budget on a bigger model**.

A team at DeepMind found the opposite:

- Most people were using **too few data** for their model size
- A 70B model trained on 4x more data beat a 280B model trained on less data
- Data and parameters should grow **together**

> [Chinchilla](https://arxiv.org/abs/2203.15556) (2022) — "you're underfeeding your models!"

----

## Emergent Abilities: Unexpected Skills

Something weird happens when models get really big:

- Small model: can't do arithmetic → bigger model: still can't → even bigger: **suddenly can!**
- It's like a light switch — abilities appear out of nowhere
- These are called **emergent abilities** — they weren't explicitly taught

> [Emergent Abilities](https://arxiv.org/abs/2206.07682) (2022) — new abilities that appear at scale

----

## Or is it just a measurement trick?

Other researchers pushed back:

- Maybe these abilities aren't really "sudden"
- If you change **how you measure** the task, the improvement looks **gradual**, not sudden
- The "magic" might be in how we measure, not in the model

> [Are Emergent Abilities a Mirage?](https://arxiv.org/abs/2304.15004) (2023) — a healthy dose of skepticism

----

## What if we run out of data?

The internet is big, but it's not infinite. What happens when models need **more data than exists**?

- You can **repeat** data — but performance drops after ~4 repetitions
- You can **mix in code and math** — different data types help
- You can **generate synthetic data** — have AI write training data for AI!

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
