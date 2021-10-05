### STAGE 1: Build ###
FROM node:alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:alpine
EXPOSE 80
COPY --from=0 /usr/src/app/dist /usr/share/nginx/html
