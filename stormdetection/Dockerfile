FROM python:3-onbuild

RUN pip install -r requirements.txt
EXPOSE 9000
ENTRYPOINT ["python"]
CMD ["stormdetector.py"]