from llama_cpp import Llama

# プロンプト
initial_prompt = "View Hello World in html."

# モデルの準備
llm = Llama(model_path="./llama-2-7b-chat.ggmlv3.q8_0.bin")

result = llm(
    initial_prompt,
    max_tokens=1000,
    echo=True,
)

print(result['choices'][0]['text'])
