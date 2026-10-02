---
layout: post
title: "Less Context, More Signal"
date: 2026-10-02
---
![Illustration of optimized context use and estimated token-cost savings.]({{ '/assets/images/Optimized-Context-Cost.png' | relative_url }})

AI chat is easy to start. The hard part is continuing without reloading the whole past: useful details get buried, instructions get repeated, and switching tools can mean starting over. The challenge is carrying forward what matters without bringing all the noise with it.

I've been building a tool-agnostic workflow framework with **Interpretable Context Methodology (ICM)** as its foundation. ICM is a published way of organizing agent work through folders and staged context, first introduced as **Model Workspace Protocol (MWP)** in [Jake Van Clief and David McDermott's research paper](https://arxiv.org/abs/2603.16021). My framework adds a Hermes-like process model I built myself, with workflows and conventions encoded in readable Markdown. **Model Context Protocol (MCP)** lets compatible AI chat tools work with it without tying the framework to one assistant. The implementation details can wait for a later walkthrough.

The image hints at one practical upside: reusing focused context can reduce repeated input and estimated cost while giving the model a clearer working set. Less context drag can also make development more agile, leaving more room to iterate and continuously improve the end product. The numbers illustrate one workflow, not a promise of the same savings or performance for every model and task.

Less context isn't the goal by itself. Keeping what matters, with less drag, is. I'll share how the framework works in a future post.