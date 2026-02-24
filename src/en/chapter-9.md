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

## How do you search? Embeddings!

But how does the LLM know which passages are relevant?

- Turn words into **lists of numbers** (called vectors) that capture their meaning
- Similar meanings → similar numbers → close together in space
- "dog" and "puppy" are close; "dog" and "algebra" are far

We need good benchmarks to test if embeddings are accurate.

> [MTEB](https://arxiv.org/abs/2210.07316) (2022) — the standard benchmark for text embeddings

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
