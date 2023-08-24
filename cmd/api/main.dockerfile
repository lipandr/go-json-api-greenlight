FROM golang:1.16-alpine
LABEL version="1.0.0"
LABEL name="go-json-api-greenlight"
WORKDIR /app
#COPY go.mod go.sum ./
#RUN go mod download
#COPY . .
#RUN go build -o greenlight ./cmd/api
COPY ./bin/greenlightApp .
EXPOSE 4000
CMD ["./greenlightApp"]
