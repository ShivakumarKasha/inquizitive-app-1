FROM node:20.11.1 as builder

WORKDIR '/app'

COPY package*.json .

COPY . .

RUN npm install

RUN npm run build

FROM nginx:latest

RUN chmod -R 755 /usr/share/nginx/html

RUN rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /app/build /usr/share/nginx/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# CMD ["npm", "run", "start"]

