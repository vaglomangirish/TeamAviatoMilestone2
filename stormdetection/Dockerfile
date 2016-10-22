FROM python:3-onbuild
ARG APP_URL

RUN pip install Flask
RUN pip install -r requirements.txt
RUN curl -o app.tar.gz ${APP_URL}
RUN tar -zxvf app.tar.gz

EXPOSE 8000
CMD echo ls
WORKDIR  Storm_Detector

ENTRYPOINT ["python"]
CMD ["stormdetector.py"]