const {onRequest} = require("firebase-functions/v2/https");
const axios = require('axios');
const FormData = require('form-data');
const fs = require('fs');
const path = require('path');
/* const logger = require("firebase-functions/logger");
const lighthouse = require("@lighthouse-web3/sdk");
const LitJsSdk = require("@lit-protocol/lit-node-client");
const {LitNetwork} = require("@lit-protocol/constants"); */
/* 
class Lit{
    litNodeClient;
    chain;

    constructor(chain){
        this.chain = chain;
    }
    async connect(){
        app.locals.litNodeClient = new LitJsSdk.LitNodeClientJS({
            alertWhenUnauthorized: false,
            LitNetwork: LitNetwork.Manzano,
            debug: true,
    });
    this.litNodeClient = app.locals.litNodeClient;
    await this.litNodeClient.connect();
    }
}
 */
// onRequest function to handle HTTP requests to upload file to Lighthouse
exports.uploadFile2Lighthouse = onRequest(async (req, res) => {
    try {
        // Check for the correct HTTP method
        if (req.method !== 'POST') {
            return res.status(405).send('Method Not Allowed');
        }

        // Retrieve the file from the request
        const file = req.body.file; // Assuming the file is sent in the body

        if (!file) {
            return res.status(400).send('No file provided');
        }

        // Path to the file to be uploaded
        const filePath = path.join(os.tmpdir(), 'uploadedFile');
        fs.writeFileSync(filePath, Buffer.from(file, 'base64')); // Assuming the file is base64 encoded

        // Prepare the form data
        const form = new FormData();
        form.append('file', fs.createReadStream(filePath));

        // Add other required fields for the API request here
        form.append('someField', 'someValue');

        // Send the request to Lighthouse
        const response = await axios.post('https://api.lighthouse-web3.example/endpoint', form, {
            headers: {
                ...form.getHeaders(),
                'Authorization': `6d0322b3.1915e4d7265f40ab8a362c69ac4a8f70`
            }
        });

        // Handle the response from Lighthouse
        if (response.status === 200) {
            res.status(200).send(response.data);
        } else {
            res.status(response.status).send(response.statusText);
        }

    } catch (error) {
        console.error('Error uploading file:', error);
        res.status(500).send('Internal Server Error');
    }
});

/* // onRequest function to encrypt file using Lighthouse
exports.encryptFile = onRequest(async (req, res) => {
  const {file} = req.body;
  logger.info("Encrypting file using Lighthouse", {file});
  const result = await lighthouse.encryptFile(file);
  res.json(result);
}); */