import json

import fastapi
import pydantic
from fastapi import Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from .shared import globals

router = fastapi.APIRouter()
templates = Jinja2Templates(directory="api/templates")


class Message(pydantic.BaseModel):
    content: str
    role: str = "user"


class ChatRequest(pydantic.BaseModel):
    messages: list[Message]


@router.get("/", response_class=HTMLResponse)
async def index(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


@router.post("/chat/stream")
async def chat_stream_handler(
    chat_request: ChatRequest,
) -> fastapi.responses.StreamingResponse:
    chat_client = globals["chat"]
    if chat_client is None:
        raise Exception("Chat client not initialized")

    async def response_stream():
        messages = [{"role": message.role, "content": message.content} for message in chat_request.messages]
        model_deployment_name = globals["chat_model"]
        prompt_messages = globals["prompt"].create_messages()
        chat_coroutine = await chat_client.complete(
            model=model_deployment_name, messages=prompt_messages + messages, stream=True
        )
        async for event in chat_coroutine:
            if event.choices:
                first_choice = event.choices[0]
                yield (
                    json.dumps(
                        {
                            "delta": {
                                "content": first_choice.delta.content,
                                "role": first_choice.delta.role,
                            }
                        },
                        ensure_ascii=False,
                    )
                    + "\n"
                )

    return fastapi.responses.StreamingResponse(response_stream())
