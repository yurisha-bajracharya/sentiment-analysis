from transformers import pipeline
from fastapi import FastAPI, Request
import uvicorn



def sentiment_analysis(text):
    # Perform sentiment analysis on the input text
    # Return the sentiment score and label
    sentiment_pipeline = pipeline("sentiment-analysis")
    result = sentiment_pipeline(text)
    print(result)
    return result[0]["score"], result[0]["label"]


app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Welcome to Sentiment Analysis API"}

@app.post("/analyze")
async def analyze_sentiment(request: Request):
    data = await request.json()
    text = data.get("text")
    score, label = sentiment_analysis(text)
    return {"score": score, "label": label}

# if __name__ == "__main__":
#     uvicorn.run(app, host="0.0.0.", port=8000)