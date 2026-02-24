# LLM Must-Read: Top 100 Papers

> A curated reading list organized by topic — from foundational architecture to cutting-edge research.
> Each paper includes a one-line summary and arXiv link.
> Designed for engineers who want a systematic understanding of the LLM landscape.

---

## 1. Transformer Foundations (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 1 | [Attention Is All You Need](https://arxiv.org/abs/1706.03762) | 2017 | The Transformer architecture — self-attention, multi-head attention, positional encoding |
| 2 | [BERT: Pre-training of Deep Bidirectional Transformers](https://arxiv.org/abs/1810.04805) | 2018 | Encoder-only architecture, masked language modeling, foundation of NLU |
| 3 | [Improving Language Understanding by Generative Pre-Training (GPT-1)](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf) | 2018 | Decoder-only architecture + fine-tuning paradigm |
| 4 | [T5: Exploring the Limits of Transfer Learning](https://arxiv.org/abs/1910.10683) | 2019 | Unified text-to-text framework, systematic comparison of pretraining strategies |
| 5 | [RoBERTa: A Robustly Optimized BERT Pretraining Approach](https://arxiv.org/abs/1907.11692) | 2019 | Training recipe matters more than architecture changes |

---

## 2. The GPT Lineage (6 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 6 | [GPT-2: Language Models are Unsupervised Multitask Learners](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf) | 2019 | Zero-shot capabilities, scaling decoder-only models |
| 7 | [GPT-3: Language Models are Few-Shot Learners](https://arxiv.org/abs/2005.14165) | 2020 | 175B parameters, established In-Context Learning (ICL) |
| 8 | [Codex: Evaluating LLMs Trained on Code](https://arxiv.org/abs/2107.03374) | 2021 | Code generation capabilities, HumanEval benchmark |
| 9 | [InstructGPT: Training LMs to Follow Instructions with Human Feedback](https://arxiv.org/abs/2203.02155) | 2022 | First large-scale application of RLHF, aligning with human preferences |
| 10 | [GPT-4 Technical Report](https://arxiv.org/abs/2303.08774) | 2023 | Multimodal capabilities, major improvements in reasoning and safety |
| 11 | [o1/o3: Deliberative Alignment](https://openai.com/index/deliberative-alignment/) | 2024 | Inference-time compute, chain-of-thought reasoning models |

---

## 3. Scaling Laws & Training Theory (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 12 | [Scaling Laws for Neural Language Models (Kaplan)](https://arxiv.org/abs/2001.08361) | 2020 | Power-law relationship between parameters, data, and compute |
| 13 | [Chinchilla: Training Compute-Optimal LLMs](https://arxiv.org/abs/2203.15556) | 2022 | Corrected Kaplan — data should scale proportionally with parameters |
| 14 | [Emergent Abilities of Large Language Models](https://arxiv.org/abs/2206.07682) | 2022 | Discovery and definition of emergent capabilities |
| 15 | [Are Emergent Abilities a Mirage?](https://arxiv.org/abs/2304.15004) | 2023 | Challenges the emergence narrative — metric choice matters |
| 16 | [Scaling Data-Constrained Language Models](https://arxiv.org/abs/2305.16264) | 2023 | Scaling strategies when data is the bottleneck |

---

## 4. Open-Source LLM Milestones (10 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 17 | [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971) | 2023 | Kicked off the open-source LLM era, 7B–65B trained on public data |
| 18 | [Llama 2](https://arxiv.org/abs/2307.09288) | 2023 | Open-source + RLHF with detailed safety alignment process |
| 19 | [Llama 3](https://arxiv.org/abs/2407.21783) | 2024 | 405B parameters, comprehensive training details made public |
| 20 | [Mistral 7B](https://arxiv.org/abs/2310.06825) | 2023 | Sliding Window Attention + GQA, high efficiency at small scale |
| 21 | [Mixtral of Experts](https://arxiv.org/abs/2401.04088) | 2024 | Sparse MoE architecture, 8×7B expert network |
| 22 | [DeepSeek-V2](https://arxiv.org/abs/2405.04434) | 2024 | Multi-head Latent Attention (MLA), efficient inference |
| 23 | [DeepSeek-V3](https://arxiv.org/abs/2412.19437) | 2024 | 671B MoE, FP8 training, extreme cost-efficiency |
| 24 | [DeepSeek-R1](https://arxiv.org/abs/2501.12948) | 2025 | Pure RL training produces reasoning ability, the "Aha moment" |
| 25 | [Qwen3 Technical Report](https://arxiv.org/abs/2505.09388) | 2025 | Unified thinking/non-thinking modes, multilingual + MoE |
| 26 | [Gemma 2](https://arxiv.org/abs/2408.00118) | 2024 | Google's open-source series, knowledge distillation + logit soft-capping |

---

## 5. Efficient Attention & Architecture Innovations (7 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 27 | [FlashAttention: Fast and Memory-Efficient Exact Attention](https://arxiv.org/abs/2205.14135) | 2022 | IO-aware exact attention, standard for training and inference |
| 28 | [FlashAttention-2](https://arxiv.org/abs/2307.08691) | 2023 | Further optimized work partitioning and parallelism |
| 29 | [GQA: Training Generalized Multi-Query Transformer Models](https://arxiv.org/abs/2305.13245) | 2023 | Grouped-Query Attention, KV cache efficiency |
| 30 | [RoPE: Rotary Position Embedding](https://arxiv.org/abs/2104.09864) | 2021 | Rotary position encoding, standard in virtually all modern LLMs |
| 31 | [Mamba: Linear-Time Sequence Modeling with Selective State Spaces](https://arxiv.org/abs/2312.00752) | 2023 | Linear-complexity SSM architecture, challenging Transformer dominance |
| 32 | [Ring Attention](https://arxiv.org/abs/2310.01889) | 2023 | Distributed long-sequence training, breaking single-GPU memory limits |
| 33 | [ModernBERT](https://arxiv.org/abs/2412.13663) | 2024 | Modernized BERT variant with longer context and faster speed |

---

## 6. Alignment & Safety (RLHF / RLAIF) (7 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 34 | [Training a Helpful and Harmless Assistant (Anthropic)](https://arxiv.org/abs/2204.05862) | 2022 | RLHF methodology, balancing helpfulness and harmlessness |
| 35 | [Constitutional AI (CAI)](https://arxiv.org/abs/2212.08073) | 2022 | AI feedback replaces some human annotation, principle-driven alignment |
| 36 | [DPO: Direct Preference Optimization](https://arxiv.org/abs/2305.18290) | 2023 | Preference optimization without a reward model, simplified RLHF |
| 37 | [GRPO: Group Relative Policy Optimization](https://arxiv.org/abs/2402.03300) | 2024 | Introduced in DeepSeek-Math, core algorithm behind R1 training |
| 38 | [Self-Play Fine-Tuning (SPIN)](https://arxiv.org/abs/2401.01335) | 2024 | Self-play converts weak models to strong models |
| 39 | [DAPO: Decoupled Clip and Dynamic Sampling PO](https://arxiv.org/abs/2503.14476) | 2025 | Four key techniques for large-scale RL training, open-source R1-level reproduction |
| 40 | [Let's Verify Step by Step](https://arxiv.org/abs/2305.20050) | 2023 | Process Reward Models (PRM) — process supervision beats outcome supervision |

---

## 7. Prompting & Reasoning Strategies (8 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 41 | [Chain-of-Thought Prompting](https://arxiv.org/abs/2201.11903) | 2022 | Few-shot examples that guide step-by-step reasoning |
| 42 | [Zero-Shot CoT: Let's Think Step by Step](https://arxiv.org/abs/2205.11916) | 2022 | A single sentence triggers reasoning without examples |
| 43 | [Tree of Thoughts](https://arxiv.org/abs/2305.10601) | 2023 | Search + backtracking for structured reasoning |
| 44 | [Self-Consistency](https://arxiv.org/abs/2203.11171) | 2022 | Sample multiple chains, majority-vote for better accuracy |
| 45 | [ReAct: Synergizing Reasoning and Acting](https://arxiv.org/abs/2210.03629) | 2022 | Interleaving reasoning and tool calls — the cornerstone of Agents |
| 46 | [The Prompt Report: A Systematic Survey](https://arxiv.org/abs/2406.06608) | 2024 | Comprehensive survey of prompting techniques |
| 47 | [Scaling LLM Test-Time Compute](https://arxiv.org/abs/2408.03314) | 2024 | Optimizing compute allocation at inference time, theoretical basis for o1 |
| 48 | [STaR: Self-Taught Reasoner](https://arxiv.org/abs/2203.14465) | 2022 | Bootstrapped reasoning improvement, a core method at xAI |

---

## 8. Parameter-Efficient Fine-Tuning (6 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 49 | [LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685) | 2021 | Low-rank matrix decomposition for fine-tuning, industry standard |
| 50 | [QLoRA: Efficient Finetuning of Quantized LLMs](https://arxiv.org/abs/2305.14314) | 2023 | 4-bit quantization + LoRA, fine-tune 65B models on a single GPU |
| 51 | [DoRA: Weight-Decomposed Low-Rank Adaptation](https://arxiv.org/abs/2402.09353) | 2024 | Decomposes weight magnitude and direction, outperforms LoRA |
| 52 | [Prefix-Tuning](https://arxiv.org/abs/2101.00190) | 2021 | Train only continuous prefix vectors |
| 53 | [Scaling Down to Scale Up: A Guide to PEFT](https://arxiv.org/abs/2303.15647) | 2022 | Survey of parameter-efficient fine-tuning methods |
| 54 | [LLaMA-Factory: Unified Efficient Fine-Tuning of 100+ LMs](https://arxiv.org/abs/2403.13372) | 2024 | Unified fine-tuning framework supporting multiple PEFT methods |

---

## 9. Retrieval-Augmented Generation (7 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 55 | [RAG: Retrieval-Augmented Generation](https://arxiv.org/abs/2005.11401) | 2020 | Coined the RAG term — retrieval + generation paradigm |
| 56 | [MTEB: Massive Text Embedding Benchmark](https://arxiv.org/abs/2210.07316) | 2022 | De-facto embedding model evaluation standard |
| 57 | [ColBERT: Efficient and Effective Passage Search](https://arxiv.org/abs/2004.12832) | 2020 | Late interaction retrieval — balancing precision and efficiency |
| 58 | [GraphRAG](https://arxiv.org/abs/2404.16130) | 2024 | Knowledge graphs + RAG, open-sourced by Microsoft |
| 59 | [RAGAS: Automated Evaluation of RAG](https://arxiv.org/abs/2309.15217) | 2023 | RAG system evaluation framework |
| 60 | [Self-RAG: Learning to Retrieve, Generate, and Critique](https://arxiv.org/abs/2310.11511) | 2023 | Model decides when to retrieve — on-demand RAG |
| 61 | [Extrinsic Hallucinations in LLMs (Lilian Weng survey)](https://lilianweng.github.io/posts/2024-07-07-hallucination/) | 2024 | Causes and evaluation of hallucination |

---

## 10. Agents & Tool Use (7 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 62 | [Toolformer: LMs Can Teach Themselves to Use Tools](https://arxiv.org/abs/2302.04761) | 2023 | Self-supervised tool-calling acquisition |
| 63 | [Voyager: An Open-Ended Embodied Agent with LLMs](https://arxiv.org/abs/2305.16291) | 2023 | Cognitive architecture: curriculum + skill library + sandbox |
| 64 | [MemGPT: Towards LLMs as Operating Systems](https://arxiv.org/abs/2310.08560) | 2023 | Virtual-memory-style long-term memory management |
| 65 | [SWE-Bench](https://arxiv.org/abs/2310.06770) | 2023 | Real GitHub issue resolution benchmark, the agent eval standard |
| 66 | [SWE-Agent](https://arxiv.org/abs/2405.15793) | 2024 | Agent-Computer Interface design, top SWE-Bench solution |
| 67 | [Anthropic: Building Effective Agents](https://www.anthropic.com/research/building-effective-agents) | 2024 | Practical agent patterns: chaining, routing, parallelization, orchestration |
| 68 | [Generative Agents: Interactive Simulacra (Smallville)](https://arxiv.org/abs/2304.03442) | 2023 | 25 AI agents simulating a town — memory + reflection + planning |

---

## 11. Code Generation (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 69 | [StarCoder: A State-of-the-Art LLM for Code](https://arxiv.org/abs/2305.06161) | 2023 | Open-source code model, The Stack dataset |
| 70 | [DeepSeek-Coder](https://arxiv.org/abs/2401.14196) | 2024 | Repo-level code completion, fill-in-the-middle training |
| 71 | [AlphaCode](https://arxiv.org/abs/2203.07814) | 2022 | Competition-level code generation, massive sampling + filtering |
| 72 | [Qwen2.5-Coder](https://arxiv.org/abs/2409.12186) | 2024 | Multilingual code model, strong completion and repair |
| 73 | [Flow Engineering (AlphaCodeium)](https://arxiv.org/abs/2401.08500) | 2024 | Test-driven iterative code generation pipeline |

---

## 12. Multimodal Models (6 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 74 | [CLIP: Learning Transferable Visual Models from NL Supervision](https://arxiv.org/abs/2103.00020) | 2021 | Contrastive image-text learning, zero-shot visual classification |
| 75 | [LLaVA: Visual Instruction Tuning](https://arxiv.org/abs/2304.08485) | 2023 | Vision + language instruction fine-tuning, open-source multimodal LLM |
| 76 | [Gemini 1.0: A Family of Highly Capable Multimodal Models](https://arxiv.org/abs/2312.11805) | 2023 | Natively multimodal training — audio, image, video, text |
| 77 | [ColPali: Efficient Document Retrieval with Vision Language Models](https://arxiv.org/abs/2407.01449) | 2024 | Visual document retrieval without OCR pipelines |
| 78 | [Pixtral](https://arxiv.org/abs/2410.07073) | 2024 | Mistral's multimodal extension, variable-resolution visual encoding |
| 79 | [Molmo](https://arxiv.org/abs/2409.17146) | 2024 | AI2's open multimodal model with fine-grained pointing |

---

## 13. Long Context (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 80 | [ALiBi: Attention with Linear Biases](https://arxiv.org/abs/2108.12409) | 2021 | Linear biases replace positional encoding, length extrapolation |
| 81 | [YaRN: Efficient Context Window Extension](https://arxiv.org/abs/2309.00071) | 2023 | RoPE frequency scaling to extend context windows |
| 82 | [LongBench v2](https://arxiv.org/abs/2412.15204) | 2024 | Long-context understanding evaluation |
| 83 | [RAG vs Long Context](https://arxiv.org/abs/2407.16833) | 2024 | Empirical comparison of RAG versus long context |
| 84 | [MRCR: Multi-Round Context Retrieval](https://arxiv.org/abs/2409.12640) | 2024 | Long-context evaluation adopted by OpenAI |

---

## 14. Reasoning Models (6 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 85 | [Towards Large Reasoning Models: A Survey](https://arxiv.org/abs/2501.09686) | 2025 | Comprehensive survey of reasoning LLMs |
| 86 | [Reasoning Language Models: A Blueprint](https://arxiv.org/abs/2501.11223) | 2025 | Blueprint for building reasoning models |
| 87 | [s1: Simple Test-Time Scaling](https://arxiv.org/abs/2501.19393) | 2025 | Low-cost reproduction of test-time scaling |
| 88 | [Kimi k1.5: Scaling RL with LLMs](https://arxiv.org/abs/2501.12599) | 2025 | Novel RL methods for training reasoning capabilities |
| 89 | [LIMO: Less is More for Reasoning](https://arxiv.org/abs/2502.03387) | 2025 | Minimal examples elicit strong reasoning — the LIMO Hypothesis |
| 90 | [Demystifying Long Chain-of-Thought Reasoning](https://arxiv.org/abs/2502.03373) | 2025 | In-depth analysis of long chain-of-thought behavior |

---

## 15. Quantization & Inference Optimization (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 91 | [GPTQ: Accurate Post-Training Quantization](https://arxiv.org/abs/2210.17323) | 2022 | Layer-wise quantization to 3–4 bit with minimal accuracy loss |
| 92 | [AWQ: Activation-aware Weight Quantization](https://arxiv.org/abs/2306.00978) | 2023 | Protects salient weights during quantization |
| 93 | [vLLM: PagedAttention for LLM Serving](https://arxiv.org/abs/2309.06180) | 2023 | Paged KV cache management, the inference serving standard |
| 94 | [Speculative Decoding](https://arxiv.org/abs/2211.17192) | 2022 | Draft with small model + verify with large model for faster inference |
| 95 | [Medusa: Simple LLM Inference Acceleration](https://arxiv.org/abs/2401.10774) | 2024 | Multi-head prediction for parallel decoding |

---

## 16. Data Engineering & Evaluation (5 papers)

| # | Paper | Year | Key Takeaway |
|---|-------|------|--------------|
| 96 | [FineWeb: Decanting the Web for the Finest Text Data at Scale](https://arxiv.org/abs/2406.17557) | 2024 | 15T token open dataset, data cleaning pipeline |
| 97 | [MMLU: Measuring Massive Multitask Language Understanding](https://arxiv.org/abs/2009.03300) | 2020 | 57-subject knowledge evaluation benchmark |
| 98 | [GPQA: A Graduate-Level Google-Proof QA Benchmark](https://arxiv.org/abs/2311.12022) | 2023 | Expert-level Q&A for graduate-level subjects |
| 99 | [IFEval: Instruction-Following Evaluation](https://arxiv.org/abs/2311.07911) | 2023 | Instruction-following capability evaluation |
| 100 | [ARC-AGI Challenge](https://arxiv.org/abs/1911.01547) | 2019 | Abstract reasoning "IQ test" — still unsolved |

---

## Suggested Reading Order

**If you're short on time**, prioritize in this order:

### Tier 1 — Core 5 (Understand LLM fundamentals)
`#1` Attention → `#7` GPT-3 → `#41` Chain-of-Thought → `#49` LoRA → `#55` RAG

### Tier 2 — Expand 10 (Understand the current ecosystem)
`#12` Scaling Laws → `#17` LLaMA → `#24` DeepSeek-R1 → `#27` FlashAttention → `#34` RLHF → `#36` DPO → `#45` ReAct → `#65` SWE-Bench → `#74` CLIP → `#93` vLLM

### Tier 3 — Frontier 10 (2025 cutting edge)
`#23` DeepSeek-V3 → `#24` DeepSeek-R1 → `#25` Qwen3 → `#31` Mamba → `#39` DAPO → `#47` Test-Time Compute → `#85`–`#90` Reasoning Models

---

## References

- [Sebastian Raschka's LLM Reading List](https://sebastianraschka.com/blog/2023/llm-reading-list.html)
- [Latent Space 2025 AI Engineer Reading List](https://www.latent.space/p/2025-papers)
- [DAIR.AI Weekly Top LLM Papers](https://github.com/dair-ai/ML-Papers-of-the-Week)
- [Hugging Face Trending Papers](https://huggingface.co/papers/trending)
