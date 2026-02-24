<!-- .slide: class="center" -->

## 9. Retrieval-Augmented Generation

*What if AI could look things up?*

----

## The problem: AI's memory is frozen

A model trained in 2023 doesn't know what happened in 2024.

- "Who won the 2024 Olympics?" → "I don't know" or makes something up
- The model's knowledge is **frozen** at training time
- Retraining with new data is too expensive

> What if the model could **look up** information when it needs it?

----

## RAG: Give AI a library card

Retrieval-Augmented Generation works like a student with a textbook:

1. **Question comes in**: "What is the capital of France?"
2. **Search** a knowledge base for relevant passages
3. **Read** the retrieved passages
4. **Generate** an answer based on what was found

The model doesn't need to memorize everything — it just needs to know how to look it up!

> [RAG](https://arxiv.org/abs/2005.11401) (2020) — retrieval + generation, the best of both worlds

----

## RAG vs Memorization: Why It Matters

| | Without RAG | With RAG |
|---|---|---|
| Knowledge | Only what it memorized during training | Can access any document you provide |
| Freshness | Frozen at training date | Always up to date |
| Sources | "Trust me" | "Here's where I found it" |
| Hallucination | Common | Much less likely |

RAG turns an LLM from a student taking a closed-book exam into one taking an open-book exam — it can look things up instead of guessing from memory.

----

## How do you search? Embeddings!

But how does the LLM know which passages are relevant?

- Turn words into **lists of numbers** (called vectors) that capture their meaning
- Similar meanings → similar numbers → close together in space
- "dog" and "puppy" are close; "dog" and "algebra" are far

We need good benchmarks to test if embeddings are accurate.

> [MTEB](https://arxiv.org/abs/2210.07316) (2022) — the standard benchmark for text embeddings

----

## Embeddings: Turning Words into Coordinates

Imagine each word or sentence is a **point on a map**:

- "I love dogs" → point at (2.1, 3.5, 0.8, ...)
- "I adore puppies" → point at (2.0, 3.6, 0.9, ...) — very close!
- "The stock market crashed" → point at (8.7, 1.2, 5.3, ...) — far away

When a question comes in, the LLM converts it to a point, then finds the **nearest** document points. Close points = relevant content!

----

## ColBERT: A smarter search

Standard search: compress a whole passage into one vector. But this loses detail!

ColBERT's approach:

- Keep a vector for **each word** in the passage
- Compare each query word against each passage word
- More precise matching, but still fast enough for real use

> [ColBERT](https://arxiv.org/abs/2004.12832) (2020) — word-level matching for better retrieval

----

## GraphRAG: Connect the dots

What if the answer requires combining facts from **multiple documents**?

- "How are Company A and Company B related?"
- Standard RAG retrieves individual passages — might miss the connection
- GraphRAG builds a **knowledge graph** — entities and their relationships
- Now it can follow the chain: A → partnered with → C → acquired by → B

> [GraphRAG](https://arxiv.org/abs/2404.16130) (2024) — knowledge graphs + RAG for complex questions

----

## When Simple RAG Isn't Enough

Imagine asking: "How did the merger between Company A and Company B affect their stock prices?"

- **Simple RAG**: Finds a paragraph about Company A and another about Company B — but can't connect the dots
- **GraphRAG**: Builds a web of connections: Company A → merged with → Company B → stock price → went up 20%

GraphRAG shines when the answer requires **connecting facts across multiple documents** — something simple search can't do.

----

## How do we know if RAG works?

RAG systems can still fail — bad retrieval, wrong answers, hallucinations.

- **RAGAS**: An automatic grading system — checks if the search found the right stuff, if the answer matches what was found, and if it's actually correct
- **Self-RAG**: The AI decides on its own **when** to search — not every question needs looking up!

> [RAGAS](https://arxiv.org/abs/2309.15217) (2023) | [Self-RAG](https://arxiv.org/abs/2310.11511) (2023)

----

## The big problem everyone worries about: Hallucination

Even with RAG, models sometimes make things up:

- Citing sources that don't exist
- Saying things that contradict the retrieved text
- Blending real facts with fiction

Understanding **why** models hallucinate is crucial to fixing the problem.

> [Hallucination Survey (Lilian Weng)](https://lilianweng.github.io/posts/2024-07-07-hallucination/) (2024) — causes and evaluation

----

## Chapter 9 Summary

| Paper | Key Idea |
|-------|----------|
| [RAG](https://arxiv.org/abs/2005.11401) (2020) | Look up info, then generate an answer |
| [MTEB](https://arxiv.org/abs/2210.07316) (2022) | Benchmark for text embeddings |
| [ColBERT](https://arxiv.org/abs/2004.12832) (2020) | Word-level matching for better search |
| [GraphRAG](https://arxiv.org/abs/2404.16130) (2024) | Knowledge graphs for complex questions |
| [Self-RAG](https://arxiv.org/abs/2310.11511) (2023) | Decide when to search |
| [Hallucination](https://lilianweng.github.io/posts/2024-07-07-hallucination/) (2024) | Why AI makes things up |

----

## Want to Learn More?

- [What is RAG? (IBM)](https://research.ibm.com/blog/retrieval-augmented-generation-RAG) — Clear introduction to RAG with diagrams
- [Embeddings Explained (Vicki Boykis)](https://vickiboykis.com/what_are_embeddings/) — Deep dive into how text becomes numbers
- [GraphRAG Explained (Microsoft)](https://microsoft.github.io/graphrag/) — Microsoft's guide to graph-based retrieval
- [RAG From Scratch (LangChain)](https://www.youtube.com/watch?v=sVcwVQRHIc8) — Build a RAG system step by step (video)

----

## Think About It

- RAG lets an LLM "look things up." But how do you know the documents it's looking at are trustworthy? What if someone puts wrong information in the knowledge base?
- Embeddings put "dog" and "puppy" close together. Can you think of words that *look* similar but mean very different things? How might this confuse a search?
- GraphRAG connects facts from different documents. Can you think of a question from your schoolwork that would need information from multiple sources to answer?
- Even with RAG, LLMs sometimes hallucinate. If you were building an AI assistant for a hospital, how would you make sure it doesn't make things up?
