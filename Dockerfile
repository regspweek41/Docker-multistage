FROM node:14-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:14-slim AS production
WORKDIR /app
COPY --from=base /app/build .
EXPOSE 3000
CMD ["npm", "start"]

# FROM node:14-alpine AS base
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# EXPOSE 3000
# CMD ["npm", "start"]