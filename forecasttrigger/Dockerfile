FROM python:3-onbuild
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 32000
ENTRYPOINT ["python"]
CMD ["forecast_trigger.py"]