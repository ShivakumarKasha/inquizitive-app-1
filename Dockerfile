FROM node:20.11.1 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest

RUN rm -rf /etc/nginx/conf.d/default.conf

# COPY nginx.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /app/build /usr/share/nginx/html

RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# CMD ["npm", "run", "start"]

