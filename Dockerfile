FROM continuumio/conda-ci-linux-64-python3.8

RUN sudo mkdir /usr/share/man/man1
WORKDIR /home/test_user

RUN sudo apt update && sudo apt install -y git openjdk-11-jre && git clone https://github.com/hcji/PyFingerprint/ --depth=1

RUN pip install git+https://github.com/hcji/PyFingerprint.git
RUN pip install git+https://github.com/EBjerrum/molvecgen
RUN pip install rdkit
RUN pip install tensorflow
RUN sudo chown -R test_user /opt
RUN conda install -c conda-forge/label/main openbabel

RUN sudo apt-get install swig -y
RUN ln -s /home/test_user/.local/lib/python3.8/site-packages/PyFingerprint/Heteroencoder/heteroencoder_model.zip /home/test_user/.local/lib/python3.8/site-packages/PyFingerprint/Heteroencoder/heteroencoder_model.pkl.zip

#CMD ["python", "PyFingerprint/Example/test_fingerprint.py"]
#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
