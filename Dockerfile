#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM apache/spark:v3.4.0

USER root

COPY requirements.txt /tmp/

RUN set -ex; \
    apt update; \
    apt install -y software-properties-common; \
    add-apt-repository ppa:deadsnakes/ppa; \
    apt-get update; \
    apt-get install -y python3.11 python3.11-dev python3.11-distutils python3-pip; \
    ln -sf /usr/bin/python3.11 /usr/bin/python3; \
    ln -sf /usr/bin/python3.11 /usr/bin/python; \
    rm -rf /var/lib/apt/lists/* 
    
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt