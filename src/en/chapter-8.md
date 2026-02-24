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
- The adapter has less than **1%** of the parameters!

Like adding a sticky note to a textbook instead of rewriting the whole book.

> [LoRA](https://arxiv.org/abs/2106.09685) (2021) — the industry standard for fine-tuning

----

## How LoRA Works Inside

Every layer of an LLM has a huge weight matrix (think: a massive spreadsheet of numbers).

LoRA's trick: instead of updating the whole spreadsheet, it adds two **tiny** matrices that multiply together:

- Original matrix: 4096 × 4096 = 16 million numbers (frozen)
- LoRA matrices: 4096 × 8 + 8 × 4096 = only 65,536 numbers (trainable)

That's **0.4%** of the parameters! Yet the result is nearly as good as retraining everything.

----

## QLoRA: Fine-tune on a single GPU

LoRA is cheap to train, but just loading a 65-billion-parameter model into memory still needs expensive hardware.

QLoRA combines two tricks:

- **Squeeze** the frozen model down to 4-bit numbers (16 times smaller!)
- Apply **LoRA** on top of the compressed model
- Fine-tune a 65B model on a **single consumer GPU**

> [QLoRA](https://arxiv.org/abs/2305.14314) (2023) — 4-bit quantization + LoRA = anyone can fine-tune

----

## Why QLoRA Was a Democratization Moment

Before QLoRA, fine-tuning a large model required:
- A cluster of 8+ expensive GPUs (~$100,000+ hardware)
- Weeks of setup and tuning

After QLoRA:
- A single gaming GPU (~$1,000) is enough
- Students, hobbyists, and small companies could suddenly customize their own LLMs

This is what "democratizing AI" really means — putting the power in everyone's hands.

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

## Comparing Fine-Tuning Methods

| Method | What's trained | % of params | Needs GPU memory |
|--------|---------------|-------------|------------------|
| Full fine-tuning | Everything | 100% | Enormous |
| LoRA | Small side matrices | ~0.1% | Moderate |
| QLoRA | LoRA + 4-bit model | ~0.1% | Small (1 GPU) |
| Prefix-Tuning | Virtual tokens only | ~0.01% | Very small |

The trend is clear: train **less**, achieve **more**. Each method finds a cleverer way to customize a frozen model.

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

----

## Want to Learn More?

- [LoRA Explained (Lightning AI)](https://lightning.ai/pages/community/lora-insights/) — Visual explanation of how LoRA works
- [QLoRA: Fine-tune LLMs on a single GPU (Tim Dettmers)](https://timdettmers.com/2023/05/23/qlora-finetuning/) — The creator explains QLoRA
- [Hugging Face PEFT Library](https://huggingface.co/docs/peft) — Try LoRA yourself with just a few lines of code
- [LLaMA-Factory (GitHub)](https://github.com/hiyouga/LLaMA-Factory) — Fine-tune 100+ models with a simple interface

----

## Think About It

- LoRA trains only 0.1% of parameters but gets nearly full performance. Why do you think such a tiny change can make such a big difference?
- QLoRA let a single GPU fine-tune a 65B model. What new applications become possible when the cost of customizing AI drops this low?
- If you could fine-tune an LLM to be an expert in any subject, what would you choose and why?
- Prefix-Tuning adds "magic words" that steer the model. How is this similar to or different from writing a good prompt?
