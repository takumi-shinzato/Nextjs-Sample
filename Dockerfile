FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係のキャッシュを利用するため、package.json を先にコピー
COPY package.json package-lock.json ./

# `docker build` のときに1回だけ実行される
RUN npm install

# ソースコードをコピー
COPY . .

# 環境変数に応じて実行するコマンドを変更
CMD ["sh", "-c", "if [ \"$APP_ENV\" = \"development\" ]; then npm run dev; else npm run build && npm run start; fi"]
