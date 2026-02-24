<!-- .slide: class="center" -->

## 5. Efficient Attention & Architecture

*Looking at every word is great, but it gets really slow with long texts!*

----

## The problem with Attention

Remember how Attention lets every word look at every other word?

- For 10 words: 10 × 10 = **100** comparisons
- For 1,000 words: 1,000 × 1,000 = **1,000,000** comparisons
- For 100,000 words: 100,000 × 100,000 = **10 billion** comparisons!

As text gets longer, Attention gets **way** slower — twice as long means four times as much work! Can we fix this?

----

## FlashAttention: Same math, smarter memory

The trick: don't change the math — change **how the GPU accesses memory**.

- GPUs have fast memory (small) and slow memory (big)
- Standard Attention constantly shuffles data between them
- FlashAttention reorganizes the work to **minimize data movement**

Same exact result, but **2-4x faster** and uses much less memory!

> [FlashAttention](https://arxiv.org/abs/2205.14135) (2022) | [FlashAttention-2](https://arxiv.org/abs/2307.08691) (2023)

----

## Why Memory Speed Matters So Much

Think of your GPU like a kitchen:

- **Fast memory (SRAM)** = the countertop — small, but everything is within arm's reach
- **Slow memory (HBM)** = the fridge — lots of space, but you have to walk to it every time

Standard Attention keeps running to the fridge for every ingredient. FlashAttention reorganizes the recipe so you grab everything you need from the fridge once, do all the work on the countertop, then put results back. Same dish, way less walking!

----

## GQA: Sharing is caring

In standard Attention, each "attention head" keeps its own notebook of what it has seen.

With 32 heads, that's 32 copies of memory — very wasteful!

- **Grouped-Query Attention**: groups of heads **share** the same memory
- 32 heads but only 8 notebooks → 4x less memory
- Almost no loss in quality!

> [GQA](https://arxiv.org/abs/2305.13245) (2023) — used in Llama 2, Mistral, and almost every modern LLM

----

## GQA: Before and After

| | Multi-Head | Grouped-Query (GQA) |
|---|---|---|
| Heads | 32 | 32 |
| Key-Value copies | 32 | 8 |
| Memory per token | 100% | ~25% |
| Quality | Baseline | Almost identical |

By sharing Key-Value caches across groups of heads, GQA cuts memory by 4x with almost no quality loss. That's why nearly every modern LLM — Llama 2, Mistral, Gemma — uses it.

----

## RoPE: Encoding position with rotation

Remember Positional Encoding — giving each word a "seat number"?

The original version was fixed — trained on 512 words, so it only had 512 seat numbers. A short email (about 200 words) was fine, but a Harry Potter chapter (about 5,000 words) had thousands of words with no seat — the model simply couldn't handle it.

- RoPE encodes position by **rotating** the word vectors
- Nearby words have similar rotations, distant words have different ones
- Can be extended to **longer texts** after training!

> [RoPE](https://arxiv.org/abs/2104.09864) (2021) — the position encoding standard for modern LLMs

----

## Mamba: Do we even need Attention?

What if there's a completely different approach?

- **State Space Models (SSMs)** process text one step at a time — much simpler and faster!
- 100,000 words need only 100,000 steps instead of 10 billion!
- Mamba adds **selectivity** — it can choose what to remember and what to forget

> [Mamba](https://arxiv.org/abs/2312.00752) (2023) — challenging the Transformer's dominance

----

## Transformers vs Mamba: A Trade-off

| | Transformer | Mamba (SSM) |
|---|---|---|
| Speed on long text | Slow (quadratic) | Fast (linear) |
| Quality on short text | Excellent | Good |
| Memory use | High | Low |
| Maturity | Battle-tested | Still proving itself |

The latest research combines both: use Transformer layers for complex reasoning and Mamba layers for fast processing. Some hybrid models get the best of both worlds!

----

## Ring Attention: Team up multiple GPUs

What if one GPU doesn't have enough memory for a really long text?

- Split the text across **multiple GPUs** in a ring
- Each GPU processes its chunk, then passes key-value data to the neighbor
- Like a relay race — each runner handles their part

> [Ring Attention](https://arxiv.org/abs/2310.01889) (2023) — unlimited context length through teamwork

----

## ModernBERT: Updating a classic

BERT changed the world in 2018, but the world moved on. Could we rebuild it with modern tricks?

- Use RoPE instead of old position encoding
- Use FlashAttention for speed
- Can read much longer text: 8,192 words instead of just 512
- Result: faster and smarter than the original

> [ModernBERT](https://arxiv.org/abs/2412.13663) (2024) — old idea + new tricks = better results

----

## Chapter 5 Summary

| Paper | Key Idea |
|-------|----------|
| [FlashAttention](https://arxiv.org/abs/2205.14135) (2022) | Smarter memory access → 2-4x faster |
| [GQA](https://arxiv.org/abs/2305.13245) (2023) | Share memory between attention heads |
| [RoPE](https://arxiv.org/abs/2104.09864) (2021) | Rotary position encoding — extendable |
| [Mamba](https://arxiv.org/abs/2312.00752) (2023) | Linear-time alternative to Attention |
| [Ring Attention](https://arxiv.org/abs/2310.01889) (2023) | Split long text across multiple GPUs |
| [ModernBERT](https://arxiv.org/abs/2412.13663) (2024) | Classic BERT rebuilt with modern tricks |

----

## Want to Learn More?

- [ELI5: FlashAttention (Aleksa Gordić)](https://gordicaleksa.medium.com/eli5-flash-attention-5c44017022ad) — FlashAttention explained simply with diagrams
- [The Annotated Mamba (srush)](https://srush.github.io/annotated-mamba/hard.html) — Walk through Mamba's code step by step
- [Rotary Position Embedding (blog)](https://blog.eleuther.ai/rotary-embeddings/) — Deep dive into how RoPE works
- [Visual Guide to Attention (Lilian Weng)](https://lilianweng.github.io/posts/2023-01-27-the-transformer-family-v2/) — Comprehensive overview of all attention variants

----

## Think About It

- FlashAttention doesn't change the math — just how data moves in memory. Can you think of other situations where *how* you organize work matters more than *what* work you do?
- Attention grows quadratically: 2x longer text = 4x more work. If a model handles 10,000 words in 1 second, how long would 100,000 words take?
- Mamba processes text in one direction, while Attention looks everywhere. What kinds of tasks might Mamba struggle with compared to Attention?
- ModernBERT rebuilt a 2018 model with 2024 tricks. What if you rebuilt something old with today's technology — what would you modernize?
