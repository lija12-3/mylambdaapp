#Using the base lambda image with latest node
FROM public.ecr.aws/lambda/nodejs:20

#Pass the GITHUB_TOKEN during the docker build if there are dependencies on Bayshore libraries
ARG GITHUB_TOKEN

#Copying all files to lambda Root directory to help with the npm install and build
COPY . ${LAMBDA_TASK_ROOT}

# NPM install dependencies for the build. Should be updated based on requirements
RUN npm i npm@10.2.4 -g
RUN npm install -g typescript jest @types/node
RUN npm install
# RUN npm run lint:fix
RUN npm run build

# Copy the dependencies to the lamba root
COPY node_modules ${LAMBDA_TASK_ROOT}/
# Copy the build files from dist folder to the lambda root
COPY dist ${LAMBDA_TASK_ROOT}/

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "apigw_handler.restApiHandler"]
