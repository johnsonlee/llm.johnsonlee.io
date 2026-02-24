<!-- .slide: class="center" -->

## 13. Long Context

*What if the text is really, really long?*

----

## The problem: a short attention span

Most models can only handle a few thousand words at a time.

- A short email? No problem.
- A 300-page book? Doesn't fit!
- A full codebase? Way too big!

> How do we help AI read **really long** texts?

----

## ALiBi: Forget old stuff, focus on recent stuff

One idea: make the model **naturally prefer** nearby words over distant ones.

- Don't use complex positional encoding
- Instead, subtract a small penalty based on **distance**
- Nearby words get full attention; faraway words get less
- Bonus: can handle **longer texts than it was trained on**!

> [ALiBi](https://arxiv.org/abs/2108.12409) (2021) — a simple trick to handle longer texts

----

## YaRN: Stretch the rope

Remember RoPE — the rotary position encoding? It has a fixed length.

YaRN found a clever way to **stretch** it:

- Adjust the rotation frequencies to support longer contexts
- A model trained on 4,000 words can be stretched to handle **128,000 words**
- No need to retrain from scratch!

> [YaRN](https://arxiv.org/abs/2309.00071) (2023) — stretching RoPE to longer contexts

----

## RAG vs Long Context

Wait — if we can make context really long, do we still need RAG?

Researchers compared both approaches:

- **Long context**: Put everything into the input — simple but uses a lot of computer power
- **RAG**: Search for only the important parts — cheaper but might miss something
- **Result**: It depends! For some tasks RAG wins, for others long context wins

> [RAG vs Long Context](https://arxiv.org/abs/2407.16833) (2024) — the empirical comparison

----

## How do we test long context?

Models claim to handle 100K+ tokens, but do they **actually understand** all of it?

- **LongBench v2**: Tests understanding across different positions in long texts
- **MRCR**: Can the AI find a fact that was mentioned many messages ago in a long chat?

Many models fail when the answer is in the **middle** of a long text!

> [LongBench v2](https://arxiv.org/abs/2412.15204) (2024) | [MRCR](https://arxiv.org/abs/2409.12640) (2024)

----

## Chapter 13 Summary

| Paper | Key Idea |
|-------|----------|
| [ALiBi](https://arxiv.org/abs/2108.12409) (2021) | Distance penalty for length extrapolation |
| [YaRN](https://arxiv.org/abs/2309.00071) (2023) | Stretch RoPE to longer contexts |
| [RAG vs Long Context](https://arxiv.org/abs/2407.16833) (2024) | Each approach has its strengths |
| [LongBench v2](https://arxiv.org/abs/2412.15204) (2024) | Testing true long-context understanding |
| [MRCR](https://arxiv.org/abs/2409.12640) (2024) | Multi-round retrieval in long conversations |
