FROM python:3-onbuild
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["python"]
CMD ["stormdetector.py"]