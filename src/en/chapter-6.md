<!-- .slide: class="center" -->

## 6. Alignment & Safety

*How do we teach AI to be helpful and not harmful?*

----

## The problem: AI is like a parrot repeating words it doesn't understand

A model trained to predict the next word will say **whatever is most likely** — including:

- Harmful, biased, or offensive content
- Confident lies (hallucinations)
- Ignoring what you actually asked for

> How do we make AI **helpful** without being **harmful**?

----

## RLHF: Let humans be the teacher

Idea: train the model like you'd raise a child — with **human feedback**!

1. The model generates several answers
2. Humans **rank** the answers from best to worst
3. A "reward model" learns what humans prefer
4. The model is trained to maximize this reward

> [Training a Helpful and Harmless Assistant](https://arxiv.org/abs/2204.05862) (2022) — Anthropic's RLHF methodology

----

## Constitutional AI: Can AI teach itself?

Getting human feedback is **expensive and slow**. What if AI could grade itself?

- Give the AI a set of **principles** (a "constitution")
- "Be helpful, be honest, don't cause harm"
- The AI critiques and revises its own answers based on these rules

> [Constitutional AI](https://arxiv.org/abs/2212.08073) (2022) — AI alignment with principles, not just examples

----

## DPO: A simpler path

RLHF has many complicated steps — training a scoring system, adjusting the model, lots of careful tuning...

DPO found a shortcut:

- Skip the reward model entirely
- Directly optimize the model to prefer good answers over bad ones
- Same result, much simpler to implement!

> [DPO](https://arxiv.org/abs/2305.18290) (2023) — one equation replaces the entire RLHF pipeline

----

## GRPO & DAPO: Scaling up RL training

As models got bigger, teaching them with rewards got harder:

- **GRPO**: Compare answers in **groups** to find the best one — no separate scoring system needed. This is the key method behind DeepSeek-R1
- **DAPO**: Four tricks that keep training stable even with giant models — used to build reasoning as good as R1

> [GRPO](https://arxiv.org/abs/2402.03300) (2024) | [DAPO](https://arxiv.org/abs/2503.14476) (2025)

----

## Self-Play: Practice makes perfect

Can a model improve by **playing against itself**?

- The current model generates answers
- A copy of the model tries to distinguish real vs generated answers
- The model improves its answers until the copy can't tell them apart from real ones → quality goes up!

Like a chess player who gets better by playing against themselves.

> [SPIN](https://arxiv.org/abs/2401.01335) (2024) — self-play turns weak models into strong ones

----

## Checking the work, not just the answer

Imagine grading a math test. Which is more useful?

- **"The answer is wrong"** (outcome supervision)
- **"Step 3 has an error"** (process supervision)

Process supervision gives the model much better feedback!

> [Let's Verify Step by Step](https://arxiv.org/abs/2305.20050) (2023) — process rewards beat outcome rewards

----

## Chapter 6 Summary

| Paper | Key Idea |
|-------|----------|
| [RLHF (Anthropic)](https://arxiv.org/abs/2204.05862) (2022) | Humans rank answers → model learns preferences |
| [Constitutional AI](https://arxiv.org/abs/2212.08073) (2022) | AI grades itself using principles |
| [DPO](https://arxiv.org/abs/2305.18290) (2023) | Skip the reward model — optimize directly |
| [GRPO](https://arxiv.org/abs/2402.03300) / [DAPO](https://arxiv.org/abs/2503.14476) | RL training at scale |
| [SPIN](https://arxiv.org/abs/2401.01335) (2024) | Self-play → self-improvement |
| [Step by Step](https://arxiv.org/abs/2305.20050) (2023) | Grade the process, not just the answer |
