import os
from azure.storage.blob import ContainerClient


def get_files(dir):
    """ Function to list all files in a directory as a "objects". """
    with os.scandir(dir) as entries:
        for entry in entries:
            if entry.is_file() and not entry.name.startswith('.'):
                yield entry


def upload(files):
    """ Function that add image to azure Blob storage. """
    azure_strg_connecstr = "DefaultEndpointsProtocol=https;AccountName=seedtech;AccountKey=ed2KCHzhwxCYjmyGXupChOTs/Yr30kcL+udmbPEklKbGDkKbUVegtDeodYeFpIzSs/xIhZK+hE3zkPZRcAyEbQ==;EndpointSuffix=core.windows.net"
    pic_contain_name = "seedt-images"
    
    container_client = ContainerClient.from_connection_string(azure_strg_connecstr, pic_contain_name)

    for file in files:
        blob_client = container_client.get_blob_client(file.name)
        with open(file.path, "rb") as data:
            try:
                blob_client.upload_blob(data)
                print("{} uploaded to container {}".format(file.name, pic_contain_name))
                os.remove(file)
            except:
                print("{} already exist".format(file.name))
