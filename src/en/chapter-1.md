<!-- .slide: class="center" -->

## 1. Transformer Foundations

*How does an LLM understand language?*

----

## How do YOU understand a sentence?

When you read "The cat sat on the mat", you instantly know:

- **Who** sat? — The cat
- **Where?** — On the mat
- **What happened?** — Sitting

You understand because you see **all the words at once** and know how they relate to each other.

----

## Can an LLM do the same?

Early idea: read words **one by one**, like a conveyor belt.

> "The" → "cat" → "sat" → "on" → "the" → "mat"

Problem: by the time it reaches "mat", it has already forgotten "cat"!

- Short memory — long sentences break it
- Slow — must read word by word, can't skip ahead

----

## The Heart of an LLM: A Mathematical Function

Today's LLMs solve these problems. At its core, an LLM is a giant **mathematical function**:

- **Input**: a piece of text
- **Output**: probability of the next word
- **Inside**: hundreds of billions of numbers doing addition, subtraction, multiplication, and division

A function means "given some input, compute some output." An LLM and y = f(x) from math class are the same idea — just vastly different in dimensions.

----

## From y = f(x) to an LLM

![From 2D function to high-dimensional function](src/en/images/math-function.svg)

----

## From Text to Math: Three Steps

A function only understands numbers, not text! To make an LLM work, we need three steps:

1. **Chop**: Split text into small pieces (tokens)
2. **Locate**: Turn each token into coordinates (a vector) in mathematical space
3. **Compute**: Dynamically adjust each token's coordinates based on context — so the LLM truly "understands"

After these three steps, the LLM can "understand" text and produce answers. Let's walk through them!

----

<!-- .slide: class="center" -->

## Step 1: Chop Text into Pieces

*A function only understands numbers — first, break text into the smallest pieces*

----

## But what is a "word" to an LLM?

LLMs don't read words the way we do. They have a special tool called a **tokenizer**.

The tokenizer splits text into small pieces called **tokens**:

- "unhappiness" → "un" + "happiness" (2 tokens)
- "ChatGPT is cool" → "Chat" + "GPT" + " is" + " cool" (4 tokens)

----

## How does the tokenizer decide where to split?

- Before training, it scans the **training data** (the large collection of text used to teach the LLM) and finds which pieces appear most often, building a fixed vocabulary
- After that, every user input is split using the same vocabulary
- "happiness" shows up a lot → stays whole
- "unhappiness" is rarer → split into "un" + "happiness", two pieces it already knows
- Chinese works the same way: "喜欢" (like) and "西瓜" (watermelon) appear together so often that they each stay as one token

----

## How Is the Tokenizer Trained?

The most common method is called **Byte Pair Encoding (BPE)** — the core idea is like building a puzzle, repeatedly merging the most frequent adjacent pair into one new piece:

1. Start with only the smallest units in the vocabulary (single letters or single characters)
2. Scan the training data and find the most frequent adjacent pair, e.g. "t" and "h"
3. Merge them into "th" and add it to the vocabulary
4. Keep merging: "th" + "e" → "the", "i" + "ng" → "ing" ...
5. Stop when the vocabulary reaches a preset size (e.g. 50,000)

> Tokenizer training is completed **before** LLM training begins. Once the vocabulary is fixed, all text is split using the same vocabulary.

----

## Why "Byte Pair"? Does It Work for Chinese?

**Why "Byte Pair":** The algorithm was originally invented in 1994 for data compression, merging the most frequent adjacent byte pairs — hence the name. When NLP (Natural Language Processing) borrowed it, the operands changed from bytes to characters/subwords, but the name stuck.

**Does Chinese use BPE too?** Yes! Mainstream LLMs (GPT, LLaMA, etc.) use BPE for Chinese too — only the starting point differs:

- **English**: starts by merging single letters a, b, c
- **Chinese**: starts by merging single characters (or UTF-8 bytes) — "喜" + "欢" → "喜欢"

The merging logic is exactly the same: find the most frequent adjacent pair, merge, repeat.

----

<!-- .slide: class="center" -->

## Step 2: Give Each Token Coordinates

*Each piece needs a position in mathematical space*

----

## Embedding: Turning Words into Numbers

An LLM runs entirely on math — but words aren't numbers. How does an LLM "see" text?

- Each token gets **a list of numbers** representing its meaning — this list is called a **vector**, which is just a fancy word for "numbers in a row"
- This "token → vector" conversion is called **embedding**
- Words with similar meanings get similar vectors — "cat" and "dog" are closer than "cat" and "table"

