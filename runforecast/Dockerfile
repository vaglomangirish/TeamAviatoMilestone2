FROM python:3-onbuild

RUN pip install -r requirements.txt
EXPOSE 9050
ENTRYPOINT ["python"]
CMD ["runforecast.py"]