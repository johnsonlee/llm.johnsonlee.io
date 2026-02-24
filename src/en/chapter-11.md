<!-- .slide: class="center" -->

## 11. Code Generation

*Can AI write computer programs?*

----

## Why is writing code special?

Code is different from normal text:

- It must be **exactly right** — one wrong character and it breaks
- It has **logic** — the program must actually do what you want
- It's **testable** — you can run it and check if it works!

> Can a language model, trained on text, actually write working code?

----

## StarCoder: An open-source code model

First, collect a mountain of code examples — a dataset called **The Stack**:

- Code from GitHub in 86+ programming languages
- Carefully filtered to remove duplicates and low-quality code
- Trained a 15B parameter model specifically on code

> [StarCoder](https://arxiv.org/abs/2305.06161) (2023) — open-source code generation for everyone

----

## Why Code Data Is Special

Training on code teaches an LLM skills it can't learn from text alone:

- **Logical reasoning**: Code *must* be logically correct or it won't run
- **Structured thinking**: Functions, loops, and conditions teach step-by-step planning
- **Precision**: One wrong character → the program crashes — no room for "close enough"

Research shows that models trained on code become better at math and reasoning too, even on non-coding tasks!

----

## DeepSeek-Coder: Understanding whole projects

Most code models complete **one file at a time**. But real projects have many files!

- Trained on **repository-level** code — understanding how files relate to each other
- **Fill-in-the-middle**: Not just predicting the next line, but filling gaps in existing code
- Like understanding a whole book, not just one page

> [DeepSeek-Coder](https://arxiv.org/abs/2401.14196) (2024) — repo-level code understanding

----

## AlphaCode: Competing with humans

Can AI solve **programming contest** problems — the kind that are so hard, even many adult programmers struggle?

- Understanding complex problem descriptions
- Coming up with algorithms
- Writing correct code under constraints

AlphaCode's trick: generate **millions** of solutions, then filter and cluster them.

> [AlphaCode](https://arxiv.org/abs/2203.07814) (2022) — competition-level code generation

----

## AlphaCode's Secret: Generate and Filter

Most humans write one solution and debug it. AlphaCode does something completely different:

1. Generate **1,000,000** possible solutions
2. Run all of them against the test cases
3. Cluster similar solutions together
4. Submit one solution from each cluster

It's like brainstorming a million ideas, then testing each one. Only the best survive — a brute-force approach that works surprisingly well!

----

## Flow Engineering: Test, fix, repeat

What if instead of generating code once, the AI **iterates** like a real developer?

1. Read the problem and generate initial code
2. Run the **tests** — did it pass?
3. If not, read the error, fix the code
4. Repeat until all tests pass

This test-driven approach dramatically outperforms single-shot generation!

> [Flow Engineering](https://arxiv.org/abs/2401.08500) (2024) — iterative test-driven code generation

----

## How Real Developers vs AI Write Code

| Step | Human Developer | AI with Flow Engineering |
|------|----------------|--------------------------|
| 1 | Read the requirements | Read the requirements |
| 2 | Plan the approach | Generate initial code |
| 3 | Write code | Run tests |
| 4 | Run tests | Read errors, fix code |
| 5 | Debug and fix | Run tests again |
| 6 | Repeat until done | Repeat until all pass |

The key insight: AI coding gets dramatically better when it can **see its own mistakes** and try again — just like humans!

----

## Chapter 11 Summary

| Paper | Key Idea |
|-------|----------|
| [StarCoder](https://arxiv.org/abs/2305.06161) (2023) | Open-source code model on The Stack dataset |
| [DeepSeek-Coder](https://arxiv.org/abs/2401.14196) (2024) | Repo-level code understanding |
| [AlphaCode](https://arxiv.org/abs/2203.07814) (2022) | Generate millions, filter the best |
| [Qwen2.5-Coder](https://arxiv.org/abs/2409.12186) (2024) | Multilingual code completion and repair |
| [Flow Engineering](https://arxiv.org/abs/2401.08500) (2024) | Test-driven iterative generation |

----

## Want to Learn More?

- [The Stack (Hugging Face)](https://huggingface.co/datasets/bigcode/the-stack) — Explore the massive code dataset behind StarCoder
- [AlphaCode Explained (Two Minute Papers)](https://www.youtube.com/watch?v=t3Yh56efKGI) — Quick video overview of AlphaCode
- [GitHub Copilot](https://github.com/features/copilot) — Try AI-powered coding yourself
- [SWE-bench: Can AI Fix Real Bugs?](https://www.swebench.com/) — Leaderboard for coding agents

----

## Think About It

- Code must be exactly right, but natural language is fuzzy. How does an LLM trained on "fuzzy" text learn to write "exact" code?
- AlphaCode generates a million solutions and picks the best. Is this "creative" or just "trying everything"? What's the difference?
- If AI can write code, do you still need to learn programming? What skills become more or less important?
- Flow Engineering lets AI debug its own code by reading error messages. What other skills could AI learn by getting feedback on its own work?
