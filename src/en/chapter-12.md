<!-- .slide: class="center" -->

## 12. Multimodal Models

*Can AI understand pictures, not just words?*

----

## The limitation: text-only AI is blind

GPT and BERT are amazing at text, but they can't:

- Look at a photo and describe what's in it
- Read text from a document image
- Understand a chart or diagram

> Humans use **all their senses**. Can AI do the same?

----

## CLIP: Connecting images and words

The key idea: learn from millions of pictures that already have descriptions on the internet!

- Show the model millions of images with their descriptions
- It learns that a photo of a dog and the word "dog" should match
- Now it can classify **any** image into **any** category — without specific training!

"A photo of a cat" → finds cat pictures. "A photo of a sunset" → finds sunsets.

> [CLIP](https://arxiv.org/abs/2103.00020) (2021) — zero-shot image understanding from natural language

----

## How CLIP Learns: The Matching Game

Imagine a game with millions of cards:

1. Each card has a **picture** on one side and a **description** on the other
2. Shuffle all pictures and descriptions separately
3. The model must match each picture to its correct description
4. Over time, it learns what "dog" looks like, what "sunset" looks like, etc.

The magic: after training, you can ask "find me a photo of a golden retriever playing in snow" — and CLIP finds it, even though it never saw that exact description before!

----

## LLaVA: Teaching a chatbot to see

CLIP can match images and text, but can't **have a conversation** about an image.

LLaVA's approach:

- Take a language model (like Llama)
- Connect it to a vision encoder (like CLIP)
- Fine-tune on visual conversations: "What do you see?" → "A red car on a street"

> [LLaVA](https://arxiv.org/abs/2304.08485) (2023) — open-source multimodal chatbot

----

## How LLaVA Connects Eyes to Brain

LLaVA's architecture is surprisingly simple:

1. **Eyes** (Vision Encoder): CLIP looks at the image and describes what it sees as a list of numbers
2. **Bridge** (Projection Layer): A small translator converts the image numbers into the language model's "language"
3. **Brain** (Language Model): Llama takes the translated image info + your question and generates an answer

It's like having a friend who speaks Image translate for a friend who speaks English!

----

## Gemini: Born multimodal

LLaVA bolts vision onto a text model. What if the model was **built from scratch** for multiple modalities?

- **Born multimodal**: trained on text, pictures, sound, and video all at once from the very start
- Understands charts, reads handwriting, watches videos
- Not an add-on — multimodality is in its DNA

> [Gemini](https://arxiv.org/abs/2312.11805) (2023) — Google's natively multimodal model

----

## Bolt-On vs Born Multimodal

| | Bolt-On (LLaVA) | Born Multimodal (Gemini) |
|---|---|---|
| How | Add vision to existing text model | Train on all modalities from day one |
| Advantage | Cheaper, reuses existing models | Deeper cross-modal understanding |
| Limitation | Image and text are "separate brains" | Requires massive training from scratch |
| Analogy | Learning a second language as an adult | Growing up bilingual |

Both approaches have merit — bolt-on is faster to build, but born-multimodal often understands connections between images and text more naturally.

----

## ColPali: Search documents by looking at them

The old way to search inside documents:

1. Use text-reading software (OCR) to pull out the words → 2. Make a searchable list → 3. Search

ColPali skips all that:

- Feed the **page image** directly to a vision model
- No OCR needed — it reads the page visually
- Works with tables, charts, and complex layouts!

> [ColPali](https://arxiv.org/abs/2407.01449) (2024) — document retrieval without OCR

----

## More vision models

- **Pixtral** (Mistral): Handles images at any resolution — no need to resize or crop
- **Molmo** (AI2): Can **point** to specific objects in an image, not just describe them

> [Pixtral](https://arxiv.org/abs/2410.07073) (2024) | [Molmo](https://arxiv.org/abs/2409.17146) (2024)

----

## Chapter 12 Summary

| Paper | Key Idea |
|-------|----------|
| [CLIP](https://arxiv.org/abs/2103.00020) (2021) | Match images and text — zero-shot vision |
| [LLaVA](https://arxiv.org/abs/2304.08485) (2023) | Bolt vision onto a language model |
| [Gemini](https://arxiv.org/abs/2312.11805) (2023) | Natively multimodal from the ground up |
| [ColPali](https://arxiv.org/abs/2407.01449) (2024) | Search documents visually — no OCR |
| [Pixtral](https://arxiv.org/abs/2410.07073) / [Molmo](https://arxiv.org/abs/2409.17146) (2024) | Flexible resolution / fine-grained pointing |

----

## Want to Learn More?

- [The Illustrated Stable Diffusion (Jay Alammar)](https://jalammar.github.io/illustrated-stable-diffusion/) — Visual guide to how diffusion models use CLIP for text-to-image
- [LLaVA Demo](https://llava-vl.github.io/) — Try talking to an AI about images yourself
- [Gemini Technical Report](https://deepmind.google/technologies/gemini/) — Google's deep dive into multimodal AI
- [Multimodal AI Explained (IBM)](https://www.ibm.com/think/topics/multimodal-ai) — Clear introduction to multimodal models

----

## Think About It

- CLIP learns by matching images with descriptions. What happens if the descriptions on the internet are wrong or biased? How might that affect the model?
- LLaVA bolts vision onto a text model, like learning a second language as an adult. Gemini is "born" multimodal, like growing up bilingual. Which approach do you think will win in the long run?
- ColPali searches documents by "looking" at them instead of reading the text. What types of documents would this work best for? Where might it struggle?
- If an LLM could understand video as well as it understands text, what new applications would become possible?
