<!-- .slide: class="center" -->

## 4. Open-Source LLM Milestones

*What if powerful AI was free for everyone?*

----

## The problem with closed AI

GPT-3 and GPT-4 are amazing, but:

- Only OpenAI can use them
- You must **pay per request** and can't see how they work
- You can't modify them or run them on your own computer

> What if someone made a powerful model and gave it away for **free**?

----

## LLaMA: Opening the gates

Meta released LLaMA — models from 7B to 65B parameters, trained on **public data**.

- Smaller but surprisingly competitive with GPT-3
- Anyone could download and study them
- Kicked off an explosion of open-source AI research

> [LLaMA](https://arxiv.org/abs/2302.13971) (2023) — the spark that started the open-source LLM revolution

----

## Llama 2 & 3: Getting better and safer

Meta kept improving:

- **Llama 2**: Added RLHF safety training, published all the details
- **Llama 3**: Scaled to 405B parameters with comprehensive training docs

Each version: better performance, more transparent, more accessible.

> [Llama 2](https://arxiv.org/abs/2307.09288) (2023) | [Llama 3](https://arxiv.org/abs/2407.21783) (2024)

----

## Do we need a giant model?

What if a **tiny** model could be really smart? Mistral proved it:

- Only 7B parameters — runs on a single GPU
- Used clever tricks: **Sliding Window Attention** (only look at nearby words to save time)
- Used **Grouped-Query Attention** (let parts of the brain share notes instead of each keeping their own)

> [Mistral 7B](https://arxiv.org/abs/2310.06825) (2023) — small but mighty

----

## Mixture of Experts: Use the right part of your brain

When you do math, you don't use the part of your brain for music. What if AI worked the same way?

- **Mixtral**: 8 expert networks, each 7B parameters
- For each task, only **2 experts** activate — the rest stay idle
- Total parameters: 47B, but active parameters: only 13B!

> [Mixtral](https://arxiv.org/abs/2401.04088) (2024) — use the right expert for the right job

----

## DeepSeek: Efficiency at extreme scale

A Chinese lab pushed efficiency to the extreme:

- **DeepSeek-V2**: Invented a way to compress the AI's memory so it uses much less space
- **DeepSeek-V3**: 671B total, but MoE keeps it affordable. Used a number-saving trick (FP8) to cut training cost in half
- **DeepSeek-R1**: Trained with pure reinforcement learning — the model taught **itself** to reason!

> [DeepSeek-V2](https://arxiv.org/abs/2405.04434) | [V3](https://arxiv.org/abs/2412.19437) | [R1](https://arxiv.org/abs/2501.12948) (2024-2025)

----

## More open models from around the world

- **Qwen3** (Alibaba): Supports 100+ languages, unified thinking/non-thinking modes
- **Gemma 2** (Google): Used knowledge distillation — a big model teaches a smaller model, like an older sibling helping a younger one study

> The open-source ecosystem is global and accelerating!

> [Qwen3](https://arxiv.org/abs/2505.09388) (2025) | [Gemma 2](https://arxiv.org/abs/2408.00118) (2024)

----

## Chapter 4 Summary

| Paper | Key Idea |
|-------|----------|
| [LLaMA](https://arxiv.org/abs/2302.13971) (2023) | Started the open-source LLM revolution |
| [Llama 2](https://arxiv.org/abs/2307.09288) / [3](https://arxiv.org/abs/2407.21783) | Open-source + safety alignment |
| [Mistral 7B](https://arxiv.org/abs/2310.06825) (2023) | Small model, big performance |
| [Mixtral](https://arxiv.org/abs/2401.04088) (2024) | Mixture of Experts — only activate what you need |
| [DeepSeek series](https://arxiv.org/abs/2501.12948) (2024-25) | Extreme efficiency, self-taught reasoning |
| [Qwen3](https://arxiv.org/abs/2505.09388) / [Gemma 2](https://arxiv.org/abs/2408.00118) | Global open-source ecosystem |
