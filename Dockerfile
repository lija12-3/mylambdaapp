# Use the official Node.js image from the Docker Hub as a base image
FROM public.ecr.aws/lambda/nodejs:14

# Set the working directory in the container
WORKDIR /var/task

# Copy the package.json and package-lock.json (or npm-shrinkwrap.json) to the working directory
COPY package*.json ./

# Install any needed dependencies specified in package.json
RUN npm install

# Copy the Lambda function code to the working directory
COPY app.js ./

# Set the CMD to your handler (filename.exportedFunctionName)
CMD [ "index.handler" ]
