# tech_assign_q

Demo app showcasing FHE Sentiment analysis using ZAMA's sentiment analysis demo.

## Getting Started

Clone the repo.

+++ Add steps to run the app

## How Fully Homomorphic Encryption is performed to guarantee no trust collaboration

**Loading the text file** - A text file is loaded from the user's device that contains the message that needs to analysed.

**Reading the file** - The contents of the file are parsed.

**Encrypting the file content** - Using RSA encryption, the content encrypted using the public key and the private key is securely stored on device.

**Sending the encrypted data and the public key to the server** - To perform FHE sentiment analysis the public ley and the encrypted message is sent to the server.

**Performing sentiment analysis on encrypted data** - ZAMA's FHE Sentiment analysis demo container is used to perform the analysis and the results are sent back to the device.

**Receiving the encrypted server response** - Having the public key already stored, the server only responds with the results of the analysis.

**Decrypting the response** - Using the private key, the server's response is decrypted and shown to the user.

## No trust collaboration

**Encryption is done on device** - To ensure that no data is shared with any party, everything must be encrypted.

**On device encryption** - The first step is to encrypt the data before it leaves the user's device.

**RSA Encryption** - RSA is a type of asymmetric encryption, which uses two different but linked keys. One is a public key, that will be shared with the FHE SA (sentiment analysis) service and the other is the private key, which is stored in device.

**Encryption during data transfer** - HTTPS guarantees encryption during data transport from the device to the server and back.

**The server can't decrypt the message** - The only way to decrypt the message is to use the private key, which the server does not know.

**The data is only visible to the user** - Because of the steps described above, the data cannot be read by anybody else who does not have access to the user's device.