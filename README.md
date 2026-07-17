# Project 7 — Ship a Model in a Box
## This project runs a FastAPI app and an Ollama model together using Docker Compose.
---

***How to run it***

-Code

*git clone https://github.com/Hayaaaz/project7-sa*
*cd project7-sa*
*docker compose up -d*

`This starts two containers:`

ollama (the model server)

app (the FastAPI API)

***Test the API***

-Code

*curl -X POST http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model":"llama3.2:1b","messages":[{"role":"user","content":"Hello"}]}'*
  
You should get a normal model reply.

***Smoke test***

-Code

*cd code*

*bash smoke_test.sh*

`This checks:`

the /health endpoint

a real model inference

***Model persistence***
The model is stored in a Docker volume, so it does not re-download when containers restart.
