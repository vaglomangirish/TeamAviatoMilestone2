FROM python:3-onbuild

RUN pip install -r requirements.txt
EXPOSE 9500
ENTRYPOINT ["python"]
CMD ["stormdetector.py"]
