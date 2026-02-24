<!-- .slide: class="center" -->

## 14. Reasoning Models

*Can AI actually think, not just predict?*

----

## Predicting vs Thinking

Standard LLMs predict the **most likely** next word. But reasoning requires:

- Breaking a problem into steps
- Trying different approaches
- Checking your own work
- Backtracking when stuck

> Can we build models that **think through** problems rather than just pattern-match?

----

## The landscape of reasoning

Researchers surveyed all known approaches to building reasoning models:

- **Chain-of-Thought**: Think step by step (Chapter 7)
- **Search**: Explore multiple paths (Tree of Thoughts)
- **Reinforcement Learning**: Learn from getting things right or wrong (like training with rewards)
- **Self-improvement**: Model teaches itself to reason better

> [Towards Large Reasoning Models: A Survey](https://arxiv.org/abs/2501.09686) (2025) — the full picture

----

## A Blueprint for reasoning models

How do you actually **build** a reasoning model from scratch?

1. Start with a strong base model
2. Collect problems with step-by-step solutions
3. Train with RL — reward correct reasoning, penalize errors
4. The model learns to write out its **thinking steps** before giving a final answer

> [Reasoning Language Models: A Blueprint](https://arxiv.org/abs/2501.11223) (2025) — the recipe

----

## s1: You don't need billions of dollars

OpenAI's o1 seems really expensive to build. Can we do the same thing for way less money?

- Only 1,000 carefully chosen training examples (not millions!)
- Simple test-time scaling — let the model "think longer" on hard problems
- Surprisingly competitive with much more expensive approaches

> [s1: Simple Test-Time Scaling](https://arxiv.org/abs/2501.19393) (2025) — less is more

----

## Kimi k1.5: New RL tricks

Training reasoning with RL is tricky — the model can learn bad habits:

- **Reward hacking**: The AI finds ways to cheat the scoring system — it gets high scores but hasn't really learned anything
- **Instability**: Training can collapse or diverge
- Kimi k1.5 introduced novel RL methods to keep training stable

> [Kimi k1.5](https://arxiv.org/abs/2501.12599) (2025) — stabilizing RL for reasoning

----

## LIMO: How few examples do you need?

Conventional wisdom: more training data = better reasoning.

LIMO showed the opposite:

- Models with strong foundations need very **few** reasoning examples
- Quality of examples matters far more than quantity
- A few hundred excellent examples can unlock powerful reasoning!

> [LIMO](https://arxiv.org/abs/2502.03387) (2025) — the Less is More hypothesis

----

## What actually happens inside long reasoning?

When a model "thinks" for a long time, what is it actually doing?

- Researchers analyzed thousands of long chain-of-thought traces
- Found patterns: exploration, backtracking, verification, summarization
- Longer thinking helps, but only up to a point — after that, quality degrades

> [Demystifying Long Chain-of-Thought](https://arxiv.org/abs/2502.03373) (2025) — what happens inside the thinking process

----

## Chapter 14 Summary

| Paper | Key Idea |
|-------|----------|
| [Reasoning Survey](https://arxiv.org/abs/2501.09686) (2025) | Overview of all reasoning approaches |
| [Blueprint](https://arxiv.org/abs/2501.11223) (2025) | Step-by-step recipe for reasoning models |
| [s1](https://arxiv.org/abs/2501.19393) (2025) | Simple, cheap test-time scaling |
| [Kimi k1.5](https://arxiv.org/abs/2501.12599) (2025) | Stable RL training for reasoning |
| [LIMO](https://arxiv.org/abs/2502.03387) (2025) | Few excellent examples beat many mediocre ones |
| [Demystifying](https://arxiv.org/abs/2502.03373) (2025) | What happens inside long thinking |
