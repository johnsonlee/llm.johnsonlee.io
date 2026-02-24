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

## Flow Engineering: Test, fix, repeat

What if instead of generating code once, the AI **iterates** like a real developer?

1. Read the problem and generate initial code
2. Run the **tests** — did it pass?
3. If not, read the error, fix the code
4. Repeat until all tests pass

This test-driven approach dramatically outperforms single-shot generation!

> [Flow Engineering](https://arxiv.org/abs/2401.08500) (2024) — iterative test-driven code generation

----

## Chapter 11 Summary

| Paper | Key Idea |
|-------|----------|
| [StarCoder](https://arxiv.org/abs/2305.06161) (2023) | Open-source code model on The Stack dataset |
| [DeepSeek-Coder](https://arxiv.org/abs/2401.14196) (2024) | Repo-level code understanding |
| [AlphaCode](https://arxiv.org/abs/2203.07814) (2022) | Generate millions, filter the best |
| [Qwen2.5-Coder](https://arxiv.org/abs/2409.12186) (2024) | Multilingual code completion and repair |
| [Flow Engineering](https://arxiv.org/abs/2401.08500) (2024) | Test-driven iterative generation |
