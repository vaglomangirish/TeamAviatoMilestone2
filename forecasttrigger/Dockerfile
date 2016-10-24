FROM python:3-onbuild

RUN pip install -r requirements.txt
EXPOSE 42000
ENTRYPOINT ["python"]
CMD ["forecast_trigger.py"]