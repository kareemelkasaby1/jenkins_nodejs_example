FROM node:12
COPY nodeapp /nodeapp
WORKDIR /nodeapp
RUN npm install
RUN echo "kaaaaaareeeeeeeeeeeeeeem"
CMD ["node", "/nodeapp/app.js"]