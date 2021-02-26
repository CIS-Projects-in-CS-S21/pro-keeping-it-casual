# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [proto/common.proto](#proto/common.proto)
    - [File](#kic.common.File)
    - [File.MetadataEntry](#kic.common.File.MetadataEntry)
    - [User](#kic.common.User)
  
- [proto/feed.proto](#proto/feed.proto)
- [proto/friends.proto](#proto/friends.proto)
- [proto/health.proto](#proto/health.proto)
- [proto/media.proto](#proto/media.proto)
- [proto/users.proto](#proto/users.proto)
    - [AddUserRequest](#kic.users.AddUserRequest)
    - [AddUserResponse](#kic.users.AddUserResponse)
    - [GetUserByIDRequest](#kic.users.GetUserByIDRequest)
    - [GetUserByIDResponse](#kic.users.GetUserByIDResponse)
    - [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest)
    - [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse)
  
    - [AddUserError](#kic.users.AddUserError)
  
    - [User](#kic.users.User)
  
- [Scalar Value Types](#scalar-value-types)



<a name="proto/common.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/common.proto



<a name="kic.common.File"></a>

### File



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileName | [string](#string) |  | Simply the file name with an extension |
| fileLocation | [string](#string) |  | This is a client specific file location, for example a google cloud bucket name |
| metadata | [File.MetadataEntry](#kic.common.File.MetadataEntry) | repeated | Allows for arbitrary key/value metadata which can be client specific |






<a name="kic.common.File.MetadataEntry"></a>

### File.MetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.common.User"></a>

### User



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  |  |
| userName | [string](#string) |  |  |





 

 

 

 



<a name="proto/feed.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/feed.proto


 

 

 

 



<a name="proto/friends.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/friends.proto


 

 

 

 



<a name="proto/health.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/health.proto


 

 

 

 



<a name="proto/media.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/media.proto


 

 

 

 



<a name="proto/users.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/users.proto
These are messages and services relating to users and user authentication.
Some of the data models that will be used in the end products will be supplied from
the Envoy project, specifically those found here for external authentication
services: https://github.com/envoyproxy/envoy/blob/main/api/envoy/service/auth/v3/external_auth.proto
We will implement the server side logic for the service they define, allowing Istio to
send gRPC requests to our authentication server.


<a name="kic.users.AddUserRequest"></a>

### AddUserRequest
Request for a user to be added to the user database.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| email | [string](#string) |  |  |
| desiredUsername | [string](#string) |  |  |
| desiredPassword | [string](#string) |  |  |
| birthday | [string](#string) |  | User&#39;s birthday in MM/DD/YYYY format. |
| city | [string](#string) |  | User&#39;s city location. |






<a name="kic.users.AddUserResponse"></a>

### AddUserResponse
Response to a request for adding a user to the database.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was properly created. |
| createdUserID | [int64](#int64) |  | Inform the client of the ID assigned to the user should they be accepted. |
| errors | [AddUserError](#kic.users.AddUserError) | repeated | Array of errors which need to be fixed by the client. |






<a name="kic.users.GetUserByIDRequest"></a>

### GetUserByIDRequest







<a name="kic.users.GetUserByIDResponse"></a>

### GetUserByIDResponse







<a name="kic.users.GetUserByUsernameRequest"></a>

### GetUserByUsernameRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  |  |






<a name="kic.users.GetUserByUsernameResponse"></a>

### GetUserByUsernameResponse






 


<a name="kic.users.AddUserError"></a>

### AddUserError
These are errors used to inform the client requesting a user be added what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| DUPLICATE_EMAIL | 0 | The requested email is taken. |
| DUPLICATE_USERNAME | 1 | The requested username is taken. |
| INVALID_PASSWORD | 2 | This is a catchall for passwords that the server has deemed unacceptable, checking may also be done on the client side. |
| BIRTHDAY_MALFORMED | 3 | The sent date was not in the proper format. |


 

 


<a name="kic.users.User"></a>

### User
Service handling fetching and storing data about users.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| AddUser | [AddUserRequest](#kic.users.AddUserRequest) | [AddUserResponse](#kic.users.AddUserResponse) |  |
| GetUserByUsername | [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest) | [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse) |  |
| GetUserByID | [GetUserByIDRequest](#kic.users.GetUserByIDRequest) | [GetUserByIDResponse](#kic.users.GetUserByIDResponse) |  |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

