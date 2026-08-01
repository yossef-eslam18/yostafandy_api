# استخدام Node 20 بناءً على متطلبات Strapi
FROM node:20-alpine

# تثبيت أدوات البناء الضرورية (Python, make, g++)
RUN apk add --no-stdc++ --no-cache python3 make g++ gcc

# تحديد مجلد العمل
WORKDIR /opt/app

# نسخ ملفات الحزم وتثبيتها
COPY package.json package-lock.json ./
RUN npm ci

# نسخ باقي ملفات المشروع
COPY . .

# بناء لوحة تحكم Strapi
ENV NODE_ENV=production
RUN npm run build

# تحديد المنفذ
EXPOSE 1337

# تشغيل المشروع
CMD ["npm", "run", "start"]