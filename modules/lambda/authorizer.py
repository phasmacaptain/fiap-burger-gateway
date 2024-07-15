import json

def lambda_handler(event, context):
    # Extract the token from the event object (e.g., event['authorizationToken'])
    token = event.get('authorizationToken', '')

    # Validate the token (this is a simple example, you should replace it with your own logic)
    if token == 'allow':
        policy = generate_policy('user', 'Allow', event['methodArn'])
    else:
        policy = generate_policy('user', 'Deny', event['methodArn'])

    return policy

def generate_policy(principal_id, effect, resource):
    auth_response = {}
    auth_response['principalId'] = principal_id

    if effect and resource:
        policy_document = {
            'Version': '2012-10-17',
            'Statement': [
                {
                    'Action': 'execute-api:Invoke',
                    'Effect': effect,
                    'Resource': resource
                }
            ]
        }
        auth_response['policyDocument'] = policy_document

    # Optional: add context to the response
    auth_response['context'] = {
        'stringKey': 'stringValue',
        'numberKey': 123,
        'booleanKey': True
    }

    return auth_response
