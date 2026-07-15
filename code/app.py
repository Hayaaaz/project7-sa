from fastapi import FastAPI
import requests
import uvicorn

app = FastAPI()

OLLAMA_URL = "http://ollama:11434/v1/chat/completions"

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/v1/chat/completions")
def completions(payload: dict):
    r = requests.post(OLLAMA_URL, json=payload)
    return r.json()

if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8000)
