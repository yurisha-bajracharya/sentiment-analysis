# Sentiment Analyzer API (FastAPI)

This is a FastAPI project that analyzes the sentiment of a given sentence using the default model from Huggingface: [`distilbert-base-uncased-finetuned-sst-2-english`](https://huggingface.co/distilbert-base-uncased-finetuned-sst-2-english).


---

## What It Does

Send a POST request with a sentence, and get a sentiment prediction: **positive**, **negative**, or **neutral**.

---

## How to Run Locally

### Clone the repo

```bash
git clone https://github.com/yurisha-bajracharya/sentiment-analysis
cd sentiment-analysis
```

### Install Requirements

```bash
pip install -r requirements.txt
```

### (Optional) Setup Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate    # On Windows use `venv\Scripts\activate`
```

### Run the API

```bash
uvicorn main:app --reload
```

The API will be running at: http://localhost:8000

You can visit http://localhost:8000/docs for the automatic interactive API docs.

## Run with Docker

### Build the Docker image

```bash
docker build -t sentiment-analysis .
```

### Run the Docker container
```bash
docker run -p 8000:8000 sentiment-analysis
```

