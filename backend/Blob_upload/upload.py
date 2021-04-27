import os
from azure.storage.blob import ContainerClient


def get_files(dir):
    with os.scandir(dir) as entries:
        for entry in entries:
            if entry.is_file() and not entry.name.startswith('.'):
                yield entry


def upload(files):
    azure_strg_connecstr = "DefaultEndpointsProtocol=https;AccountName=seedtech;AccountKey=ed2KCHzhwxCYjmyGXupChOTs/Yr30kcL+udmbPEklKbGDkKbUVegtDeodYeFpIzSs/xIhZK+hE3zkPZRcAyEbQ==;EndpointSuffix=core.windows.net"
    pic_contain_name = "seedt-images"
    
    container_client = ContainerClient.from_connection_string(azure_strg_connecstr, pic_contain_name)
    print("Upload files to blob to container...")#.format(container_name))

    for file in files:
        print(file.name)
        blob_client = container_client.get_blob_client(file.name)
        with open(file.path, "rb") as data:
            try:
                blob_client.upload_blob(data)
                print("{} uploaded to blob storage".format(file.name))
                os.remove(file)
                print("{} removed from".format(file.name))
            except:
                print("{} already exist".format(file.name))
