# MtnOpenApi

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mtn_open_api`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mtn_open_api

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mtn_open_api

## Usage

## SandboxProvisioningApi
Sandbox User Provisioning 

Example
```ruby
common_headers = {
  "X-Target-Environment": "value-0",
  "Authorization": "value-1",
  "X-Callback-Url": "value-2",
  "Ocp-Apim-Subscription-Key": "value-3"
}

sandboxprovisioningapi = MtnOpenApi::SandboxProvisioningApi.new(
  base_url: 'https://sandbox.momodeveloper.mtn.com',
  headers: common_headers
)

params = {
  "providerCallbackHost": "string"
}

extra_headers = {
  "X-Reference-Id": "value-0"
}

response = sandboxprovisioningapi.postV10Apiuser(params, extra_headers)

puts response # {'statusCode': 401, 'message': 'Access denied due to missing subscription key...' }
```
### Methods
- [postV10Apiuser](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=post-v1_0-apiuser) Used to create an API user in the sandbox target environment.
- [postV10ApiuserApikey](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=post-v1_0-apiuser-apikey) Used to create an API key for an API user in the sandbox target environment.
- [getV10Apiuser](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=get-v1_0-apiuser) Used to get API user information.

## Collection
Enable remote collection of bills, fees or taxes

Example
```ruby
common_headers = {
  "X-Target-Environment": "value-0",
  "Authorization": "value-1",
  "X-Callback-Url": "value-2",
  "Ocp-Apim-Subscription-Key": "value-3"
}

collection = MtnOpenApi::Collection.new(
  base_url: 'https://sandbox.momodeveloper.mtn.com/collection',
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
  "X-Reference-Id": "value-0"
}

response = collection.requesttoPay(params, extra_headers)

puts response # {'statusCode': 401, 'message': 'Access denied due to missing subscription key...' }
```
### Methods
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

## Disbursement
Automatically deposit funds to multiple users

Example
```ruby
common_headers = {
  "X-Target-Environment": "value-0",
  "Authorization": "value-1",
  "X-Callback-Url": "value-2",
  "Ocp-Apim-Subscription-Key": "value-3"
}

disbursement = MtnOpenApi::Disbursement.new(
  base_url: 'https://sandbox.momodeveloper.mtn.com/disbursement',
  headers: common_headers
)

params = "login_hint=ID:{msisdn}/MSISDN&scope={scope}&access_type={online/offline}"

extra_headers = {}

response = disbursement.bcAuthorize(params, extra_headers)

puts response # {'statusCode': 401, 'message': 'Access denied due to missing subscription key...' }
```
### Methods
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

## Remittance
Remit funds to local recipients from the diaspora with ease

Example
```ruby
common_headers = {
  "X-Target-Environment": "value-0",
  "Authorization": "value-1",
  "X-Callback-Url": "value-2",
  "Ocp-Apim-Subscription-Key": "value-3"
}

remittance = MtnOpenApi::Remittance.new(
  base_url: 'https://sandbox.momodeveloper.mtn.com/remittance',
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
  "X-Reference-Id": "value-0"
}

response = remittance.transfer(params, extra_headers)

puts response # {'statusCode': 401, 'message': 'Access denied due to missing subscription key...' }
```
### Methods
- [getAccountBalance](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetAccountBalance) Get the balance of own account.
- [validateAccountHolderStatus](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=ValidateAccountHolderStatus) Operation is used  to check if an account holder is registered and active in the system.
- [transfer](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=Transfer) Transfer operation is used to transfer an amount from the own account to a payee account.<br> Status of the transaction can validated by using the GET /transfer/\{referenceId\}
- [getTransferStatus](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetTransferStatus) This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.
- [getBasicUserinfo](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetBasicUserinfo) This operation returns personal information of the account holder. The operation does not need any consent by the account holder.
- [bcAuthorize](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=bc-authorize) This operation is used to claim a consent by the account holder for the requested scopes.
- [getAccountBalanceInSpecificCurrency](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetAccountBalanceInSpecificCurrency) Get the balance of own account. Currency parameter passed in GET
- [createOauth2token](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=CreateOauth2Token) This operation is used to claim a consent by the account holder for the requested scopes.
- [getUserInfoWithConsent](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetUserInfoWithConsent) This operation is used to claim a consent by the account holder for the requested scopes.
- [createAccessToken](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=CreateAccessToken) This operation is used to create an access token which can then be used to authorize and authenticate towards the other end-points of the API.
- [cashTransfer](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=CashTransfer) Cash transfer operation is used to transfer an amount from the owner’s account to a payee account. Status of the transaction can be validated by using GET /cashtransfer/{referenceId}
- [getCashTransferStatus](https://momodeveloper.mtn.com/API-collections#api=sandbox-provisioning-api&operation=GetCashTransferStatus) This operation is used to get the status of a transfer. X-Reference-Id that was passed in the post is used as reference to the request.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koodeyo/mtn_open_api.
