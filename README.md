# Mosaic.API
Trading App for the MSc 2nd project
App is architectured as a simple microservice with :

    1. Mosaic.IdP : IdentityServer4 as the idp running on it own db and 
    2. Mosaic.API : The API providing stocks data running as a seperate service supported by db MosaicStock which is shared with the client.  
    3. Mosaic.Client : The GUI client supported by db MosaicStock
