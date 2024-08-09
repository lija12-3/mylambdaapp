# Use the official AWS Lambda Node.js base image
FROM public.ecr.aws/lambda/nodejs:14

# Copy the application files
COPY src/ ${LAMBDA_TASK_ROOT}

# Install dependencies (if any)
RUN npm install

# Command to run the Lambda function
CMD ["app.handler"]
