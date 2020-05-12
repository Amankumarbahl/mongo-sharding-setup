FROM mongo

# Create app directory
WORKDIR /usr/src/configs

EXPOSE 27017

# Install app dependencies
COPY rs0Setup.js .
COPY rs1Setup.js .
COPY rscSetup.js .
COPY populate.js .
COPY setup.sh .
COPY dbSetup.js .
COPY addFirstShard.js .
COPY addSecondShard.js .
COPY shardCollection.js .
COPY shardingStatus.js .



RUN ["chmod", "+x", "./setup.sh"]
CMD ["./setup.sh"]