FROM node:lts-alpine

RUN apk update && apk upgrade

WORKDIR /usr/src/app

ENV NODE_ENV production
ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json ./
RUN npm install -g npm@latest
RUN npm install
RUN npm install -g @angular/cli

COPY . ./

EXPOSE 4200

CMD ng serve --host 0.0.0.0

# RUN ng build --prod

# FROM nginx:latest-alpine

# EXPOSE 80

# COPY nginx.conf /etc/nginx/nginx.conf

# COPY --from=build /usr/src/app/dist/FileBox /usr/share/nginx/html
