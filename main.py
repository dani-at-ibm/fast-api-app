from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get('/')
def hello_world():
    return "hello world from devops.."

#if __name__ == "__main__":
#    uvicorn.run('main:app', port=8000, reload=False)
