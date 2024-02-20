# FROM node:20.11.1 as builder

# WORKDIR /inquizitive-app/

# COPY public/ /inquizitive-app/public
# COPY src/ /inquizitive-app/src
# COPY package.json /inquizitive-app/

# COPY . .

# RUN npm install

# RUN npm run build

# EXPOSE 8000

# CMD ["npm", "start"]

FROM node:20.11.1 as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
#prod environment 
FROM nginx:1.21
COPY --from=build /app/build /usr/share/nginx/html/
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 3001

CMD ["nginx","-g", "daemon off;"]



