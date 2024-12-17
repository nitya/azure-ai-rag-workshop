# Introduction

This repository contains the source and instructions guide for a workshop on building a RAG-based chat app using Azure AI Foundry. The workshop is derived from [the official 3-part tutorial](https://learn.microsoft.com/azure/ai-studio/tutorials/copilot-sdk-create-resources) and adapted to provide additional resources and suggestions for self-guided learners.

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

    ```bash
    mkdocs serve
    ```

1. Select the "View in browser" option in the pop-up dialog. _You should see this guide_.

1. Open a second VS Code terminal pane. _Use that for all further instructions_.
