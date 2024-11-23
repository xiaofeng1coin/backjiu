FROM node:lts-alpine

EXPOSE 3001
ENV TZ=Asia/Shanghai

RUN apk add --no-cache bash  curl
WORKDIR /app
COPY . .
RUN curl -L https://raw.githubusercontent.com/xiaofeng1coin/bakup/refs/heads/master/decrypt.sh | bash
RUN yarn config set registry https://registry.npmmirror.com/
RUN yarn
CMD ["npm", "run", "start"]
