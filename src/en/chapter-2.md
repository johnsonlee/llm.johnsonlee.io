<!-- .slide: class="center" -->

## 2. The GPT Lineage

*What happens if we feed the model more data and give it more "brain cells"?*

----

## A model that can predict the next word...

We learned that GPT-1 predicts the next word to learn language.

But GPT-1 was small — it still needed to be **taught** each specific task.

> What if we made it **much bigger**? Would it learn tasks on its own?

----

## GPT-2: No examples needed!

Researchers scaled up to **1.5 billion** parameters and something surprising happened:

- Without any task-specific training, GPT-2 could translate, summarize, and answer questions
- It just needed a good **prompt** — no examples at all!

This is called **zero-shot** learning — doing a task you were never taught.

> [GPT-2](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf) (2019) — "Language Models are Unsupervised Multitask Learners"

----

## GPT-3: Show me a few examples

What if we scale up even more — to **175 billion** parameters?

- Now the model could learn new tasks from just **a few examples** in the prompt
- "Translate English to French: sea otter → loutre de mer, cheese →" → "fromage"
- No retraining needed — just show it the pattern!

This is called **few-shot learning** or **In-Context Learning (ICL)**.

> [GPT-3](https://arxiv.org/abs/2005.14165) (2020) — the model that proved scale unlocks new abilities

----

## Can it write code too?

If GPT-3 learned language from text, what if we trained it on **code**?

- Codex was trained on millions of GitHub repositories
- It could turn English descriptions into working programs
- "Write a Python function that sorts a list" → actual code!

This became the engine behind GitHub Copilot.

> [Codex](https://arxiv.org/abs/2107.03374) (2021) — from words to working programs

----

## Houston, we have a problem

GPT-3 was powerful, but it had issues:

- Sometimes it stated things that weren't true, but sounded completely sure
- It could be rude or harmful
- It didn't do what you **actually wanted** — it just predicted the next word

> How do we teach it to **follow instructions** and be **helpful**?

----

## InstructGPT: Learning from humans

The solution: let **humans grade** the model's answers!

1. Humans write examples of good responses
2. The model learns from these examples
3. Humans **rank** multiple outputs from best to worst
4. The model learns to prefer what humans prefer

This is called **RLHF** — Reinforcement Learning from Human Feedback.

> [InstructGPT](https://arxiv.org/abs/2203.02155) (2022) — the foundation of ChatGPT

----

## GPT-4: Not just words anymore

What if the model could also understand **pictures**?

- GPT-4 can read images, charts, and diagrams
- Much better at reasoning and complex tasks
- Significantly safer — less likely to produce harmful content

> [GPT-4](https://arxiv.org/abs/2303.08774) (2023) — text + vision, the multimodal leap

----

## o1: Think before you answer

You know how hard math problems require you to **think step by step** before answering?

- Previous models answered right away without thinking first, and often got it wrong
- o1 uses extra **thinking time** at inference to reason through problems
- Like a student who shows their work instead of guessing

> [o1/o3: Deliberative Alignment](https://openai.com/index/deliberative-alignment/) (2024) — reasoning models that think before they speak

----

## Chapter 2 Summary

| Paper | Key Idea |
|-------|----------|
| [GPT-2](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf) (2019) | Bigger model → zero-shot abilities |
| [GPT-3](https://arxiv.org/abs/2005.14165) (2020) | 175B params → few-shot In-Context Learning |
| [Codex](https://arxiv.org/abs/2107.03374) (2021) | Train on code → write programs |
| [InstructGPT](https://arxiv.org/abs/2203.02155) (2022) | Human feedback → follow instructions (RLHF) |
| [GPT-4](https://arxiv.org/abs/2303.08774) (2023) | Multimodal — text + images |
| [o1/o3](https://openai.com/index/deliberative-alignment/) (2024) | Think before answering |
