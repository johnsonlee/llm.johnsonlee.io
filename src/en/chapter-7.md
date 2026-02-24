<!-- .slide: class="center" -->

## 7. Prompting & Reasoning

*How do you talk to AI to get the best answers?*

----

## The magic of asking the right question

The same model can give a terrible or amazing answer depending on **how you ask**.

> "What is 17 × 24?" → "408" (sometimes wrong!)

> "What is 17 × 24? Let's work through it step by step." → much more accurate!

The art of writing good prompts is called **prompt engineering**.

----

## Chain-of-Thought: Show your work!

Remember how your math teacher says "show your work"?

- Give the model a few examples where you show step-by-step reasoning
- The model learns to **think out loud** before giving the final answer
- Accuracy on math problems jumps dramatically!

> [Chain-of-Thought Prompting](https://arxiv.org/abs/2201.11903) (2022) — few examples with reasoning steps

----

## Chain-of-Thought: Before and After

**Without CoT:**
> Q: "Roger has 5 tennis balls. He buys 2 cans of 3. How many does he have?"
> A: "11" (just the answer — sometimes wrong)

**With CoT:**
> Q: Same question. Let's think step by step.
> A: "Roger starts with 5 balls. He buys 2 cans, each with 3 balls. 2 × 3 = 6. 5 + 6 = 11."

The reasoning steps help the LLM **check its own logic** and catch mistakes along the way.

----

## Zero-Shot CoT: One magic sentence

Do you need examples? Nope! Just add one sentence:

> **"Let's think step by step."**

That's it. This single instruction makes the model reason without any examples.

- Works across math, logic, common sense tasks
- The simplest prompting trick that actually works

> [Zero-Shot CoT](https://arxiv.org/abs/2205.11916) (2022) — the power of "Let's think step by step"

----

## What if the first path is wrong?

Chain-of-Thought follows one path. But what if that path leads to a dead end?

- **Tree of Thoughts**: Explore multiple reasoning paths like a tree
- At each step, branch out, evaluate, and **backtrack** if needed
- Like solving a maze — try different paths, keep the best one

> [Tree of Thoughts](https://arxiv.org/abs/2305.10601) (2023) — explore, evaluate, backtrack

----

## Tree of Thoughts: Solving a Maze

Imagine you're in a maze:

- **Chain-of-Thought** = pick one path and walk to the end. If it's a dead end, too bad!
- **Tree of Thoughts** = at each fork, send a scout down each path. Scouts report back. Choose the most promising path. If it fails, backtrack and try another.

This is exactly how chess engines work — explore many moves ahead, prune bad ones, and pick the best strategy.

----

## Self-Consistency: Ask many times, vote

Another approach: instead of one path, try **many paths** and vote!

- Ask the model the same question multiple times
- Each time it might reason differently
- Take the **majority answer** — the one that appears most often wins

Like asking 10 friends for directions and going where most of them agree.

> [Self-Consistency](https://arxiv.org/abs/2203.11171) (2022) — sample many paths, majority vote

----

## ReAct: Think AND act

What if the model needs information it doesn't have?

- **Think**: "I need to find the population of Tokyo"
- **Act**: Search the web → get result
- **Think**: "Now I can calculate the answer"
- **Act**: Return the final answer

Interleaving **reasoning** and **actions** — this is the foundation of AI agents!

> [ReAct](https://arxiv.org/abs/2210.03629) (2022) — the blueprint for AI agents

----

## ReAct in Action: A Real Example

> **Question**: "What is the population of the country where the Eiffel Tower is located?"

1. **Think**: "I need to find which country has the Eiffel Tower"
2. **Act**: Search → "The Eiffel Tower is in Paris, France"
3. **Think**: "Now I need France's population"
4. **Act**: Search → "France has about 68 million people"
5. **Think**: "I have the answer now"
6. **Act**: Answer → "About 68 million"

Two searches, three thoughts — the Think-Act loop broke down a complex question into simple steps!

----

## Test-Time Compute: Think harder when it matters

Some questions are easy, some are hard. Should the AI spend the same amount of thinking time on both?

- Easy question: answer quickly
- Hard question: use **more computation** to think longer
- Give harder problems more thinking time

This is the theoretical basis for OpenAI's o1 model!

> [Scaling LLM Test-Time Compute](https://arxiv.org/abs/2408.03314) (2024) — spend more time on harder problems

----

## STaR: The model teaches itself to reason

Can a model improve its own reasoning?

1. Try to solve problems with reasoning
2. Keep the reasoning chains that led to **correct answers**
3. Train on those good chains → the model gets better
4. Repeat!

> [STaR](https://arxiv.org/abs/2203.14465) (2022) — the model teaches itself to reason better

----

## Chapter 7 Summary

| Paper | Key Idea |
|-------|----------|
| [Chain-of-Thought](https://arxiv.org/abs/2201.11903) (2022) | Show step-by-step reasoning examples |
| [Zero-Shot CoT](https://arxiv.org/abs/2205.11916) (2022) | "Let's think step by step" |
| [Tree of Thoughts](https://arxiv.org/abs/2305.10601) (2023) | Explore multiple paths, backtrack |
| [Self-Consistency](https://arxiv.org/abs/2203.11171) (2022) | Many attempts, majority vote |
| [ReAct](https://arxiv.org/abs/2210.03629) (2022) | Reasoning + actions = agents |
| [Test-Time Compute](https://arxiv.org/abs/2408.03314) (2024) | Think harder on hard problems |
| [STaR](https://arxiv.org/abs/2203.14465) (2022) | Self-taught reasoning improvement |

----

## Want to Learn More?

- [Prompt Engineering Guide (DAIR.AI)](https://www.promptingguide.ai/) — The most comprehensive prompt engineering resource
- [Chain-of-Thought Hub (GitHub)](https://github.com/FranxYao/chain-of-thought-hub) — Collection of CoT prompting research
- [Tree of Thoughts Explained (Yannic Kilcher)](https://www.youtube.com/watch?v=ut5kp56wW_4) — Video walkthrough of ToT with examples
- [ReAct Pattern (LangChain)](https://python.langchain.com/docs/modules/agents/agent_types/react) — Build your own ReAct agent

----

## Think About It

- "Let's think step by step" dramatically improves LLM performance. Why do you think just adding these words helps so much?
- Self-Consistency asks the same question many times and picks the majority answer. When might the majority answer still be wrong?
- ReAct lets LLMs search the web for information. What are the risks if the information found online is wrong or biased?
- If you could design a new prompting technique, what would it look like? How would you help an LLM solve problems it currently struggles with?
