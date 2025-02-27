#Imagen utilizada
FROM node:current-slim

#Metadata custom
LABEL owner="Hector Montecinos"
LABEL type="node on mongo"

#Variable para directorio
ENV appdir=/usr/src/app

#directorio donde se ejecutara git clone
WORKDIR ${appdir}


#Copia paquetes necesarios para cachearlos
COPY src/package*.json .
COPY src/*.env .

#Instalacion de npm
RUN npm install --production --silent

# NPM realizado se copia el resto del proyecto
COPY src/. .

#Instruccion inicial
ENTRYPOINT [ "npm" ]

#opcion para instruccion inicial
CMD ["start"]

#puerto expuesto
EXPOSE 3000
