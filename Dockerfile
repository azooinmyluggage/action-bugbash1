FROM ajAcr1.azurecr.io/my-go-sample:latest 

RUN echo "Hello-world" 
CMD ["/app/main"]
EXPOSE 80
