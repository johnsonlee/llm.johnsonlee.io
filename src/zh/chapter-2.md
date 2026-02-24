<!-- .slide: class="center" -->

## 2. GPT 家族

*如果给大语言模型喂更多数据、加更多“脑细胞”，会发生什么？*

----

## 会预测下一个词的模型……

前面我们知道了 GPT-1 是靠“猜下一个词”来学语言的。

不过 GPT-1 体量很小，每做一个新任务都得单独教它。

> 那如果把大语言模型做得 **大得多** 呢？它能不能自己就学会做各种任务？

----

## GPT-2：不教就会！

研究人员把参数量拉到了 **15 亿** ，结果发生了意想不到的事：

- 没有针对任何特定任务做训练，GPT-2 居然就能翻译、写摘要、回答问题
- 只要给它一个好的 **提示词** ，不需要任何示例就能动手干活

这种“没学过就能做”的能力叫做 **零样本 (Zero-Shot)** 学习。

> [GPT-2](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf)（2019）— 语言模型天生就是多面手

----

## GPT-3：看几个例子就够了

如果继续做大——大到 **1750 亿** 参数呢？

- 在提示词里给它 **几个例子** ，它就能学会新任务
- “英译法：sea otter → loutre de mer, cheese →” → “fromage”
- 不用重新训练，给个模式它就能举一反三

这叫 **少样本学习 (Few-Shot Learning)** ，也叫 **上下文学习 (In-Context Learning)** 。

> [GPT-3](https://arxiv.org/abs/2005.14165)（2020）— 用规模证明：大力真能出奇迹

----

## 能不能写代码？

GPT-3 从文本中学会了语言，那如果拿 **代码** 来训练呢？

- Codex 在数百万个 GitHub 仓库上做了训练
- 你用一句话描述需求，它就能写出可运行的程序
- “写一个 Python 函数来排序列表” → 直接给你代码！

它后来成了 GitHub Copilot 背后的引擎。

> [Codex](https://arxiv.org/abs/2107.03374)（2021）— 把自然语言变成可运行的程序

----

## 但是，问题来了

GPT-3 虽然强大，却有不少毛病：

- 有时候一本正经地胡说八道
- 偶尔会输出不友好甚至有害的内容
- 它只是在“预测最可能的下一个词”，并不是在 **理解你的意图**

> 怎么才能让它真正 **听话** 、真正 **有用** 呢？

----

## InstructGPT：跟人类学规矩

办法是让 **人类来当老师** ，给大语言模型的回答打分！

1. 先由人类撰写一批优质回答作为示范
2. 模型学习这些示范
3. 让模型同时给出多个答案，人类给这些答案 **排出好坏**
4. 模型学着去讨好人类的偏好

这套方法叫 **RLHF** （基于人类反馈的强化学习），正是后来 ChatGPT 的基石。

> [InstructGPT](https://arxiv.org/abs/2203.02155)（2022）— ChatGPT 的技术基础

----

## GPT-4：不只会读文字了

要是大语言模型还能 **看懂图片** 呢？

- GPT-4 能理解照片、图表、示意图
- 推理和复杂任务上的表现大幅提升
- 安全性也显著增强，更不容易产生有害内容

> [GPT-4](https://arxiv.org/abs/2303.08774)（2023）— 文字+视觉，迈入多模态时代

----

## o1：想好了再回答

做难题的时候，你是不是也得 **先在脑子里想清楚** 再动笔？

- 之前的模型想都不想就给答案，经常出错
- o1 会在回答之前多花一些 **思考时间** ，一步一步推演
- 就像考试时先打草稿再写答案，而不是直接猜

> [o1/o3: Deliberative Alignment](https://openai.com/index/deliberative-alignment/)（2024）— 先想后答的推理模型

----

## 第 2 章总结

| 论文 | 核心思想 |
|------|----------|
| [GPT-2](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf)（2019） | 模型做大 → 不教就会 |
| [GPT-3](https://arxiv.org/abs/2005.14165)（2020） | 1750 亿参数 → 看几个例子就能学 |
| [Codex](https://arxiv.org/abs/2107.03374)（2021） | 用代码训练 → 能写程序 |
| [InstructGPT](https://arxiv.org/abs/2203.02155)（2022） | 人类打分 → 学会听指令 (RLHF) |
| [GPT-4](https://arxiv.org/abs/2303.08774)（2023） | 多模态 — 文字 + 图片都懂 |
| [o1/o3](https://openai.com/index/deliberative-alignment/)（2024） | 想好了再回答 |
