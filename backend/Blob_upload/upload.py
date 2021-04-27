import os
import yaml
from azure.storage.blob import ContainerClient

if __name__ == "__main__":

    def load_config():
        """ Function to read the config file"""
        dir_root = os.path.dirname(os.path.abspath(__file__))
        with open(dir_root + "/config.yaml", "r") as yamlfile:
            # Return the configuration file as a object
            return yaml.load(yamlfile, Loader=yaml.FullLoader)


    def get_files(dir):
        """ Function that take all files in a directory. """
        with os.scandir(dir) as entries:
            for entry in entries:
                if entry.is_file() and not entry.name.startswith('.'):
                    yield entry

    def upload(files, connection_string, container_name):
        """ Upload files to azure blob storage. """
        container_client = ContainerClient.from_connection_string(connection_string, container_name)
        print("Upload files to blob to container...")#.format(container_name))

        for file in files:
            print(file.name)
            blob_client = container_client.get_blob_client(file.name)
            with open(file.path, "rb") as data:
                try:
                    blob_client.upload_blob(data)
                    print("{} uploaded to blob storage".format(file.name))
                    #os.remove(file)
                    print("{} removed from".format(file.name))
                except:
                    print("{} already exist".format(file.name))

"""
 # Upload files
config = load_config()
images = get_files(config["source_folder"]+ "/img")
upload(images, config["azure_storage_connectionstring"], config["pictures_container_name"])

 # Print the objects in storage
container_client = ContainerClient.from_connection_string(config["azure_storage_connectionstring"], config["pictures_container_name"])
blob_list = container_client.list_blobs()
for blob in blob_list:
    print(blob.name)
"""