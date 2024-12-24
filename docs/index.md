# Introduction

## Azure AI Foundry Architecture

The [Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/concepts/architecture) provides a **unified experience for both AI developers and data scientists** to build, evaluate, and deploy AI models through a **web portal, SDK, or CLI**. Azure AI Foundry is built on capabilities and services provided by other Azure services. The figure below provides the big picture of the core components and capabilities provide to support end-to-end development of enterprise-grade generative AI solutions.

![Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/media/concepts/ai-studio-architecture.png)

---

## RAG Chat App Workshops

This repository contains the source and instructions guide for a workshop that takes you step-by-step through the process of building a RAG-based chat app using Azure AI Foundry. 

!!! warning "WORKSHOP UPDATE: JAN 2025<br/> The DEC 2024 workshop followed a hybrid approach with setup using Azure AI Portal and ideation/evaluation using Azure AI SDK. That path can now be found under the _1 Hybrid Workshop_ menu option. Look  for updates to a _2 Portal-First_ option that provides an alternative path which prioritizes using Portal features."

The hybrid workshop is derived from [the official 3-part tutorial](https://learn.microsoft.com/azure/ai-studio/tutorials/copilot-sdk-create-resources) and adapted to provide additional resources and suggestions for self-guided learners. The portal-first option is being assembled from various how-to and tutorial options in the official docs, for comparison.

---

## Pre-Requisites

To get the most from this lab, you will need the following:

1. An Azure subscription - [Get one for free](https://aka.ms/azure/free)
1. A GitHub account - [Get one for free](https://github.com/signup)
1. Familiarity with VS Code, Github & Azure.
1. Familiarity with Python and Jupyter Notebooks.


**Verify:** Your Azure subscription has sufficient quota to deploy these models:

1. Chat: `gpt-4o-mini` 
1. Embeddings: `text-embedding-ada-002`

**Verify:** Your Azure account is authorized to make role assignments for Azure AI resources. This may involve having a [Privileged role](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles#user-access-administrator) like Owner, User Access Admin or RBAC Admin.

---

## Getting Started

This repository is instrumented with a `devcontainer.json` to give you a development environment with all required dependencies pre-installed. To get started:

1. [Fork the repository](https://github.com/nitya/azure-ai-rag-workshop) to your personal profile. _Visit your fork in the browser_.

1. Launch Codespaces on that fork. _Setup will take a few minutes_.
1. Type this command into the VS Code terminal when ready. _A dialog will pop up_.

    ```bash title=""
    mkdocs serve
    ```

1. Select the "View in browser" option in the pop-up dialog. _You should see this guide_.

1. Open a second VS Code terminal pane. _Use that for all further instructions_.
