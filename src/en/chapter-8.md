<!-- .slide: class="center" -->

## 8. Parameter-Efficient Fine-Tuning

*Can we teach AI new tricks without starting over?*

----

## The problem: customizing a giant

You want your AI to be a medical assistant. The base model knows **everything**, but not enough about medicine.

- Retraining all 70 billion parameters costs **millions**
- Needs dozens of expensive GPUs
- Takes weeks of training

> Is there a way to teach it medicine without changing the whole model?

----

## LoRA: Add a tiny side brain

Imagine your brain is a huge frozen block. Instead of melting and reshaping the whole thing:

- Attach a **small trainable adapter** to each layer
- Only train this adapter — the original model stays frozen
- The adapter has just **0.1%** of the parameters!

Like adding a sticky note to a textbook instead of rewriting the whole book.

> [LoRA](https://arxiv.org/abs/2106.09685) (2021) — the industry standard for fine-tuning

----

## QLoRA: Fine-tune on a single GPU

LoRA is cheap to train, but just loading a 65-billion-parameter model into memory still needs expensive hardware.

QLoRA combines two tricks:

- **Squeeze** the frozen model down to 4-bit numbers (16 times smaller!)
- Apply **LoRA** on top of the compressed model
- Fine-tune a 65B model on a **single consumer GPU**

> [QLoRA](https://arxiv.org/abs/2305.14314) (2023) — 4-bit quantization + LoRA = anyone can fine-tune

----

## DoRA: A smarter LoRA

Researchers studied what makes fine-tuning work and found:

- Weight changes have two parts: **direction** (where to go) and **magnitude** (how far)
- Standard LoRA adjusts both together
- DoRA separates them — adjust direction and magnitude independently

Result: consistently outperforms LoRA with the same cost!

> [DoRA](https://arxiv.org/abs/2402.09353) (2024) — decompose, then adapt

----

## Prefix-Tuning: Train only the prompt

What if instead of modifying the model, you just add some **magic words** at the beginning?

- Add a few special made-up words at the start of your input that the AI can learn to adjust
- The model itself stays completely frozen
- These tokens learn to steer the model toward your task

> [Prefix-Tuning](https://arxiv.org/abs/2101.00190) (2021) — train the prefix, not the model

----

## Making it easy for everyone

With so many fine-tuning methods, how do you choose?

- **PEFT Survey**: A comprehensive guide comparing all methods — when to use what
- **LLaMA-Factory**: One tool that supports LoRA, QLoRA, and more — fine-tune 100+ models with a few clicks

> [PEFT Survey](https://arxiv.org/abs/2303.15647) (2022) | [LLaMA-Factory](https://arxiv.org/abs/2403.13372) (2024)

----

## Chapter 8 Summary

| Paper | Key Idea |
|-------|----------|
| [LoRA](https://arxiv.org/abs/2106.09685) (2021) | Tiny trainable adapters — 0.1% of parameters |
| [QLoRA](https://arxiv.org/abs/2305.14314) (2023) | 4-bit compression + LoRA = single GPU |
| [DoRA](https://arxiv.org/abs/2402.09353) (2024) | Separate direction and magnitude |
| [Prefix-Tuning](https://arxiv.org/abs/2101.00190) (2021) | Trainable virtual tokens as steering |
| [LLaMA-Factory](https://arxiv.org/abs/2403.13372) (2024) | One tool for all fine-tuning methods |
