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

## LLaVA: Teaching a chatbot to see

CLIP can match images and text, but can't **have a conversation** about an image.

LLaVA's approach:

- Take a language model (like Llama)
- Connect it to a vision encoder (like CLIP)
- Fine-tune on visual conversations: "What do you see?" → "A red car on a street"

> [LLaVA](https://arxiv.org/abs/2304.08485) (2023) — open-source multimodal chatbot

----

## Gemini: Born multimodal

LLaVA bolts vision onto a text model. What if the model was **built from scratch** for multiple modalities?

- **Born multimodal**: trained on text, pictures, sound, and video all at once from the very start
- Understands charts, reads handwriting, watches videos
- Not an add-on — multimodality is in its DNA

> [Gemini](https://arxiv.org/abs/2312.11805) (2023) — Google's natively multimodal model

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
