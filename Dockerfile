FROM infrastructuregr/helmfile

ENV AWSCLI_VER 1.18.0

RUN pip install awscli==$AWSCLI_VER

ADD https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator /usr/bin/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator

RUN aws --version \
    && rm -f /var/cache/apk/*


ENTRYPOINT ["/bin/bash","-c"]
