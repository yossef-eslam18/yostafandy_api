FROM node:20-alpine

# تثبيت أدوات البناء الضرورية
RUN apk add --no-cache python3 make g++ gcc

WORKDIR /opt/app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV NODE_ENV=production

# زيادة حد ذاكرة Node.js لمنع Out of Memory أثناء الـ build
ENV NODE_OPTIONS="--max-old-space-size=2048"

# بناء لوحة تحكم Strapi
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]