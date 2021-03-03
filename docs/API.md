# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [proto/common.proto](#proto/common.proto)
    - [Date](#kic.common.Date)
    - [File](#kic.common.File)
    - [File.MetadataEntry](#kic.common.File.MetadataEntry)
    - [User](#kic.common.User)
  
- [proto/feed.proto](#proto/feed.proto)
    - [GenerateFeedForUserRequest](#kic.feed.GenerateFeedForUserRequest)
    - [GenerateFeedForUserResponse](#kic.feed.GenerateFeedForUserResponse)
  
    - [GenerateFeedError](#kic.feed.GenerateFeedError)
  
    - [Feed](#kic.feed.Feed)
  
- [proto/friends.proto](#proto/friends.proto)
    - [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse)
    - [CreateConnectionForUsersRequest](#kic.friends.CreateConnectionForUsersRequest)
    - [CreateConnectionForUsersResponse](#kic.friends.CreateConnectionForUsersResponse)
    - [DeleteConnectionBetweenUsersRequest](#kic.friends.DeleteConnectionBetweenUsersRequest)
    - [DeleteConnectionBetweenUsersResponse](#kic.friends.DeleteConnectionBetweenUsersResponse)
    - [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest)
    - [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest)
    - [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse)
    - [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest)
    - [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse)
    - [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest)
  
    - [ConnectionError](#kic.friends.ConnectionError)
  
    - [Friends](#kic.friends.Friends)
  
- [proto/health.proto](#proto/health.proto)
    - [AddHealthDataForUserRequest](#kic.health.AddHealthDataForUserRequest)
    - [DeleteHealthDataForUserRequest](#kic.health.DeleteHealthDataForUserRequest)
    - [DeleteHealthDataForUserResponse](#kic.health.DeleteHealthDataForUserResponse)
    - [GetHealthDataForUserRequest](#kic.health.GetHealthDataForUserRequest)
    - [GetHealthDataForUserResponse](#kic.health.GetHealthDataForUserResponse)
    - [HealthDataErrorResponse](#kic.health.HealthDataErrorResponse)
    - [MentalHealthLog](#kic.health.MentalHealthLog)
    - [UpdateHealthDataForDateRequest](#kic.health.UpdateHealthDataForDateRequest)
  
    - [HealthDataError](#kic.health.HealthDataError)
  
    - [HealthTracking](#kic.health.HealthTracking)
  
- [proto/media.proto](#proto/media.proto)
    - [CheckForFileRequest](#kic.media.CheckForFileRequest)
    - [CheckForFileResponse](#kic.media.CheckForFileResponse)
    - [DeleteFilesWithMetaDataRequest](#kic.media.DeleteFilesWithMetaDataRequest)
    - [DeleteFilesWithMetaDataRequest.MetadataEntry](#kic.media.DeleteFilesWithMetaDataRequest.MetadataEntry)
    - [DeleteFilesWithMetaDataResponse](#kic.media.DeleteFilesWithMetaDataResponse)
    - [DownloadFileRequest](#kic.media.DownloadFileRequest)
    - [DownloadFileResponse](#kic.media.DownloadFileResponse)
    - [GetFilesByMetadataRequest](#kic.media.GetFilesByMetadataRequest)
    - [GetFilesByMetadataRequest.DesiredMetadataEntry](#kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry)
    - [GetFilesByMetadataResponse](#kic.media.GetFilesByMetadataResponse)
    - [UploadFileRequest](#kic.media.UploadFileRequest)
    - [UploadFileResponse](#kic.media.UploadFileResponse)
  
    - [DeleteFileError](#kic.media.DeleteFileError)
    - [DownloadFileByNameError](#kic.media.DownloadFileByNameError)
    - [MetadataStrictness](#kic.media.MetadataStrictness)
  
    - [MediaStorage](#kic.media.MediaStorage)
  
- [proto/users.proto](#proto/users.proto)
    - [AddUserRequest](#kic.users.AddUserRequest)
    - [AddUserResponse](#kic.users.AddUserResponse)
    - [DeleteUserByIDRequest](#kic.users.DeleteUserByIDRequest)
    - [DeleteUserByIDResponse](#kic.users.DeleteUserByIDResponse)
    - [GetJWTTokenRequest](#kic.users.GetJWTTokenRequest)
    - [GetJWTTokenResponse](#kic.users.GetJWTTokenResponse)
    - [GetUserByIDRequest](#kic.users.GetUserByIDRequest)
    - [GetUserByIDResponse](#kic.users.GetUserByIDResponse)
    - [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest)
    - [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse)
    - [GetUserNameByIDRequest](#kic.users.GetUserNameByIDRequest)
    - [GetUserNameByIDResponse](#kic.users.GetUserNameByIDResponse)
    - [UpdateUserInfoRequest](#kic.users.UpdateUserInfoRequest)
    - [UpdateUserInfoResponse](#kic.users.UpdateUserInfoResponse)
  
    - [AddUserError](#kic.users.AddUserError)
    - [GetJWTTokenResponse.JWTError](#kic.users.GetJWTTokenResponse.JWTError)
    - [GetUserError](#kic.users.GetUserError)
  
    - [Users](#kic.users.Users)
  
- [Scalar Value Types](#scalar-value-types)



<a name="proto/common.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/common.proto



<a name="kic.common.Date"></a>

### Date
A representation of days of the year including month, year and day.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| year | [int32](#int32) |  | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. |
| month | [int32](#int32) |  | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. |
| day | [int32](#int32) |  | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn&#39;t significant. |






<a name="kic.common.File"></a>

### File
A file representation that denotes the name, extension and where to find the file. Additionally, arbitrary
metadata is allowed through key value pairs, which allows for example a file to be tagged as owned by a particular
user.


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
A representation of a User that will be used to identify them between services.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| userName | [string](#string) |  | User&#39;s account username. |
| email | [string](#string) |  | The email registered by this user. |





 

 

 

 



<a name="proto/feed.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/feed.proto



<a name="kic.feed.GenerateFeedForUserRequest"></a>

### GenerateFeedForUserRequest
Request to generate user feed for the user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |






<a name="kic.feed.GenerateFeedForUserResponse"></a>

### GenerateFeedForUserResponse
Response to a request for generating feed for the user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  | The file being pulled, consisting of the file name, file location, and metadata. |
| error | [GenerateFeedError](#kic.feed.GenerateFeedError) |  | The error occurring when the feed is generated. |





 


<a name="kic.feed.GenerateFeedError"></a>

### GenerateFeedError
These are errors used to inform the client that is requesting a connection what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| USER_NOT_FOUND | 0 | The constant representing when a user is not found. |
| OUT_OF_POSTS | 1 | The constant representing when the feed has no more posts to show a user. |


 

 


<a name="kic.feed.Feed"></a>

### Feed
Service handling generating data for user feed

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GenerateFeedForUser | [GenerateFeedForUserRequest](#kic.feed.GenerateFeedForUserRequest) | [GenerateFeedForUserResponse](#kic.feed.GenerateFeedForUserResponse) stream | Generate a stream of posts until either exhausted or the client requests an end. |

 



<a name="proto/friends.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/friends.proto
These are messages and services relating to a friend services, such as viewing, adding,
and removing friends, as well as generating friend recommendations for a user.


<a name="kic.friends.ConnectionBetweenUsersResponse"></a>

### ConnectionBetweenUsersResponse
Response to a request for fetching the connection between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [ConnectionError](#kic.friends.ConnectionError) |  | An error in fetching the connection. |
| connectionStrength | [float](#float) |  | Denotes the strength of the connection between two users. |






<a name="kic.friends.CreateConnectionForUsersRequest"></a>

### CreateConnectionForUsersRequest
Request for two users to become friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |






<a name="kic.friends.CreateConnectionForUsersResponse"></a>

### CreateConnectionForUsersResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [ConnectionError](#kic.friends.ConnectionError) |  | An error in creating the connection. |






<a name="kic.friends.DeleteConnectionBetweenUsersRequest"></a>

### DeleteConnectionBetweenUsersRequest
Request for a connection between two users to be deleted.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |






<a name="kic.friends.DeleteConnectionBetweenUsersResponse"></a>

### DeleteConnectionBetweenUsersResponse
Response to a request for deleting a connection between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [ConnectionError](#kic.friends.ConnectionError) |  | An error in deleting the connection. |






<a name="kic.friends.GetConnectionBetweenUsersRequest"></a>

### GetConnectionBetweenUsersRequest
Retrieve the connection between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |






<a name="kic.friends.GetFriendsForUserRequest"></a>

### GetFriendsForUserRequest
Request to get the user&#39;s friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [kic.common.User](#kic.common.User) |  | Inform the client of information regarding the user. |






<a name="kic.friends.GetFriendsForUserResponse"></a>

### GetFriendsForUserResponse
Response to a request for getting the user&#39;s friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| friends | [uint64](#uint64) | repeated | An array of all other users that the user is currently friends with. |






<a name="kic.friends.GetRecommendationsForUserRequest"></a>

### GetRecommendationsForUserRequest
Request to get friend recommendations for the user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [kic.common.User](#kic.common.User) |  | Inform the client of information regarding the user. |
| numberRecommendations | [int32](#int32) |  | How many recommendations the client would like to receive. |






<a name="kic.friends.GetRecommendationsForUserResponse"></a>

### GetRecommendationsForUserResponse
Response to a request for getting friend recommendations for the user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| recommendations | [kic.common.User](#kic.common.User) | repeated | An array of users that will be recommended to the user. |






<a name="kic.friends.UpdateConnectionBetweenUsersRequest"></a>

### UpdateConnectionBetweenUsersRequest
Update the connection between two users by modifying the connection value.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |
| updateValue | [float](#float) |  | The new value for the connection between the first user and second user. |





 


<a name="kic.friends.ConnectionError"></a>

### ConnectionError
These are errors used to inform the client that is requesting a connection what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| NO_FRIENDSHIP | 0 | Two users are not friends. |
| USER_ONE_DNE | 1 | The first user does not exist. |
| USER_TWO_DNE | 2 | The second user does not exist. |


 

 


<a name="kic.friends.Friends"></a>

### Friends
Service handling fetching and storing data about friends.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetFriendsForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse) | Request a list of the IDs of all friends of a particular user. |
| GetConnectionBetweenUsers | [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) | Request information about the connection between two users, checking for existence and strength. |
| GetRecommendationsForUser | [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest) | [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse) | Request a list of given size of users who might be friends of the requesting user. |
| CreateConnectionForUsers | [CreateConnectionForUsersRequest](#kic.friends.CreateConnectionForUsersRequest) | [CreateConnectionForUsersResponse](#kic.friends.CreateConnectionForUsersResponse) | Add two users as friends and create a connection between them. |
| UpdateConnectionBetweenUsers | [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) | Update a connection strength between two users. |
| DeleteConnectionBetweenUsers | [DeleteConnectionBetweenUsersRequest](#kic.friends.DeleteConnectionBetweenUsersRequest) | [DeleteConnectionBetweenUsersResponse](#kic.friends.DeleteConnectionBetweenUsersResponse) | Delete the connection between two users. |

 



<a name="proto/health.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/health.proto
These are messages and services relating to mental health tracking data, allowing for
the logging of user mental health data and tracking the quality of their mental health state
from day to day.


<a name="kic.health.AddHealthDataForUserRequest"></a>

### AddHealthDataForUserRequest
Request from a user to add their mental health data to MentalHealthLog.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| newEntry | [MentalHealthLog](#kic.health.MentalHealthLog) |  | newEntry denotes the ID of the new entry that is requested to be made. |






<a name="kic.health.DeleteHealthDataForUserRequest"></a>

### DeleteHealthDataForUserRequest
Request from a user to delete their mental health data from MentalHealthLog.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| all | [bool](#bool) |  | all denotes if all of the health data should be removed or not. |
| dateToRemove | [kic.common.Date](#kic.common.Date) |  | dateToRemove denotes the date of the mental health log data to remove. |






<a name="kic.health.DeleteHealthDataForUserResponse"></a>

### DeleteHealthDataForUserResponse
Response to a user when user asks to delete health data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [HealthDataError](#kic.health.HealthDataError) |  | Error denotes if error occurred when deleting health data and the ID of the error it was. |
| entriesDeleted | [uint32](#uint32) |  | entriesDeleted denotes the mental health log entries that was successfully deleted for the user |






<a name="kic.health.GetHealthDataForUserRequest"></a>

### GetHealthDataForUserRequest
Request from a user to get their mental health tracking data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |






<a name="kic.health.GetHealthDataForUserResponse"></a>

### GetHealthDataForUserResponse
Response to a user when user asks for health data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [HealthDataError](#kic.health.HealthDataError) |  | Error denotes if error occurred when obtaining health data and what the error was. |
| healthData | [MentalHealthLog](#kic.health.MentalHealthLog) | repeated | healthData denotes the data that was requested by user from mental health log |






<a name="kic.health.HealthDataErrorResponse"></a>

### HealthDataErrorResponse
Response to a user when there is a mental health data error.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [HealthDataError](#kic.health.HealthDataError) |  | Error denotes if error occurred with health data. |






<a name="kic.health.MentalHealthLog"></a>

### MentalHealthLog
Response to a user with complete mental health log


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| logDate | [kic.common.Date](#kic.common.Date) |  | Date of Mental Health Log Entry |
| score | [uint32](#uint32) |  | Score denotes the mental health tracking score from logDate. |






<a name="kic.health.UpdateHealthDataForDateRequest"></a>

### UpdateHealthDataForDateRequest
Request from a user to update their mental health tracking data for a particular date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| desiredLogInfo | [MentalHealthLog](#kic.health.MentalHealthLog) |  | The desiredLogInfo denotes the log info that the user would like to update. |





 


<a name="kic.health.HealthDataError"></a>

### HealthDataError
These are errors used to inform the client requesting health data what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| USER_NOT_FOUND | 0 | USER_NOT_FOUND denotes if user is not found. |
| DATE_NOT_FOUND | 1 | DATE_NOT_FOUND denotes if date is not found. |


 

 


<a name="kic.health.HealthTracking"></a>

### HealthTracking
Service handling fetching and storing mental health tracking data about users.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetHealthDataForUser | [GetHealthDataForUserRequest](#kic.health.GetHealthDataForUserRequest) | [GetHealthDataForUserResponse](#kic.health.GetHealthDataForUserResponse) | Given health data obtained upon user request, said health data is returned to user. |
| AddHealthDataForUser | [AddHealthDataForUserRequest](#kic.health.AddHealthDataForUserRequest) | [HealthDataErrorResponse](#kic.health.HealthDataErrorResponse) | Health data requested to be added by user is added, and error is returned if appropriate. |
| DeleteHealthDataForUser | [DeleteHealthDataForUserRequest](#kic.health.DeleteHealthDataForUserRequest) | [DeleteHealthDataForUserResponse](#kic.health.DeleteHealthDataForUserResponse) | Health data requested by user to be deleted is deleted and said deleted entries are returned to user. |
| UpdateHealthDataForDate | [UpdateHealthDataForDateRequest](#kic.health.UpdateHealthDataForDateRequest) | [HealthDataErrorResponse](#kic.health.HealthDataErrorResponse) | Health data requested to be updated by user is updated, and error is returned if appropriate. |

 



<a name="proto/media.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/media.proto
These are messages and services relating to a storing media, such as uploading and downloading files.


<a name="kic.media.CheckForFileRequest"></a>

### CheckForFileRequest
Request to check for file for user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  | Information of file to be checked |






<a name="kic.media.CheckForFileResponse"></a>

### CheckForFileResponse
Response to check for file for user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| exists | [bool](#bool) |  | Returns true if file is found to exist |






<a name="kic.media.DeleteFilesWithMetaDataRequest"></a>

### DeleteFilesWithMetaDataRequest
Request to delete file for user with metadata request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| metadata | [DeleteFilesWithMetaDataRequest.MetadataEntry](#kic.media.DeleteFilesWithMetaDataRequest.MetadataEntry) | repeated | Map of desired metadata of file to be deleted |
| strictness | [MetadataStrictness](#kic.media.MetadataStrictness) |  | Flags sent to tell the server how seriously it wants the metadata request to be conformed to |






<a name="kic.media.DeleteFilesWithMetaDataRequest.MetadataEntry"></a>

### DeleteFilesWithMetaDataRequest.MetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.media.DeleteFilesWithMetaDataResponse"></a>

### DeleteFilesWithMetaDataResponse
Response to  delete file for user with metadata request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [DeleteFileError](#kic.media.DeleteFileError) |  | DeleteFileError denotes if file is not able to be deleted. |






<a name="kic.media.DownloadFileRequest"></a>

### DownloadFileRequest
Request to download file for user


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  | Information of file to be downloaded |






<a name="kic.media.DownloadFileResponse"></a>

### DownloadFileResponse
Response to download file for user


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [DownloadFileByNameError](#kic.media.DownloadFileByNameError) |  |  |
| chunk | [bytes](#bytes) |  |  |






<a name="kic.media.GetFilesByMetadataRequest"></a>

### GetFilesByMetadataRequest
Request to get files for user by metadata request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| desiredMetadata | [GetFilesByMetadataRequest.DesiredMetadataEntry](#kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry) | repeated | Map of desired metadata |
| strictness | [MetadataStrictness](#kic.media.MetadataStrictness) |  | Flags sent with a get file by metadata request to tell the server how seriously it wants the metadata request to be conformed to |






<a name="kic.media.GetFilesByMetadataRequest.DesiredMetadataEntry"></a>

### GetFilesByMetadataRequest.DesiredMetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.media.GetFilesByMetadataResponse"></a>

### GetFilesByMetadataResponse
Response to get files for user by metadata request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfos | [kic.common.File](#kic.common.File) | repeated | Information of file to be downloaded |






<a name="kic.media.UploadFileRequest"></a>

### UploadFileRequest
Request to upload file for user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  |  |
| chunk | [bytes](#bytes) |  |  |






<a name="kic.media.UploadFileResponse"></a>

### UploadFileResponse
Response to user requesting file upload.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [string](#string) |  | Id of file being uploaded |
| bytesRead | [uint64](#uint64) |  | Size of file in bytes |





 


<a name="kic.media.DeleteFileError"></a>

### DeleteFileError
These are errors used to inform the client that is requesting a connection (deleting a file) what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| ACCESS_DENIED | 0 | ACCESS_DENIED denotes if file is not able to be deleted due to denial of access. |



<a name="kic.media.DownloadFileByNameError"></a>

### DownloadFileByNameError
These are errors used to inform the client that is requesting a connection (downloading a file) what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| FILE_NOT_FOUND | 0 | FILE_NOT_FOUND denotes if file is not found. |
| BUCKET_NOT_FOUND | 1 | BUCKET_NOT_FOUND denotes if bucket is not found. |



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
Service handling fetching and storing data about files.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| UploadFile | [UploadFileRequest](#kic.media.UploadFileRequest) stream | [UploadFileResponse](#kic.media.UploadFileResponse) | Send a file as a stream of messages, starting with a message containing a File message, then followed by an arbitrary number of messages containing bytes representing the file. The response will then confirm the number of bytes received or provide an error. |
| DownloadFileByName | [DownloadFileRequest](#kic.media.DownloadFileRequest) | [DownloadFileResponse](#kic.media.DownloadFileResponse) stream | Using the same format as above, the service allows the client to retrieve a stored file. |
| CheckForFileByName | [CheckForFileRequest](#kic.media.CheckForFileRequest) | [CheckForFileResponse](#kic.media.CheckForFileResponse) | Check for the existence of a file by filename |
| GetFilesWithMetadata | [GetFilesByMetadataRequest](#kic.media.GetFilesByMetadataRequest) | [GetFilesByMetadataResponse](#kic.media.GetFilesByMetadataResponse) | Allows for the requesting of files with specific key value pairs as metadata. The strictness can be set such that for example only perfect matches will be returned. |
| DeleteFilesWithMetaData | [DeleteFilesWithMetaDataRequest](#kic.media.DeleteFilesWithMetaDataRequest) | [DeleteFilesWithMetaDataResponse](#kic.media.DeleteFilesWithMetaDataResponse) | Using the same strictness settings as the above, delete particular files with certain metadata. |

 



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
| birthday | [kic.common.Date](#kic.common.Date) |  | User&#39;s birthday in MM/DD/YYYY format. |
| city | [string](#string) |  | User&#39;s city location. |






<a name="kic.users.AddUserResponse"></a>

### AddUserResponse
Response to a request for adding a user to the database.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was properly created. |
| createdUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user should they be accepted. |
| errors | [AddUserError](#kic.users.AddUserError) | repeated | Array of errors which need to be fixed by the client. |






<a name="kic.users.DeleteUserByIDRequest"></a>

### DeleteUserByIDRequest
Request to delete a user with a given user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | user id sent in request |






<a name="kic.users.DeleteUserByIDResponse"></a>

### DeleteUserByIDResponse
Response to a request to delete a user with a given user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was successfully deleted. |
| deletedUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user should they be accepted. |






<a name="kic.users.GetJWTTokenRequest"></a>

### GetJWTTokenRequest
A Request to the server to return a JWT token to authenticate the remainder of the session with the given user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  | Requesting user&#39;s username |
| password | [string](#string) |  | Requesting user&#39;s password |






<a name="kic.users.GetJWTTokenResponse"></a>

### GetJWTTokenResponse
The server response to a client request for a JWT, either providing the token or an error response.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [string](#string) |  | Return the token as a string should the client send proper credentials |
| error | [GetJWTTokenResponse.JWTError](#kic.users.GetJWTTokenResponse.JWTError) |  | Tell the client the issue with the request should one exist |






<a name="kic.users.GetUserByIDRequest"></a>

### GetUserByIDRequest
Request for obtaining userdata from id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  |  |






<a name="kic.users.GetUserByIDResponse"></a>

### GetUserByIDResponse
Response to a request for obtaining user data from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | denotes if the user was successfully found |
| user | [kic.common.User](#kic.common.User) |  | User returned in response |
| errors | [GetUserError](#kic.users.GetUserError) | repeated | Array of errors for getting user by username |






<a name="kic.users.GetUserByUsernameRequest"></a>

### GetUserByUsernameRequest
Request for obtaining user data from username


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  | username sent in request |






<a name="kic.users.GetUserByUsernameResponse"></a>

### GetUserByUsernameResponse
Response to a request for obtaining user data from a username


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | denotes if the user was successfully found |
| user | [kic.common.User](#kic.common.User) |  | User returned in response |
| errors | [GetUserError](#kic.users.GetUserError) | repeated | Array of errors for getting user by username |






<a name="kic.users.GetUserNameByIDRequest"></a>

### GetUserNameByIDRequest
Request for obtaining username from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | user id sent in request |






<a name="kic.users.GetUserNameByIDResponse"></a>

### GetUserNameByIDResponse
Response to a request for obtaining username from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  | username associated with the given user id |






<a name="kic.users.UpdateUserInfoRequest"></a>

### UpdateUserInfoRequest
Request to update a user&#39;s information with the information provided


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| desiredInfo | [kic.common.User](#kic.common.User) |  | Only required item is the User id which is used to identify what entry to update, all other non null fields will be used to update the proper column in the database |






<a name="kic.users.UpdateUserInfoResponse"></a>

### UpdateUserInfoResponse
Response to a request to update a user&#39;s information with the information provided


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was properly updated. |
| updatedUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user. |
| errors | [AddUserError](#kic.users.AddUserError) | repeated | Array of errors which need to be fixed by the client. |





 


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



<a name="kic.users.GetJWTTokenResponse.JWTError"></a>

### GetJWTTokenResponse.JWTError
Errors with the request that the client will need to fix

| Name | Number | Description |
| ---- | ------ | ----------- |
| INVALID_PASSWORD | 0 | Incorrect password sent |
| INVALID_USERNAME | 1 | Incorrect username sent |



<a name="kic.users.GetUserError"></a>

### GetUserError
These are errors used to inform the client requesting a user what the issue is.
The variable names denote the issue.

| Name | Number | Description |
| ---- | ------ | ----------- |
| INVALID_USERNAME | 0 | The given username does not match any records |
| INVALID_ID | 1 | User ID does not exist |


 

 


<a name="kic.users.Users"></a>

### Users
Service handling fetching and storing data about users.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetJWTToken | [GetJWTTokenRequest](#kic.users.GetJWTTokenRequest) | [GetJWTTokenResponse](#kic.users.GetJWTTokenResponse) | Authenticate the client session and return a JWT that can be utilized for all further contact requiring authentication |
| AddUser | [AddUserRequest](#kic.users.AddUserRequest) | [AddUserResponse](#kic.users.AddUserResponse) | Add a new user to the database. |
| GetUserByUsername | [GetUserByUsernameRequest](#kic.users.GetUserByUsernameRequest) | [GetUserByUsernameResponse](#kic.users.GetUserByUsernameResponse) | Request user information from a username. |
| GetUserByID | [GetUserByIDRequest](#kic.users.GetUserByIDRequest) | [GetUserByIDResponse](#kic.users.GetUserByIDResponse) | Request user information from a User ID. |
| GetUserNameByID | [GetUserNameByIDRequest](#kic.users.GetUserNameByIDRequest) | [GetUserNameByIDResponse](#kic.users.GetUserNameByIDResponse) | Request only a username from a User ID. |
| DeleteUserByID | [DeleteUserByIDRequest](#kic.users.DeleteUserByIDRequest) | [DeleteUserByIDResponse](#kic.users.DeleteUserByIDResponse) | Delete the user with the given ID, this will need to cascade to other services. |
| UpdateUserInfo | [UpdateUserInfoRequest](#kic.users.UpdateUserInfoRequest) | [UpdateUserInfoResponse](#kic.users.UpdateUserInfoResponse) | Update a user&#39;s information to that sent by the client. |

 



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

