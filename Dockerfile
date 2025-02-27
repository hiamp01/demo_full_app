#Imagen utilizada
FROM node:current-slim

#Metadata custom
LABEL owner="Hector Montecinos"
LABEL type="node on mongo"

#Variable para directorio
ENV appdir=/usr/src/app

#directorio donde se ejecutara git clone
WORKDIR ${appdir}


# For Docker layer caching do this BEFORE copying in rest of app
COPY src/package*.json .
COPY src/*.env .
RUN npm install --production --silent

# NPM is done, now copy in the rest of the project to the workdir
COPY src/. .

#Compilacion
#RUN npm install

#Instruccion inicial
ENTRYPOINT [ "npm" ]

#opcion para instruccion inicial
CMD ["start"]

#puerto expuesto
EXPOSE 3000
