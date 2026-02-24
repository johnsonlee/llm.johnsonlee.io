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

## Why Data Cleaning Is So Hard

Imagine cleaning a swimming pool that's the size of an ocean:

- **Duplicates**: The same Wikipedia article copied on 10,000 websites. If you don't remove copies, the model memorizes instead of learning.
- **Quality**: A well-written blog post vs a spam page full of ads. How do you teach a computer to tell the difference?
- **Toxicity**: Hate speech, misinformation, personal data. Must be removed, but careful not to remove too much or the model becomes too narrow.

FineWeb processes **15 trillion words** through this pipeline — and makes the result free for everyone!

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

## What MMLU Questions Look Like

Here are real examples from different subjects:

**Astronomy**: "What causes the seasons on Earth?" (A) Distance from the Sun (B) Tilt of Earth's axis ✓ (C) Speed of rotation (D) Size of the Moon

**Law**: "Under the Fourth Amendment, which of the following is NOT considered a 'search'?" ...

**Medicine**: "A 45-year-old patient presents with..." ...

57 subjects, from elementary school to graduate school. A model that scores well on MMLU is a true generalist!

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

## Why ARC-AGI Is So Hard for LLMs

ARC puzzles look simple to humans:

- Input: 3 colored grids showing a pattern → Output: What should the 4th grid look like?
- Humans solve most puzzles in seconds — we see the rule intuitively
- LLMs struggle because each puzzle has a **new rule** they've never seen before

This is the difference between **memorizing patterns** (what LLMs are great at) and **understanding abstract rules** (what humans do naturally). ARC-AGI tests whether AI can truly reason, not just recall.

----

## Chapter 16 Summary

| Paper | Key Idea |
|-------|----------|
| [FineWeb](https://arxiv.org/abs/2406.17557) (2024) | 15T tokens of clean, open training data |
| [MMLU](https://arxiv.org/abs/2009.03300) (2020) | 57-subject knowledge exam |
| [GPQA](https://arxiv.org/abs/2311.12022) (2023) | Expert-level, Google-proof questions |
| [IFEval](https://arxiv.org/abs/2311.07911) (2023) | Can it follow instructions precisely? |
| [ARC-AGI](https://arxiv.org/abs/1911.01547) (2019) | Abstract reasoning — still unsolved |

----

## Want to Learn More?

- [FineWeb Dataset (Hugging Face)](https://huggingface.co/datasets/HuggingFaceFW/fineweb) — Explore the 15T-token dataset yourself
- [MMLU Leaderboard (Papers With Code)](https://paperswithcode.com/sota/multi-task-language-understanding-on-mmlu) — See which models score highest on the knowledge exam
- [ARC-AGI Prize](https://arcprize.org/) — Try solving ARC puzzles yourself and compete for a $1M prize
- [Chatbot Arena (LMSYS)](https://chat.lmsys.org/) — Vote on which LLM gives better answers in blind comparisons

----

## Think About It

- FineWeb removed duplicates from the internet. But some text is repeated because it's important (like famous quotes). How do you decide what's a "bad" duplicate vs a "useful" repetition?
- MMLU tests 57 subjects with multiple-choice questions. Is multiple choice a good way to test intelligence? What important skills does it miss?
- ARC-AGI puzzles are easy for humans but hard for AI. Can you think of the reverse — tasks that are easy for AI but hard for humans?
- If you were designing a new benchmark to test AI, what would you test that current benchmarks don't?
