FROM photon:5.0

# set argument defaults
ARG OS_ARCH="amd64"
ARG USER=vlabs
ARG USER_ID=1000
ARG GROUP=users
ARG GROUP_ID=100
#ARG LABEL_PREFIX=com.vmware.eocto

# add metadata via labels
#LABEL ${LABEL_PREFIX}.version="0.0.1"
#LABEL ${LABEL_PREFIX}.git.repo="git@gitlab.eng.vmware.com:sydney/commonpool/containers/terraform.git"
#LABEL ${LABEL_PREFIX}.git.commit="DEADBEEF"
#LABEL ${LABEL_PREFIX}.maintainer.name="Richard Croft"
#LABEL ${LABEL_PREFIX}.maintainer.email="rcroft@vmware.com"
#LABEL ${LABEL_PREFIX}.maintainer.url="https://gitlab.eng.vmware.com/rcroft/"
#LABEL ${LABEL_PREFIX}.released="9999-99-99"
#LABEL ${LABEL_PREFIX}.based-on="photon:5.0"
#LABEL ${LABEL_PREFIX}.project="containers"

# update repositories, install packages, and then clean up
RUN tdnf update -y && \
    # grab what we can via standard packages
    tdnf install -y bash ca-certificates coreutils curl diffutils git jq ncurses shadow tar unzip vim && \
    # add user/group
    # groupadd -g ${GROUP_ID} ${GROUP} && \
    # useradd -u ${USER_ID} -g ${GROUP} -m ${USER} && \
    useradd -g ${GROUP} -m ${USER} && \
    chown -R ${USER}:${GROUP} /home/${USER} && \
    # add /workspace and give user permissions
    mkdir -p /workspace && \
    chown -R ${USER}:${GROUP} /workspace && \
    # set git config
    git config --system --add safe.directory "/workspace" && \
    # grab terraform
    export TERRAFORM_VERSION=$(curl -H 'Accept: application/json' -sSL https://github.com/hashicorp/terraform/releases/latest | jq -r '.tag_name' | tr -d 'v') && \
    curl -skSLo terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    unzip -o -d /usr/local/bin/ terraform.zip && \
    rm -f terraform.zip && \
    # clean up
    tdnf erase -y unzip shadow && \
    tdnf clean all

# set user
USER ${USER}

# set working directory
WORKDIR /workspace

# set entrypoint to terraform, not a shell
ENTRYPOINT ["terraform"]

#############################################################################
# vim: ft=unix sync=dockerfile ts=4 sw=4 et tw=78:
