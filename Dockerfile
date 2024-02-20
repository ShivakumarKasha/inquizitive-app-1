FROM node:20.11.1 as builder

WORKDIR /inquizitive-app/

COPY public/ /inquizitive-app/public
COPY src/ /inquizitive-app/src
COPY package.json /inquizitive-app/

COPY . .

RUN npm install

RUN npm run build

EXPOSE 8000

CMD ["npm", "start"]

