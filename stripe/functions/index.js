const functions = require('firebase-functions');
const Mailchimp = require('mailchimp-api-v3');


var cors = require('cors');
const corsHandler = cors({ origin: true });
const _mailChimpId = "3797721af8";
const _apiKey = "7f19473a7133c825b1cc5f74c6f3342a-us3";
const mailchimp = new Mailchimp(_apiKey);

exports.mailChimp = functions.https.onRequest((req, res) => {
    corsHandler(req, res, async () => {
        var obj = JSON.parse(req.body);
        const email = obj.email;
try {
            console.log("adding user");
            
            const results = await mailchimp.post(
                `/lists/${_mailChimpId}/members`,
                {
                    email_address: email,
                    status: "subscribed",
                }
            );
            console.log(results);
            console.log(`Added user: ${email} status PENDING to Mailchimp audience: ${_mailChimpId}`);
res.status(200).send('Success adding the user to the mailchimp list');
        } catch (error) {
            console.error("Error when adding user to Mailchimp audience", error);
            res.send(error);
        }
    });
});

