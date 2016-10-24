FROM python:3-onbuild

RUN pip install -r requirements.txt
EXPOSE 41000
ENTRYPOINT ["python"]
CMD ["stormclustering.py"]