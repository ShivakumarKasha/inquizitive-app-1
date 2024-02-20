FROM node:20.11.1

WORKDIR '/app'

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build 'C:\nginx\html'