> Embedding is the LLM's "dictionary": look up a token, get its vector.

----

## What Does Embedding Look Like?

![Embedding Visualization](src/en/images/embedding.svg)

----

## How Long Is a Vector?

Our diagram uses only 4 numbers per vector, but real LLMs use much longer ones (BERT and GPT are well-known LLMs we'll learn about later):

| LLM | Vector length (dimension d) |
|---|---|
| BERT-base | 768 |
| GPT-2 | 1,024 |
| GPT-3 | 12,288 |

The length of this number list is called the **dimension d**, and it's **chosen by the model designer** — higher dimensions can express richer meaning, like using more subjects on a report card to paint a fuller picture of a student.

> The d-dimensional space exists before training, but starts out empty; training is the process of arranging every token into a meaningful position.

----

## Where Do These Numbers Come From?

At the start, every token's vector is **random**. During training, the LLM reads sentences, guesses words, and learns from mistakes — gradually tuning the vectors.

After reading millions of sentences, the LLM notices:

- "I fed the ___ fish" / "I fed the ___ meat" — both "cat" and "dog" fit → vectors get pulled closer
- "I wiped the ___ clean" — only "table" fits, not "cat" or "dog" → vectors stay far apart

> Words that frequently fill the same blank end up with similar vectors — embeddings aren't designed by humans, the LLM learns them on its own.

----

<!-- .slide: class="center" -->

## Step 3: Compute in Mathematical Space

*Embedding gives each token a fixed position — but "apple" means different things in "eat an apple" and "Apple released a phone." How do we fix that?*

----

## Attention: Look at Everything at Once

That's exactly what **Attention** does!

- For each token, the LLM asks: *"Which other tokens are important to me?"*
- "sat" looks at "cat" → *who is sitting?*
- "sat" looks at "mat" → *where?*
- All tokens are processed **in parallel**, not one by one

> This idea is from [Attention Is All You Need](https://arxiv.org/abs/1706.03762) (2017) — the paper that introduced the **Transformer**

----

## How Attention Actually Works

Every token creates three things:

1. A **Query** — "What am I looking for?"
2. A **Key** — "Here's what I can offer"
3. A **Value** — "Here's the actual information I carry"

The LLM matches each Query against all Keys to find the most relevant tokens, then combines their Values. It's like raising your hand in class (Query), checking everyone's name tag (Key), and then listening to the right person's answer (Value).

----

## What Do Q, K, V Look Like?

Earlier we learned that each token's embedding is a list of d numbers. The LLM uses three different sets of weights to turn the same embedding into three "report cards":

- **Q (Query)** — d numbers: "What kind of partner am I looking for?"
- **K (Key)** — d numbers: "What can I offer?"
- **V (Value)** — d numbers: "The actual content I carry"

**Division of labor**: Q and K handle matching ("who should I attend to?"), V is the content that gets mixed. We'll simplify to **d=4** — the 4 traits are: who's doing it, what's happening, where, and what thing.

----

## Each Token as a "Report Card"

| | Who | What | Where | Which thing |
|---|---|---|---|---|
| cat Q (looking for) | 1 | 1 | 1 | 1 |
| cat K (can offer) | 1 | 0 | 0 | 0 |
| sat K (can offer) | 1 | 1 | 1 | 1 |
| mat K (can offer) | 0 | 0 | 0 | 1 |

What do these numbers mean? Let's find out on the next slide.

----

## Why These Numbers?

- **cat Q** is all 1s: "cat" just appeared — the LLM doesn't know yet what it's doing or where it is, so it asks about **everything**
- **sat K** is all 1s: "sat" is a verb full of info — action, subject, location — a **great match** with cat!
- **mat K** only has "which thing" = 1: "mat" mainly tells us about an object — a **weak match**

> Note: these numbers are simplified for teaching. In a real LLM, every token's Q, K, and V are **learned automatically** during training.

How do we calculate "how well they match" with math?

----

## Dot Product: Comparing Two "Report Cards"

The method is called the **dot product** — multiply the matching scores from two report cards, then add them all up.

The more subjects where both scored high, the bigger the total — better match! Let's see how well "cat" matches each token:

- cat Q · cat K = 1×1 + 1×0 + 1×0 + 1×0 = **1** — so-so
- cat Q · sat K = 1×1 + 1×1 + 1×1 + 1×1 = **4** — great match!
- cat Q · mat K = 1×0 + 1×0 + 1×0 + 1×1 = **1** — so-so

"cat" and "sat" have the biggest dot product — "cat" pays the most attention to "sat"!

----

## From Scores to Percentages

Previous step used Q and K to get relevance scores [1, 4, 1]. How do we turn these into "who to attend to" percentages?

**Step 1: Shrink the scores** — scores ÷ 2 → [0.5, 2.0, 0.5]
Scores that are too big cause problems (we'll explain why later) — so we "cool them down" first

**Step 2: Draw a pie chart (Softmax)** → **[15%, 69%, 15%]**
Convert scores into percentages — like drawing a pie chart where all slices add up to exactly 100%

Q and K's job is done — they've calculated that "cat" should pay 69% attention to "sat" and 15% each to "cat" and "mat." Now it's V's turn!

----

## Mixing with V: The Final Result

Q and K figured out "who to attend to." Now we use V to mix each token's **actual content**:

| | Who | What | Where | Which thing |
|---|---|---|---|---|
| cat V | 1 | 0 | 0 | 0 |
| sat V | 0 | 1 | 0 | 0 |
| mat V | 0 | 0 | 1 | 1 |

new "cat" = 15%×catV + **69%×satV** + 15%×matV = [0.15, **0.69**, 0.15, 0.15]

"cat" now knows 69% about "what's happening" — because it got the most information from "sat"!

----

## The Attention Formula: One Line

**Attention(Q, K, V) = softmax(QKᵀ / √d) · V**

Each part maps to a step we just did:

| Symbol | Which step |
|--------|---------|
| QKᵀ | Dot product — compare "report cards" |
| / √d | Shrink — cool the scores down |
| softmax | Pie chart — turn into percentages |
| · V | Mix by percentage — get the final result |

One-line summary: **compare report cards, cool down, draw pie chart, mix by weight**. Why must we "cool down"? Find out next!

----

## What Happens Without ÷ √d?

With d=4 the scores were small. But real LLMs use d=512, and dot product scores get **huge**:

| | cat | sat | mat |
|---|---|---|---|
| No scaling (d=512) | 12 | **98** | 15 |
| After pie chart | ≈0% | **≈100%** | ≈0% |

The pie chart is almost entirely "sat"! All other tokens are ignored — the LLM becomes "only look at one token."

----

## Dividing by √d: Softer Attention

Divide the scores by √512 ≈ 22.6 to "cool them down":

| | cat | sat | mat |
|---|---|---|---|
| After scaling | 0.5 | **4.3** | 0.7 |
| After pie chart | 2% | **93%** | 3% |

"sat" still gets the biggest slice, but "cat" and "mat" can contribute a little too.

This is why we "shrink the scores" in the earlier slide — **to stop the LLM from putting all its eggs in one basket**.

----

## Attention Computation Flow

![Attention Computation Flow](src/en/images/attention-computation.svg)

----

## Multi-Head Attention: Many Pairs of Eyes

One set of Query-Key-Value might focus on grammar. But what about meaning? Or position?

- The Transformer uses **multiple attention heads** — like having 8 or 16 pairs of eyes
- One head might notice "cat" is the subject of "sat"
- Another head might notice "mat" comes after "on"
- Each head captures a **different type of relationship**

Together, they give the LLM a rich, multi-layered understanding of the sentence.

----

## Inside Multi-Head Attention

The input vector is **split into h parts**, each part does attention independently, then they're concatenated back:

1. Say the input dimension is d=512 with h=8 heads
2. Each head sees only 512÷8 = **64 dimensions**
3. All 8 heads compute attention independently
4. Their results are **concatenated** and passed through one more linear projection

> It's like splitting a class into 8 discussion groups, each focusing on one angle, then combining everyone's notes.

----

## Why Are Multiple Heads Better Than One?

A single head must compress **all relationships** into one set of scores — that's too much pressure!

Multiple heads can **specialize**, each automatically learning to focus on a different type of relationship:

Take "The cat sat on the mat":

- **Head 1 (grammar)**: "cat" → "sat" (subject → verb)
- **Head 2 (position)**: "on" → "mat" (preposition → object)
- **Head 3 (meaning)**: "sat" → "mat" (action → location)

Together, the LLM understands grammar, position, AND meaning simultaneously — far more complete than any single head.

----

## But wait — what about token order?

"Dog bites man" and "Man bites dog" have the same tokens but very different meanings!

- Since Attention looks at all tokens at once, it doesn't know which token comes first
- Solution: **Positional Encoding** — give each token a "seat number"

> Token 1: "Dog" (seat #1) → Token 2: "bites" (seat #2) → Token 3: "man" (seat #3)

Now the LLM knows both the meaning AND the order.

----

## How Does Positional Encoding Work?

The LLM uses **sine and cosine** functions to encode each position — waves at different frequencies overlap, just like clock hands:

- **Second hand** (high frequency) — changes fast, distinguishes nearby positions
- **Minute hand** (medium frequency) — changes slower, distinguishes farther positions
- **Hour hand** (low frequency) — changes slowest, distinguishes very distant positions

Each position gets a unique "wave fingerprint" — the combination of different-speed hands ensures no two positions are alike.

----

## Why Sine and Cosine?

Because sine and cosine have a magical property: the encoding at position pos+k can be **computed from position pos using a linear transformation**.

This means the LLM can easily learn "relative distance":

- "3 positions apart" looks the same no matter the starting point
- Never seen position 1000 during training? No problem — the wave pattern is the same

----

## What If We Don't Use Sine/Cosine?

Could we just use simple numbering (1, 2, 3...)?

- Numbers keep growing, fail beyond the training range
- Can't express "relative distance", only "absolute position"

> Sine/cosine encoding = the LLM's secret weapon for understanding "near" and "far"

----

## What's Inside Each Layer?

Now that we know Attention, Multi-Head Attention, and Positional Encoding, let's see what a full Transformer layer contains:

1. **Multi-Head Attention**: Every token scans all others with multiple pairs of eyes, capturing different relationships
2. **Feed-Forward Network**: Every token independently "thinks" about the clues it collected, updating its understanding

There's also a **shortcut connection**: the token keeps its understanding from the previous layer. Even if one layer doesn't learn anything new, nothing is lost.

Each layer = observe → think → move on with deeper understanding.

----

## Why Do Shortcut Connections Matter?

Imagine 96 people in a line playing telephone — by the end, the message is garbled beyond recognition.

This is the **vanishing gradient** problem: signals get weaker and weaker through many layers, so the LLM can't learn.

How do we fix this?

----

## The Shortcut Connection Fix

> output = layer(x) + x

- Each layer passes a **copy of the original input** straight to its output
- Even if one layer learns nothing useful (layer(x) ≈ 0), the original information survives
- It's like playing telephone while also texting the original message — the truth always gets through

----

## Layer Normalization

Shortcut connections solve the signal loss problem, but there's another issue: numbers can become **wildly different in size** after many layers, making the LLM "dizzy."

**Layer normalization** is like recalibrating after each layer:

- Rescale all numbers back to a **consistent range**
- The relative order stays the same — only the scale gets tidied up
- Like converting raw test scores to percentages — easier to compare and work with

> Shortcut connections are also called **residual connections** — together with layer normalization, they form the "Add & Norm" blocks in Transformer architecture diagrams.

----

## Same Token, Layer by Layer

Take the token "apple" and watch it transform through the layers:

- **At input**: Just a symbol — the LLM doesn't know what it means yet
- **After early layers**: Surrounding words give clues — "apple" is related to "eating" or "company"
- **"I ate an apple"** → after deep layers: round, red, sweet — a fruit
- **"Apple released a new phone"** → after deep layers: tech company, iPhone, Tim Cook

Same token, completely different final understanding — that's the power of 12, 24, or even 96 layers of "transformation."

----

## Why Is It Called "Transformer"?

![Transformer layer-by-layer transformation](src/en/images/transformer-layers.svg)

----

## A Complete Transformer "Blueprint"

![Complete Transformer Architecture](src/en/images/transformer-architecture.svg)

----

<!-- .slide: class="center" -->

## The function is built — how do we train it?

*Architecture ready. Time to learn!*

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

## How BERT Learns

Imagine taking a cloze test thousands of times:

1. Take a sentence: "The cat sat on the mat"
2. **Mask** a random word: "The cat ** on the mat"
3. The LLM guesses the hidden word using clues from **both sides**
4. Check the answer, learn from mistakes, repeat millions of times

The key insight: BERT reads **left AND right** at the same time. It's like reading a mystery novel while already knowing the ending — you understand every clue much better.

----

## BERT Training Task 1: Masked Language Model (MLM)

BERT actually has two training tasks. The first is called **Masked Language Model (MLM)**:

- Randomly mask 15% of tokens and make the LLM guess them
- "The cat [MASK] on the mat" → guess "sat"
- This teaches the LLM **word-level** understanding

It's like a teacher covering up words on the blackboard and asking you to figure them out from context — the more you guess, the stronger your understanding.

----

## BERT Training Task 2: Next Sentence Prediction (NSP)

The second task is called **Next Sentence Prediction (NSP)**:

- Given two sentences, predict if the second truly follows the first
- ✅ "The cat was tired" → "It fell asleep on the mat"
- ❌ "The cat was tired" → "The weather is nice today"
- This teaches the LLM **sentence-level** relationships

Together, the two tasks help BERT understand both individual words and entire paragraphs.

----

## Approach 2: Predict the next word (GPT)

> "The cat sat on the ___"

The LLM learns to predict what comes next → it gets really good at **generating** text.

- Great for: writing, chatting, creating content
- Not great for: tasks that need deep understanding of the whole text

> [GPT-1](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) (2018) — reads **left to right**, predicting the next word

----

## How GPT Learns

Think about finishing someone's sentences:

1. Read: "Once upon a..."
2. Predict: "time" — Correct! Learn from this.
3. Read: "Once upon a time, there was a..."
4. Predict: "king" — the more stories you read, the better you guess.

GPT generates text one word at a time, always looking **only at what came before**. This is called **autoregressive generation** — each new word is influenced by all previous words, building up a story piece by piece.

----

## GPT's Causal Mask

When GPT generates text, it has a key constraint: the **causal mask**.

Each position can **only see words before it**, never after:

> Position 1: "Once" → sees only itself
> Position 2: "upon" → sees "Once"
> Position 3: "a" → sees "Once", "upon"

Why? Because during generation, the later words don't exist yet — you can't peek at answers that haven't been written!

----

## Temperature: The Creativity Dial

When GPT picks the next word, there's a dial called **temperature**:

- **Low temperature (0.1)**: almost always picks the highest-probability word → safe, repetitive
- **High temperature (1.5)**: gives lower-probability words a chance → creative, surprising

Think of it like a test: low temp = only the safest answer; high temp = willing to try a wild guess

----

## Can we get the best of both worlds?

What if we combined understanding AND generating?

> Idea: treat **every task** as "turn this text into that text"

- Translation: "English: Hello" → "French: Bonjour"
- Summary: "Long article..." → "Short summary..."
- Q&A: "Question: What color is the sky?" → "Answer: Blue"

> [T5](https://arxiv.org/abs/1910.10683) (2019) — one model, one format, **every task**

----

## The Universal Format: More Examples

The beauty of T5's "text-to-text" idea is how many tasks it covers:

- **Sentiment**: "classify: I love this movie" → "positive"
- **Grammar fix**: "fix: She don't like cats" → "She doesn't like cats"
- **Chat**: "respond: How are you?" → "I'm doing great, thanks!"

One model learns to handle **all** of these. No special architecture needed for each task — just change the instruction at the beginning.

----

## The Formal Names for Three Paths

Turning text into internal representations is called **encoding**; turning representations back into text is called **decoding**.

| What we learned | Formal name | Direction |
|---|---|---|
| Fill in the blanks (BERT) | **Encoder-only** | ← looks both ways → |
| Predict next word (GPT) | **Decoder-only** | looks forward only → |
| Best of both (T5) | **Encoder-Decoder** | Encode both ways, decode forward |

> GPT stands for **Generative Pre-trained Transformer** — a Decoder-only Transformer built to *generate*.

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
| [Attention Is All You Need](https://arxiv.org/abs/1706.03762) (2017) | Look at all tokens at once — the Transformer |
| [BERT](https://arxiv.org/abs/1810.04805) (2018) | Fill in blanks → understand text |
| [GPT-1](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) (2018) | Predict next word → generate text |
| [T5](https://arxiv.org/abs/1910.10683) (2019) | Every task = text in → text out |
| [RoBERTa](https://arxiv.org/abs/1907.11692) (2019) | Better training beats better design |

----

## Want to Learn More?

- [3Blue1Brown: But what is a GPT?](https://www.youtube.com/watch?v=wjZofJX0v4M) — Beautiful visual explanation of how Transformers work
- [Jay Alammar: The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) — Step-by-step diagrams of Attention, Keys, Queries, and Values
- [Andrej Karpathy: Let's build GPT from scratch](https://www.youtube.com/watch?v=kCc8FmEb1nY) — Build a mini GPT yourself (video, 2 hours)
- [BERT Explained Visually](https://jalammar.github.io/illustrated-bert/) — See how BERT fills in the blanks

----

## Think About It

- If you were designing an LLM, would you teach it to read left-to-right (like GPT) or look at everything at once (like BERT)? Why?
- Why do you think "unhappiness" gets split into two tokens but "happiness" stays as one? Can you think of other words that might get split?
- Can you think of a task where **understanding** is more important than **generating**? What about the reverse?
- RoBERTa showed that training matters more than design. Can you think of an example from your own life where practice beat talent?
