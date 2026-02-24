<!-- .slide: class="center" -->

## 1. Transformer Foundations

*How does a computer understand language?*

----

## How do YOU understand a sentence?

When you read "The cat sat on the mat", you instantly know:

- **Who** sat? — The cat
- **Where?** — On the mat
- **What happened?** — Sitting

You understand because you see **all the words at once** and know how they relate to each other.

----

## Can a computer do the same?

Early idea: read words **one by one**, like a conveyor belt.

> "The" → "cat" → "sat" → "on" → "the" → "mat"

Problem: by the time it reaches "mat", it has already forgotten "cat"!

- Short memory — long sentences break it
- Slow — must read word by word, can't skip ahead

----

## But what is a "word" to an LLM?

LLMs don't read words the way we do. They have a special tool called a **tokenizer**.

The tokenizer splits text into small pieces called **tokens**:

- "unhappiness" → "un" + "happiness" (2 tokens)
- "ChatGPT is cool" → "Chat" + "GPT" + " is" + " cool" (4 tokens)

----

## How does the tokenizer decide where to split?

- Before training, it scans the **training data** and finds which pieces appear most often, building a fixed vocabulary
- After that, every user input is split using the same vocabulary
- "happiness" shows up a lot → stays whole
- "unhappiness" is rarer → split into "un" + "happiness", two pieces it already knows
- Chinese works the same way: "喜欢" (like) and "西瓜" (watermelon) appear together so often that they each stay as one token

----

<!-- .slide: class="center" -->

## What if the computer could look at every word at the same time?

----

## Attention: Look at Everything at Once

That's exactly what **Attention** does!

- For each word, the LLM asks: *"Which other words are important to me?"*
- "sat" looks at "cat" → *who is sitting?*
- "sat" looks at "mat" → *where?*
- All words are processed **in parallel**, not one by one

> This idea is from [Attention Is All You Need](https://arxiv.org/abs/1706.03762) (2017) — the paper that introduced the **Transformer**

----

## But wait — what about word order?

"Dog bites man" and "Man bites dog" have the same words but very different meanings!

- Since Attention looks at all words at once, it doesn't know which word comes first
- Solution: **Positional Encoding** — give each word a "seat number"

> Word 1: "Dog" (seat #1) → Word 2: "bites" (seat #2) → Word 3: "man" (seat #3)

Now the LLM knows both the meaning AND the order.

----

## Two ways to learn language

Imagine learning a new language. You could:

- **Read a book with missing words and guess them** — you learn to *understand*
- **Predict the next word in a story** — you learn to *write*

Researchers tried both approaches!

----

## Approach 1: Fill in the blanks (BERT)

> "The ___ sat on the mat"

The LLM learns to guess the missing word → it gets really good at **understanding** text.

- Great for: answering questions, classifying text, finding information
- Not great for: writing stories or having conversations

> [BERT](https://arxiv.org/abs/1810.04805) (2018) — reads in **both directions** to understand context

----

## Approach 2: Predict the next word (GPT)

> "The cat sat on the ___"

The LLM learns to predict what comes next → it gets really good at **generating** text.

- Great for: writing, chatting, creating content
- Not great for: tasks that need deep understanding of the whole text

> [GPT-1](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) (2018) — reads **left to right**, predicting the next word

----

## Can we get the best of both worlds?

What if we combined understanding AND generating?

> Idea: treat **every task** as "turn this text into that text"

- Translation: "English: Hello" → "French: Bonjour"
- Summary: "Long article..." → "Short summary..."
- Q&A: "Question: What color is the sky?" → "Answer: Blue"

> [T5](https://arxiv.org/abs/1910.10683) (2019) — one model, one format, **every task**

----

## Does a smarter design always win?

Surprisingly, **no**!

Researchers found that training a simpler model **longer** and with **more data** often beats a fancier model:

- Train longer, don't stop early
- Use more data, don't reuse the same text
- The recipe matters more than the ingredients

> [RoBERTa](https://arxiv.org/abs/1907.11692) (2019) — same BERT design, better training, better results

----

## Chapter 1 Summary

| Paper | Key Idea |
|-------|----------|
| [Attention Is All You Need](https://arxiv.org/abs/1706.03762) (2017) | Look at all words at once — the Transformer |
| [BERT](https://arxiv.org/abs/1810.04805) (2018) | Fill in blanks → understand text |
| [GPT-1](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) (2018) | Predict next word → generate text |
| [T5](https://arxiv.org/abs/1910.10683) (2019) | Every task = text in → text out |
| [RoBERTa](https://arxiv.org/abs/1907.11692) (2019) | Better training beats better design |
