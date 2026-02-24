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

## Why Length Extrapolation Matters

Imagine training an LLM on essays (500 words), then asking it to read a novel (100,000 words):

- **Old approach**: The model has position encoding for words 1-500. Word 501? No seat number — the model is confused!
- **ALiBi approach**: No fixed seat numbers. Instead, nearby words naturally get more attention. Word 100,000 works just as well as word 500.

This is like learning to count to 100, then being able to count to 1,000,000 — the principle is the same, you just keep going.

----

## YaRN: Stretch the rope

Remember RoPE — the rotary position encoding? It has a fixed length.

YaRN found a clever way to **stretch** it:

- Adjust the rotation frequencies to support longer contexts
- A model trained on 4,000 words can be stretched to handle **128,000 words**
- No need to retrain from scratch!

> [YaRN](https://arxiv.org/abs/2309.00071) (2023) — stretching RoPE to longer contexts

----

## RoPE Stretching: An Analogy

Think of RoPE as a rubber ruler:

- **Original**: Your ruler is 4,000 units long — perfect for short texts
- **YaRN stretching**: Pull the ruler to 128,000 units — the markings spread out but still work
- **How**: Adjust the rotation frequencies — low frequencies (big patterns) stretch easily, high frequencies (fine details) need careful adjustment

The result: a model trained on 4K context can handle 128K context with just a few hours of additional training!

----

## RAG vs Long Context

Wait — if we can make context really long, do we still need RAG?

Researchers compared both approaches:

- **Long context**: Put everything into the input — simple but uses a lot of computer power
- **RAG**: Search for only the important parts — cheaper but might miss something
- **Result**: It depends! For some tasks RAG wins, for others long context wins

> [RAG vs Long Context](https://arxiv.org/abs/2407.16833) (2024) — the empirical comparison

----

## When to Use RAG vs Long Context

| Scenario | Best approach |
|----------|--------------|
| Searching millions of documents | RAG — can't fit them all in context |
| Analyzing one long report | Long context — put the whole thing in |
| Answering from a FAQ database | RAG — quick retrieval is enough |
| Summarizing a meeting transcript | Long context — needs the full conversation |
| Chatbot with user history | Both — RAG for old chats, long context for recent ones |

In practice, the best systems **combine both**: use RAG to find relevant documents, then put them into a long context window for analysis.

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

----

## Want to Learn More?

- [Extending Context Length (Hugging Face)](https://huggingface.co/blog/long-context) — How models handle longer and longer texts
- [The Practical Guides to Long Context (blog)](https://kipp.ly/transformer-taxonomy/) — Taxonomy of all long-context techniques
- [Needle in a Haystack Test](https://github.com/gkamradt/LLMTest_NeedleInAHaystack) — Try testing if your LLM really reads the whole context
- [Extrinsic Hallucinations in LLMs (Lilian Weng)](https://lilianweng.github.io/posts/2024-07-07-hallucination/) — Comprehensive overview of LLM hallucination problems

----

## Think About It

- If an LLM can handle 1 million words of context, would we still need RAG at all? What are the trade-offs?
- Many models fail when the answer is hidden in the middle of a long text. Why do you think the beginning and end are easier to remember than the middle?
- YaRN stretches a model from 4K to 128K context. Do you think there's an upper limit to how far you can stretch, or could we go to infinity?
- Imagine you could feed an entire textbook into an LLM's context. How would that change the way you study for exams?
