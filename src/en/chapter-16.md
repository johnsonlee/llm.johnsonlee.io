<!-- .slide: class="center" -->

## 16. Data Engineering & Evaluation

*How do we know if AI is actually smart?*

----

## Garbage in, garbage out

A model is only as good as its training data. But the internet is full of:

- Duplicate content (the same text copied thousands of times)
- Low-quality text (spam, ads, gibberish)
- Harmful content (hate speech, misinformation)

> How do we find the **best** text on the internet for training?

----

## FineWeb: Cleaning 15 trillion words

HuggingFace built a massive pipeline to filter the web:

1. Download the entire internet (Common Crawl)
2. Remove duplicates — the same text shouldn't appear twice
3. Filter quality — keep well-written, informative text
4. Remove harmful content
5. Result: **15 trillion words** of clean training data — free for anyone to use!

> [FineWeb](https://arxiv.org/abs/2406.17557) (2024) — the gold standard open training dataset

----

## Now, how do we test the model?

Training is done. But is the model actually smart? We need **benchmarks** — standardized tests for AI.

- Like how schools use exams to measure student knowledge
- Each benchmark tests a different ability
- The key: tests the model has **never seen** during training

----

## MMLU: The ultimate knowledge exam

57 school subjects — from history to science to law:

- Elementary math, world history, computer science, medicine...
- Multiple choice questions, like a massive school exam
- Tests **breadth** of knowledge — can the model be a generalist?

> [MMLU](https://arxiv.org/abs/2009.03300) (2020) — 57 subjects, thousands of questions

----

## GPQA: Can it fool a PhD?

MMLU tests broad knowledge. GPQA tests **deep, expert-level** knowledge:

- Graduate-level questions in physics, chemistry, biology
- So hard that regular people can't answer them even with Google!
- Even domain experts only get ~65% right!

> [GPQA](https://arxiv.org/abs/2311.12022) (2023) — "Google-Proof" expert Q&A

----

## IFEval: Does it follow instructions?

Being smart isn't enough — can the model **do what you ask**?

- "Write a poem with exactly 4 stanzas" — does it use exactly 4?
- "Reply in JSON format" — is it valid JSON?
- "Don't use the letter 'e'" — does it slip up?

Tests whether the model **follows instructions precisely**, not just approximately.

> [IFEval](https://arxiv.org/abs/2311.07911) (2023) — instruction-following evaluation

----

## ARC-AGI: The IQ test for AI

The ultimate question: can AI **reason about things it's never seen**?

- Abstract visual puzzles — like an IQ test
- Each puzzle requires figuring out a **new rule** from just a few examples
- Humans solve most of them easily; AI struggles badly
- Still largely unsolved — a benchmark for future AI!

> [ARC-AGI](https://arxiv.org/abs/1911.01547) (2019) — abstract reasoning, still AI's biggest challenge

----

## Chapter 16 Summary

| Paper | Key Idea |
|-------|----------|
| [FineWeb](https://arxiv.org/abs/2406.17557) (2024) | 15T tokens of clean, open training data |
| [MMLU](https://arxiv.org/abs/2009.03300) (2020) | 57-subject knowledge exam |
| [GPQA](https://arxiv.org/abs/2311.12022) (2023) | Expert-level, Google-proof questions |
| [IFEval](https://arxiv.org/abs/2311.07911) (2023) | Can it follow instructions precisely? |
| [ARC-AGI](https://arxiv.org/abs/1911.01547) (2019) | Abstract reasoning — still unsolved |
