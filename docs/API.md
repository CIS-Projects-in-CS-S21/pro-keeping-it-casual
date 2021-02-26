# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [proto/common.proto](#proto/common.proto)
    - [File](#kic.common.File)
    - [File.MetadataEntry](#kic.common.File.MetadataEntry)
    - [User](#kic.common.User)
  
- [proto/feed.proto](#proto/feed.proto)
- [proto/friends.proto](#proto/friends.proto)
    - [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse)
    - [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest)
    - [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest)
    - [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse)
    - [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest)
    - [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse)
    - [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest)
  
    - [ConnectionErrors](#kic.friends.ConnectionErrors)
  
    - [Friends](#kic.friends.Friends)
  
- [proto/health.proto](#proto/health.proto)
- [proto/media.proto](#proto/media.proto)
    - [CheckForFileRequest](#kic.media.CheckForFileRequest)
    - [CheckForFileResponse](#kic.media.CheckForFileResponse)
    - [DownloadFileRequest](#kic.media.DownloadFileRequest)
    - [DownloadFileResponse](#kic.media.DownloadFileResponse)
    - [GetFilesByMetadataRequest](#kic.media.GetFilesByMetadataRequest)
    - [GetFilesByMetadataRequest.DesiredMetadataEntry](#kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry)
    - [GetFilesByMetadataResponse](#kic.media.GetFilesByMetadataResponse)
    - [UploadFileRequest](#kic.media.UploadFileRequest)
    - [UploadFileResponse](#kic.media.UploadFileResponse)
  
    - [DownloadFileByNameError](#kic.media.DownloadFileByNameError)
    - [MetadataStrictness](#kic.media.MetadataStrictness)
  
    - [MediaStorage](#kic.media.MediaStorage)
  
- [proto/users.proto](#proto/users.proto)
    - [AddUserRequest](#kic.users.AddUserRequest)
    - [AddUserResponse](#kic.users.AddUserResponse)
    - [GetUserByIDRequest](#kic.users.GetUserByIDRequest)
    - [GetUserByIDResponse](#kic.users.GetUserByIDResponse)
    - [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest)
    - [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse)
    - [GetUserNameByIDRequest](#kic.users.GetUserNameByIDRequest)
    - [GetUserNameByIDResponse](#kic.users.GetUserNameByIDResponse)
  
    - [AddUserError](#kic.users.AddUserError)
  
    - [UserService](#kic.users.UserService)
  
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
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| userName | [string](#string) |  | User&#39;s account username. |
| email | [string](#string) |  | The email registered by this user. |





 

 

 

 



<a name="proto/feed.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/feed.proto


 

 

 

 



<a name="proto/friends.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/friends.proto



<a name="kic.friends.ConnectionBetweenUsersResponse"></a>

### ConnectionBetweenUsersResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [ConnectionErrors](#kic.friends.ConnectionErrors) |  |  |
| connectionStrength | [float](#float) |  |  |






<a name="kic.friends.GetConnectionBetweenUsersRequest"></a>

### GetConnectionBetweenUsersRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  |  |
| secondUserID | [uint64](#uint64) |  |  |






<a name="kic.friends.GetFriendsForUserRequest"></a>

### GetFriendsForUserRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [kic.common.User](#kic.common.User) |  |  |






<a name="kic.friends.GetFriendsForUserResponse"></a>

### GetFriendsForUserResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| friends | [uint64](#uint64) | repeated |  |






<a name="kic.friends.GetRecommendationsForUserRequest"></a>

### GetRecommendationsForUserRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [kic.common.User](#kic.common.User) |  |  |






<a name="kic.friends.GetRecommendationsForUserResponse"></a>

### GetRecommendationsForUserResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| recommendations | [kic.common.User](#kic.common.User) | repeated |  |






<a name="kic.friends.UpdateConnectionBetweenUsersRequest"></a>

### UpdateConnectionBetweenUsersRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  |  |
| secondUserID | [uint64](#uint64) |  |  |
| updateValue | [float](#float) |  |  |





 


<a name="kic.friends.ConnectionErrors"></a>

### ConnectionErrors


| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_FRIENDSHIP | 0 |  |
| USER_ONE_DNE | 1 |  |
| USER_TWO_DNE | 2 |  |


 

 


<a name="kic.friends.Friends"></a>

### Friends


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetFriendsForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse) |  |
| GetRecommendationsForUser | [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest) | [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse) |  |
| UpdateConnectionBetweenUsers | [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) |  |
| GetConnectionBetweenUsers | [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) |  |

 



<a name="proto/health.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/health.proto


 

 

 

 



<a name="proto/media.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/media.proto



<a name="kic.media.CheckForFileRequest"></a>

### CheckForFileRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  |  |






<a name="kic.media.CheckForFileResponse"></a>

### CheckForFileResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| exists | [bool](#bool) |  |  |






<a name="kic.media.DownloadFileRequest"></a>

### DownloadFileRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  |  |






<a name="kic.media.DownloadFileResponse"></a>

### DownloadFileResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [DownloadFileByNameError](#kic.media.DownloadFileByNameError) |  |  |
| chunk | [bytes](#bytes) |  |  |






<a name="kic.media.GetFilesByMetadataRequest"></a>

### GetFilesByMetadataRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| desiredMetadata | [GetFilesByMetadataRequest.DesiredMetadataEntry](#kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry) | repeated |  |
| strictness | [MetadataStrictness](#kic.media.MetadataStrictness) |  |  |






<a name="kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry"></a>

### GetFilesByMetadataRequest.DesiredMetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.media.GetFilesByMetadataResponse"></a>

### GetFilesByMetadataResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfos | [kic.common.File](#kic.common.File) | repeated |  |






<a name="kic.media.UploadFileRequest"></a>

### UploadFileRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  |  |
| chunk | [bytes](#bytes) |  |  |






<a name="kic.media.UploadFileResponse"></a>

### UploadFileResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [string](#string) |  |  |
| bytesRead | [uint64](#uint64) |  |  |





 


<a name="kic.media.DownloadFileByNameError"></a>

### DownloadFileByNameError


| Name | Number | Description |
| ---- | ------ | ----------- |
| FILE_NOT_FOUND | 0 |  |
| BUCKET_NOT_FOUND | 1 |  |



<a name="kic.media.MetadataStrictness"></a>

### MetadataStrictness
Flags sent with a get file by metadata request to tell the server how seriously it wants the metadata request
to be conformed to

| Name | Number | Description |
| ---- | ------ | ----------- |
| STRICT | 0 | Only include a given file if all key value pairs match |
| CASUAL | 1 | Include a file if it matches any of the key value pairs |
| STRICTLY_OPPOSITE | 2 | Only include a file if it fails to match all key value pairs |
| CASUALLY_OPPOSITE | 3 | Only include a file if it matches less than all key value pairs |


 

 


<a name="kic.media.MediaStorage"></a>

### MediaStorage


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| UploadFile | [UploadFileRequest](#kic.media.UploadFileRequest) stream | [UploadFileResponse](#kic.media.UploadFileResponse) |  |
| DownloadFileByName | [DownloadFileRequest](#kic.media.DownloadFileRequest) | [DownloadFileResponse](#kic.media.DownloadFileResponse) stream |  |
| CheckForFileByName | [CheckForFileRequest](#kic.media.CheckForFileRequest) | [CheckForFileResponse](#kic.media.CheckForFileResponse) |  |
| GetFilesWithMetadata | [GetFilesByMetadataRequest](#kic.media.GetFilesByMetadataRequest) | [GetFilesByMetadataResponse](#kic.media.GetFilesByMetadataResponse) |  |

 



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
| createdUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user should they be accepted. |
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







<a name="kic.users.GetUserNameByIDRequest"></a>

### GetUserNameByIDRequest







<a name="kic.users.GetUserNameByIDResponse"></a>

### GetUserNameByIDResponse






 


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


 

 


<a name="kic.users.UserService"></a>

### UserService
Service handling fetching and storing data about users.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| AddUser | [AddUserRequest](#kic.users.AddUserRequest) | [AddUserResponse](#kic.users.AddUserResponse) |  |
| GetUserByUsername | [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest) | [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse) |  |
| GetUserByID | [GetUserByIDRequest](#kic.users.GetUserByIDRequest) | [GetUserByIDResponse](#kic.users.GetUserByIDResponse) |  |
| GetUserNameByID | [GetUserNameByIDRequest](#kic.users.GetUserNameByIDRequest) | [GetUserNameByIDResponse](#kic.users.GetUserNameByIDResponse) |  |

 



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

