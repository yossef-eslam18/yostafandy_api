FROM node:20-alpine

# تثبيت أدوات البناء الضرورية بدون خيار no-stdc++
RUN apk add --no-cache python3 make g++ gcc

WORKDIR /opt/app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV NODE_ENV=production
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]