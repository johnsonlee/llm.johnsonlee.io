<!-- .slide: class="center" -->

## 10. Agents & Tool Use

*Can AI use tools like we do?*

----

## The problem: AI is stuck in a text box

Current models can only read and write text. But real tasks require **action**:

- "Book me a flight" → needs to search websites, fill forms, pay
- "Fix this broken code" → needs to run programs, read error messages, try fixes
- "What's the weather?" → needs to check an API

> What if AI could **use tools** — search engines, calculators, APIs?

----

## Toolformer: Learning to use tools by itself

Instead of telling the model exactly when to use each tool, let it **figure it out on its own**:

1. Show the model some examples of tool use
2. Let it insert tool calls into its training data
3. Keep only the tool calls that actually **improve** predictions

The model learns **when** and **how** to use each tool!

> [Toolformer](https://arxiv.org/abs/2302.04761) (2023) — self-supervised tool learning

----

## Tools an LLM Can Learn to Use

Here are some tools Toolformer learned on its own:

- **Calculator**: "What is 593 × 217?" → [CALC(593 * 217)] → 128,681
- **Search engine**: "Who won the 2022 World Cup?" → [SEARCH(2022 World Cup winner)] → Argentina
- **Calendar**: "What day is 90 days from Jan 1?" → [CALENDAR(+90 days)] → April 1st
- **Translator**: "How do you say 'hello' in Japanese?" → [TRANSLATE(hello, ja)] → こんにちは

The LLM decides *when* a tool would help and *which* tool to use — all by itself!

----

## Voyager: An AI that explores Minecraft

What if an AI agent could explore an open world and learn new skills?

Voyager plays Minecraft with three components:

- **Curriculum**: Sets its own goals ("first gather wood, then build a house")
- **Skill Library**: Saves skills as code for reuse ("I know how to mine diamonds")
- **Sandbox**: Tests new skills safely before committing

> [Voyager](https://arxiv.org/abs/2305.16291) (2023) — an open-ended learning agent

----

## Why Voyager Is Special

Most AI agents follow a fixed script. Voyager is different:

- It **invents new skills** as it plays — nobody told it how to build a bridge
- Skills are saved as **reusable code** — "I know how to smelt iron" gets stored permanently
- Each new skill builds on previous ones — just like how you learn: crawl → walk → run → dance

This is the first AI that truly **learns by exploring**, not just by following instructions.

----

## MemGPT: Long-term memory for AI

AI conversations have a memory limit — it forgets earlier messages.

MemGPT treats memory like a computer's operating system:

- **Main memory**: Current conversation (fast but limited)
- **External memory**: Past conversations, documents (large but slower)
- The AI decides when to **save** and **load** memories

Like how you remember your best friend's name instantly but need to look up a phone number.

> [MemGPT](https://arxiv.org/abs/2310.08560) (2023) — virtual memory management for AI

----

## How do we test AI agents?

To know if agents actually work, we need hard, real-world benchmarks:

- **SWE-Bench**: Can the agent fix **real bugs** from GitHub issues?
- Not toy problems — real codebases with real test suites
- Most AI agents can only fix less than 5 out of 100 bugs — these are really hard!

> [SWE-Bench](https://arxiv.org/abs/2310.06770) (2023) — the standard benchmark for coding agents

----

## SWE-Agent: Designing better interfaces

Maybe agents fail because the **interface** is wrong, not the AI:

- Humans use IDEs with search, navigation, error highlighting
- Give agents similar tools: file search, code viewing, error parsing
- Design the interface **for the agent**, not for humans

> [SWE-Agent](https://arxiv.org/abs/2405.15793) (2024) — Agent-Computer Interface design matters

----

## Patterns for building agents

How should you structure an AI agent? Anthropic shared practical patterns:

- **Chaining**: Break complex tasks into steps, pass output to next step
- **Routing**: Send different types of tasks to different specialists
- **Parallelization**: Do independent tasks at the same time
- **Orchestration**: A manager agent coordinates worker agents

> [Building Effective Agents](https://www.anthropic.com/research/building-effective-agents) (2024) — practical agent architecture

----

## Agent Patterns in Everyday Life

These agent patterns aren't just for AI — you use them every day!

- **Chaining**: Making a sandwich → get bread → add ingredients → close → cut. Each step feeds the next.
- **Routing**: Homework time → math problems go to your "math brain," essay goes to your "writing brain"
- **Parallelization**: Downloading a file while reading an article — two tasks at once
- **Orchestration**: A team project — the leader assigns tasks to each member, collects results

AI agents organize their work the same way!

----

## Generative Agents: A virtual town

What happens when 25 AI agents live in a virtual town?

- Each agent has a **memory**, **personality**, and **daily routine**
- They form relationships, spread information, throw parties
- Emergent social behavior — not programmed, just emerged!

> [Generative Agents (Smallville)](https://arxiv.org/abs/2304.03442) (2023) — AI society simulation

----

## Chapter 10 Summary

| Paper | Key Idea |
|-------|----------|
| [Toolformer](https://arxiv.org/abs/2302.04761) (2023) | AI teaches itself to use tools |
| [Voyager](https://arxiv.org/abs/2305.16291) (2023) | Open-ended agent that explores Minecraft |
| [MemGPT](https://arxiv.org/abs/2310.08560) (2023) | Long-term memory like an OS |
| [SWE-Bench](https://arxiv.org/abs/2310.06770) (2023) | Real GitHub bugs as agent tests |
| [SWE-Agent](https://arxiv.org/abs/2405.15793) (2024) | Better interfaces for agents |
| [Building Agents](https://www.anthropic.com/research/building-effective-agents) (2024) | Practical agent patterns |
| [Smallville](https://arxiv.org/abs/2304.03442) (2023) | 25 AI agents form a society |

----

## Want to Learn More?

- [Building Effective Agents (Anthropic)](https://www.anthropic.com/research/building-effective-agents) — Practical patterns from Anthropic
- [Voyager Paper Explained](https://www.youtube.com/watch?v=u3ynhTkSJKE) — How an AI learned to play Minecraft (video)
- [Generative Agents: Interactive Simulacra](https://reverie.herokuapp.com/arXiv_Demo/) — Explore the virtual town of AI agents (live demo)
- [SWE-Bench Leaderboard](https://www.swebench.com/) — See which AI agents are best at fixing real bugs

----

## Think About It

- AI agents can use tools like search engines and calculators. What tool would you most want an AI to learn to use? Why?
- Voyager saves skills as code and reuses them. How is this similar to how you build on things you've already learned?
- The Smallville experiment showed AI agents forming friendships and throwing parties. Do you think AI can truly have "social" behavior, or is it just mimicking patterns?
- SWE-Bench shows that AI agents can only fix about 5% of real bugs. Why do you think real-world coding is so much harder than toy problems?
