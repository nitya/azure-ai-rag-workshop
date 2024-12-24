# Build a RAG-based Chat App on Azure AI Foundry

This repository contains the source and instructions guide for a workshop on building a RAG-based chat app using Azure AI Foundry. The workshop is derived from [the official 3-part tutorial](https://learn.microsoft.com/azure/ai-studio/tutorials/copilot-sdk-create-resources) and adapted to provide additional resources and suggestions for self-guided learners.


## Pre-Requisites

To get the most from this lab, you will need the following:

1. An Azure subscription - [Get one for free](https://aka.ms/azure/free)
1. A GitHub account - [Get one for free](https://github.com/signup)
1. Familiarity with VS Code, Github & Azure.
1. Familiarity with Python and Jupyter Notebooks.


Check that your Azure subscription has sufficient quota to deploy the following Azure OpenAI Models: 
1. Chat: `gpt-4o-mini` 
1. Embeddings: `text-embedding-ada-002`

Check that your Azure account has the necessary permissions to make role assignments for relevant Azure AI resources. (e.g., may require a [Privileged role](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles#user-access-administrator) like Owner, User Access Admin or RBAC Admin)


## Getting Started

This repository is instrumented with a `devcontainer.json` to give you a development environment with all required dependencies pre-installed. To get started:

1. [Fork the repository](https://github.com/nitya/azure-ai-rag-workshop) to your personal profile.

1. Launch Codespaces on that fork.
    Setup may take a few minutes. Once ready, you will see a Visual Studio Code editor. 

1. Wait for the terminal prompt then launch the workshop guide with this command:

    ```bash
    mkdocs serve
    ```
    You will be prompted to view this in a browser or within VS Code. _Select the browser option to get the workshop guide in its own tab_.

1. Open a _new_ terminal window in Visual Studio Code, and use this window for executing further commands from the guide.

## Cleanup

This workshop will deploy AI models and an Azure AI Search resource that have associated costs for usage. The workshop also uses GitHub Codespaces which has a relatively generous _but finite_ quota for usage.

To minimize unexpected Azure costs or usage of your codespaces quota, please remember to do the following:

1. Delete the GitHub Codespaces instance by visiting [https://github.com/codespaces/](), selecting your specific Codespace instance, opening the dropdown menu and clicking **Delete**.
1. Delete the Resource Group for the project by visiting [https://portal.azure.com](), selecting the relevant resource group and clicking **Delete resource group** in options.

Revisit both pages after sufficient time has past for the tasks to be completed. Refresh to make sure the resources were cleaned up correctly.

---

## Troubleshooting

This section will capture any known issues in using this repo or workshop guide.
