<!-- .slide: class="center" -->

## 15. Quantization & Inference

*These models are HUGE — can they run on my computer?*

----

## The problem: models are too big

GPT-3 has 175 billion tiny settings (parameters). Each one is stored as a number using 16 bits of space.

- That's **350 GB** just to load the model — like 350 movies worth of space!
- Most GPUs have only 24 GB of memory
- Running it requires a cluster of expensive servers

> Can we make the model **smaller** without making it dumber?

----

## Quantization: Rounding numbers

Imagine you have the number **3.14159265...**

- Full precision (16 bits): 3.14159265
- 8 bits: 3.14
- 4 bits: 3.1
- Less precise, but **much smaller**!

GPTQ rounds all 175 billion numbers — making the whole model 4 times smaller!

> [GPTQ](https://arxiv.org/abs/2210.17323) (2022) — 3-4 bit quantization with minimal quality loss

----

## AWQ: Not all weights are equal

GPTQ treats every parameter the same. But some parameters are **more important**!

- A few super-important settings carry most of the model's knowledge
- Protect these important weights, compress the rest aggressively
- Same compression ratio, but **better quality**

> [AWQ](https://arxiv.org/abs/2306.00978) (2023) — protect the weights that matter most

----

## vLLM: Serving many users at once

Making the model smaller helps, but when **thousands of users** ask questions at once:

- Each conversation needs its own key-value cache (memory)
- Memory gets wasted on half-empty slots
- Idea: organize memory in neat **pages**, just like a computer does — no wasted space!

> [vLLM](https://arxiv.org/abs/2309.06180) (2023) — PagedAttention, the serving standard

----

## Speculative Decoding: A clever shortcut

Generating text is slow because each word depends on the previous one.

What if we used a **small, fast model** to guess several words ahead?

1. Small model quickly guesses 5 words
2. Big model checks all 5 at once (this is fast!)
3. If the guesses are right → accept them all → 5x speedup!
4. If a guess is wrong → fix it and continue

> [Speculative Decoding](https://arxiv.org/abs/2211.17192) (2022) — draft fast, verify in bulk

----

## Medusa: Multiple heads are better

What if the model itself could predict **several words at once**?

- Add multiple "prediction heads" to the model
- Each head predicts a different future word simultaneously
- Verify and accept correct predictions in parallel

Like a chess player thinking several moves ahead!

> [Medusa](https://arxiv.org/abs/2401.10774) (2024) — parallel prediction for faster output

----

## Chapter 15 Summary

| Paper | Key Idea |
|-------|----------|
| [GPTQ](https://arxiv.org/abs/2210.17323) (2022) | Compress to 3-4 bits — 4x smaller |
| [AWQ](https://arxiv.org/abs/2306.00978) (2023) | Protect important weights during compression |
| [vLLM](https://arxiv.org/abs/2309.06180) (2023) | Paged memory for serving thousands of users |
| [Speculative Decoding](https://arxiv.org/abs/2211.17192) (2022) | Small model drafts, big model verifies |
| [Medusa](https://arxiv.org/abs/2401.10774) (2024) | Predict multiple words at once |
