# Mtn Open Api
Explore seamless integration with MTN Open API using this Ruby gem. For in-depth information, refer to the official documentation at [https://momodeveloper.mtn.com/](https://momodeveloper.mtn.com/).

## Key Features
- **Full API Availability:** Access a comprehensive set of API endpoints, providing developers with a versatile toolkit to address a wide range of scenarios. The gem's commitment to inclusivity ensures that all necessary API endpoints are readily available for integration.

- **Robust Testing:** Every endpoint is rigorously tested to ensure reliability and stability. By adhering to best practices in testing, the `Mtn Open Api` gem delivers a dependable solution that developers can trust for their projects.

- **Intuitive Conversion:** Experience a seamless transition from JSON responses to structured `OpenStruct` objects, providing a more Ruby-like interface for effortless interaction.

- **Comprehensive Documentation:** All methods are thoroughly documented, ensuring that developers have access to clear and concise information on the functionality and usage of each feature. This commitment to documentation enhances the gem's usability and simplifies the integration process.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mtn_open_api -v 0.0.1

OR
```
gem 'mtn_open_api', '0.0.1'
```

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mtn_open_api -v 0.0.1

## Usage

## MtnOpenApi::SandboxProvisioningApi
Sandbox User Provisioning 

This class provides a convenient interface for making requests to the MTN MoMo `sandbox-provisioning-api` API.
#### Initialization
You can initialize it with the following parameters:

- `base_url` (optional): The base URL for the MTN MoMo `sandbox-provisioning-api` API. If not provided, the default value is https://sandbox.momodeveloper.mtn.com.
- `headers` (optional): A hash of HTTP headers to be included in the API requests.
- `schema` (optional): A hash representing the API schema. If not provided, the gem will use the default schema, which is already included in the gem. You can also download the schema from [https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api).
    
#### Example
```ruby
common_headers = {
  "Authorization": "string",
  "X-Callback-Url": "string",
  "X-Target-Environment": "string",
  "Ocp-Apim-Subscription-Key": "string"
}

sandboxprovisioningapi = MtnOpenApi::SandboxProvisioningApi.new(
  headers: common_headers
)

params = {
  "providerCallbackHost": "string"
}

extra_headers = {
  "X-Reference-Id": "string"
}

response = sandboxprovisioningapi.postV10Apiuser(params, extra_headers)
```
#### Methods
- [postV10Apiuser](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=post-v1_0-apiuser) Used to create an API user in the sandbox target environment.
- [postV10ApiuserApikey](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=post-v1_0-apiuser-apikey) Used to create an API key for an API user in the sandbox target environment.
- [getV10Apiuser](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=get-v1_0-apiuser) Used to get API user information.

## MtnOpenApi::Collection
Enable remote collection of bills, fees or taxes

This class provides a convenient interface for making requests to the MTN MoMo `collection` API.
#### Initialization
You can initialize it with the following parameters:

- `base_url` (optional): The base URL for the MTN MoMo `collection` API. If not provided, the default value is https://sandbox.momodeveloper.mtn.com/collection.
- `headers` (optional): A hash of HTTP headers to be included in the API requests.
- `schema` (optional): A hash representing the API schema. If not provided, the gem will use the default schema, which is already included in the gem. You can also download the schema from [https://momodeveloper.mtn.com/API-collections#api=collection](https://momodeveloper.mtn.com/API-collections#api=collection).
    
#### Example
```ruby
common_headers = {
  "Authorization": "string",
  "X-Callback-Url": "string",
  "X-Target-Environment": "string",
  "Ocp-Apim-Subscription-Key": "string"
}

collection = MtnOpenApi::Collection.new(
  headers: common_headers
)

params = {
  "amount": "string",
  "currency": "string",
  "externalId": "string",
  "payer": {
    "partyIdType": "MSISDN",
    "partyId": "string"
  },
  "payerMessage": "string",
  "payeeNote": "string"
}

extra_headers = {
  "X-Reference-Id": "string"
}

response = collection.requesttoPay(params, extra_headers)
```
#### Methods
- [getAccountBalance](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetAccountBalance) Get the balance of own account.
- [validateAccountHolderStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=ValidateAccountHolderStatus) Operation is used  to check if an account holder is registered and active in the system.
- [requesttoPay](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequesttoPay) This operation is used to request a payment from a consumer (Payer). The payer will be asked to authorize the payment. The transaction will be executed once the payer has authorized the payment. The requesttopay will be in status PENDING until the transaction is authorized or declined by the payer or it is timed out by the system. 
 Status of the transaction can be validated by using the GET /requesttopay/\<resourceId\>
- [requesttoPayTransactionStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequesttoPayTransactionStatus) This operation is used to get the status of a request to pay. X-Reference-Id that was passed in the post is used as reference to the request.
- [bcAuthorize](https://momodeveloper.mtn.com/API-collections#api=collection&operation=bc-authorize) This operation is used to claim a consent by the account holder for the requested scopes.
- [getBasicUserinfo](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetBasicUserinfo) This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
- [requesttoPayDeliveryNotification](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequesttoPayDeliveryNotification) This operation is used to send additional Notification to an End User.
- [getAccountBalanceInSpecificCurrency](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetAccountBalanceInSpecificCurrency) Get the balance of own account. Currency parameter passed in GET
- [requestToWithdrawV1](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequestToWithdraw-V1) This operation is used to request a withdrawal (cash-out) from a consumer (Payer). The payer will be asked to authorize the withdrawal. The transaction will be executed once the payer has authorized the withdrawal
- [requestToWithdrawV2](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequestToWithdraw-V2) This operation is used to request a withdrawal (cash-out) from a consumer (Payer). The payer will be asked to authorize the withdrawal. The transaction will be executed once the payer has authorized the withdrawal
- [requestToWithdrawTransactionStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=RequestToWithdrawTransactionStatus) This operation is used to get the status of a request to withdraw. X-Reference-Id that was passed in the post is used as reference to the request.
- [createInvoice](https://momodeveloper.mtn.com/API-collections#api=collection&operation=CreateInvoice) A merchant may use this in order to create an invoice that can be paid by an intended payer via any channel at a later stage.
- [getInvoiceStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetInvoiceStatus) This operation is used to get the status of an invoice. X-Reference-Id that was passed in the post is used as reference to the request
- [cancelInvoice](https://momodeveloper.mtn.com/API-collections#api=collection&operation=CancelInvoice) This operation is used to delete an invoice. The ReferenceId is associated with the invoice to be cancelled
- [preApproval](https://momodeveloper.mtn.com/API-collections#api=collection&operation=PreApproval) Preapproval operation is used to create a pre-approval.
- [getPreApprovalStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetPreApprovalStatus) This operation is used to get the status of a pre-approval. X-Reference-Id that was passed in the post is used as reference to the request.
- [createOauth2token](https://momodeveloper.mtn.com/API-collections#api=collection&operation=CreateOauth2Token) This operation is used to claim a consent by the account holder for the requested scopes.
- [getUserInfoWithConsent](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetUserInfoWithConsent) This operation is used to claim a consent by the account holder for the requested scopes.
- [createAccessToken](https://momodeveloper.mtn.com/API-collections#api=collection&operation=CreateAccessToken) This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
- [createPayments](https://momodeveloper.mtn.com/API-collections#api=collection&operation=CreatePayments) Making it possible to perform payments via the partner gateway. This may be used to pay for external bills or to perform air-time top-ups.
- [getPaymentStatus](https://momodeveloper.mtn.com/API-collections#api=collection&operation=GetPaymentStatus) This operation is used to get the status of a Payment. X-Reference-Id that was passed in the post is used as reference to the request

## MtnOpenApi::Disbursement
Automatically deposit funds to multiple users

This class provides a convenient interface for making requests to the MTN MoMo `disbursement` API.
#### Initialization
You can initialize it with the following parameters:

- `base_url` (optional): The base URL for the MTN MoMo `disbursement` API. If not provided, the default value is https://sandbox.momodeveloper.mtn.com/disbursement.
- `headers` (optional): A hash of HTTP headers to be included in the API requests.
- `schema` (optional): A hash representing the API schema. If not provided, the gem will use the default schema, which is already included in the gem. You can also download the schema from [https://momodeveloper.mtn.com/API-collections#api=disbursement](https://momodeveloper.mtn.com/API-collections#api=disbursement).
    
#### Example
```ruby
common_headers = {
  "Authorization": "string",
  "X-Callback-Url": "string",
  "X-Target-Environment": "string",
  "Ocp-Apim-Subscription-Key": "string"
}

disbursement = MtnOpenApi::Disbursement.new(
  headers: common_headers
)

params = "login_hint=ID:{msisdn}/MSISDN&scope={scope}&access_type={online/offline}"

extra_headers = {}

response = disbursement.bcAuthorize(params, extra_headers)
```
#### Methods
- [getAccountBalance](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetAccountBalance) Get the balance of own account.
- [validateAccountHolderStatus](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=ValidateAccountHolderStatus) Operation is used  to check if an account holder is registered and active in the system.
- [getTransferStatus](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetTransferStatus) This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
- [getBasicUserinfo](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetBasicUserinfo) This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
- [bcAuthorize](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=bc-authorize) This operation is used to claim a consent by the account holder for the requested scopes.
- [getAccountBalanceInSpecificCurrency](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetAccountBalanceInSpecificCurrency) Get the balance of own account. Currency parameter passed in GET
- [depositV1](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=Deposit-V1) deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}
- [depositV2](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=Deposit-V2) deposit operation is used to deposit an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /deposit/\{referenceId\}
- [getDepositStatus](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetDepositStatus) This operation is used to get the status of a deposit. X-Reference-Id that was passed in the post is used as reference to the request.
- [refundV1](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=Refund-V1) refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}
- [refundV2](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=Refund-V2) refund operation is used to refund an amount from the owner’s account to a payee account.<br> Status of the transaction can be validated by using the GET /refund/\{referenceId\}
- [getRefundStatus](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetRefundStatus) This operation is used to get the status of a refund. X-Reference-Id that was passed in the post is used as reference to the request.
- [createOauth2token](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=CreateOauth2Token) This operation is used to claim a consent by the account holder for the requested scopes.
- [getUserInfoWithConsent](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=GetUserInfoWithConsent) This operation is used to claim a consent by the account holder for the requested scopes.
- [createAccessToken](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=CreateAccessToken) This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
- [transfer](https://momodeveloper.mtn.com/API-collections#api=disbursement&operation=Transfer) Transfer operation is used to transfer an amount from the own account to a payee account.<br> Status of the transaction can validated by using the GET /transfer/\{referenceId\}

## MtnOpenApi::Remittance
Remit funds to local recipients from the diaspora with ease

This class provides a convenient interface for making requests to the MTN MoMo `remittance` API.
#### Initialization
You can initialize it with the following parameters:

- `base_url` (optional): The base URL for the MTN MoMo `remittance` API. If not provided, the default value is https://sandbox.momodeveloper.mtn.com/remittance.
- `headers` (optional): A hash of HTTP headers to be included in the API requests.
- `schema` (optional): A hash representing the API schema. If not provided, the gem will use the default schema, which is already included in the gem. You can also download the schema from [https://momodeveloper.mtn.com/API-collections#api=remittance](https://momodeveloper.mtn.com/API-collections#api=remittance).
    
#### Example
```ruby
common_headers = {
  "Authorization": "string",
  "X-Callback-Url": "string",
  "X-Target-Environment": "string",
  "Ocp-Apim-Subscription-Key": "string"
}

remittance = MtnOpenApi::Remittance.new(
  headers: common_headers
)

params = {
  "amount": "string",
  "currency": "string",
  "externalId": "string",
  "payee": {
    "partyIdType": "MSISDN",
    "partyId": "string"
  },
  "payerMessage": "string",
  "payeeNote": "string"
}

extra_headers = {
  "X-Reference-Id": "string"
}

response = remittance.transfer(params, extra_headers)
```
#### Methods
- [getAccountBalance](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetAccountBalance) Get the balance of own account.
- [validateAccountHolderStatus](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=ValidateAccountHolderStatus) Operation is used  to check if an account holder is registered and active in the system.
- [transfer](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=Transfer) Transfer operation is used to transfer an amount from the own account to a payee account.<br> Status of the transaction can validated by using the GET /transfer/\{referenceId\}
- [getTransferStatus](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetTransferStatus) This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
- [getBasicUserinfo](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetBasicUserinfo) This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
- [bcAuthorize](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=bc-authorize) This operation is used to claim a consent by the account holder for the requested scopes.
- [getAccountBalanceInSpecificCurrency](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetAccountBalanceInSpecificCurrency) Get the balance of own account. Currency parameter passed in GET
- [createOauth2token](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=CreateOauth2Token) This operation is used to claim a consent by the account holder for the requested scopes.
- [getUserInfoWithConsent](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetUserInfoWithConsent) This operation is used to claim a consent by the account holder for the requested scopes.
- [createAccessToken](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=CreateAccessToken) This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
- [cashTransfer](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=CashTransfer) Cash transfer operation is used to transfer an amount from the owner’s account to a payee account. Status of the transaction can be validated by using GET /cashtransfer/{referenceId}
- [getCashTransferStatus](https://momodeveloper.mtn.com/API-collections#api=remittance&operation=GetCashTransferStatus) This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koodeyo/mtn_open_api.
