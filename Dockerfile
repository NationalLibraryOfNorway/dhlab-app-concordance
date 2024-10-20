# set base image (host OS)
FROM python:3.12-slim

# set the working directory in the container
WORKDIR /code

ENV PORT=8501
ENV BASE_URL_PATH="/konkordans"

# copy requirements
COPY requirements.txt /code

# install dependencies
RUN pip install -r requirements.txt

# copy working files to the working directory
COPY . /code

# command to run on container start
CMD streamlit run conc.py --browser.gatherUsageStats=False --server.port $PORT --server.baseUrlPath $BASE_URL_PATH
