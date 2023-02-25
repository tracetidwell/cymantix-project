FROM python:3.10-slim AS development
# ARG COMPONENT
# ENV PATH=/root/.local/bin:$PATH
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1
# ENV PYTHONPATH "${PYTHONPATH}:/build"
# ENV CLOUD_TRACE=True

RUN mkdir /build
WORKDIR /build

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt
# RUN python -m pip install nbconvert==6.4.5
# RUN python -m pip install notebook

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8081
ENTRYPOINT jupyter notebook --ip `hostname -I` --port 8081 --no-browser --allow-root
