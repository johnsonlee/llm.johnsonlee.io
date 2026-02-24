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

## Why Open Source Matters

Before LLaMA, studying LLMs was like studying a locked treasure chest:

- You could **use** GPT-3 through an API, but couldn't see inside
- You couldn't study **why** it made mistakes
- You couldn't **customize** it for your own needs

LLaMA gave researchers the key. Within weeks, people built medical assistants, coding helpers, and language tutors — all from this one open model.

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

## How Mixture of Experts Works

Imagine a hospital with specialist doctors:

1. A patient arrives → the receptionist (called the **router**) looks at the symptoms
2. The router sends them to the right specialists — maybe a heart doctor and a lung doctor
3. Only these 2 doctors work on this case; the other 6 specialists rest
4. Next patient might need entirely different specialists

That's MoE! The router decides which 2 of 8 experts handle each piece of text. Total knowledge: 47 billion parameters. Active per task: only 13 billion.

----

## DeepSeek: Efficiency at extreme scale

A Chinese lab pushed efficiency to the extreme:

- **DeepSeek-V2**: Invented a way to compress the AI's memory so it uses much less space
- **DeepSeek-V3**: 671B total, but MoE keeps it affordable. Used a number-saving trick (FP8) to cut training cost in half
- **DeepSeek-R1**: Trained with pure reinforcement learning — the model taught **itself** to reason!

> [DeepSeek-V2](https://arxiv.org/abs/2405.04434) | [V3](https://arxiv.org/abs/2412.19437) | [R1](https://arxiv.org/abs/2501.12948) (2024-2025)

----

## DeepSeek-R1: Teaching Itself to Reason

Most models learn reasoning from human-written examples. DeepSeek-R1 did something different:

- Start with a base model that has **no** reasoning training
- Give it math problems and reward it when it gets the right answer
- The model **invented its own** reasoning strategies through trial and error!
- It discovered techniques like "let me check my work" and "let me try a different approach" — all on its own

This showed that reasoning can **emerge** from pure reinforcement learning.

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

----

## Want to Learn More?

- [The LLaMA Story (Weights & Biases)](https://wandb.ai/ayush-thakur/llama-2/reports/All-About-Llama-2--Vmlldzo0OTk0NjQ2) — How LLaMA changed the AI landscape
- [Mixture of Experts Explained (Hugging Face)](https://huggingface.co/blog/moe) — Visual guide to how MoE works
- [DeepSeek-R1 Explained (AI Explained)](https://www.youtube.com/watch?v=bAWV_yrqx1A) — How a model taught itself to reason
- [Open Source AI Timeline](https://lifearchitect.ai/models-table/) — Track every open-source model release

----

## Think About It

- Why would a company like Meta give away a model that cost millions to train? What do they gain from open source?
- Mixtral uses 8 experts but only activates 2 at a time. What might go wrong if the router always picks the same 2 experts?
- DeepSeek-R1 taught itself to reason through pure RL. Do you think an LLM could teach itself other skills this way — like creativity or humor?
- If you could download and customize any LLM for free, what would you build with it?
