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
  
    - [Feed](#kic.feed.Feed)
  
- [proto/friends.proto](#proto/friends.proto)
    - [AddAwaitingFriendRequest](#kic.friends.AddAwaitingFriendRequest)
    - [AddAwaitingFriendResponse](#kic.friends.AddAwaitingFriendResponse)
    - [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse)
    - [CreateConnectionForUsersRequest](#kic.friends.CreateConnectionForUsersRequest)
    - [CreateConnectionForUsersResponse](#kic.friends.CreateConnectionForUsersResponse)
    - [DeleteConnectionBetweenUsersRequest](#kic.friends.DeleteConnectionBetweenUsersRequest)
    - [DeleteConnectionBetweenUsersResponse](#kic.friends.DeleteConnectionBetweenUsersResponse)
    - [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest)
    - [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest)
    - [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse)
    - [GetFriendsUsernamesForUserResponse](#kic.friends.GetFriendsUsernamesForUserResponse)
    - [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest)
    - [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse)
    - [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest)
  
    - [Friends](#kic.friends.Friends)
  
- [proto/health.proto](#proto/health.proto)
    - [AddHealthDataForUserRequest](#kic.health.AddHealthDataForUserRequest)
    - [AddHealthDataForUserResponse](#kic.health.AddHealthDataForUserResponse)
    - [DeleteHealthDataForUserRequest](#kic.health.DeleteHealthDataForUserRequest)
    - [DeleteHealthDataForUserResponse](#kic.health.DeleteHealthDataForUserResponse)
    - [GetHealthDataByDateRequest](#kic.health.GetHealthDataByDateRequest)
    - [GetHealthDataByDateResponse](#kic.health.GetHealthDataByDateResponse)
    - [GetHealthDataForUserRequest](#kic.health.GetHealthDataForUserRequest)
    - [GetHealthDataForUserResponse](#kic.health.GetHealthDataForUserResponse)
    - [GetMentalHealthScoreForUserRequest](#kic.health.GetMentalHealthScoreForUserRequest)
    - [GetMentalHealthScoreForUserResponse](#kic.health.GetMentalHealthScoreForUserResponse)
    - [MentalHealthLog](#kic.health.MentalHealthLog)
    - [UpdateHealthDataForDateRequest](#kic.health.UpdateHealthDataForDateRequest)
    - [UpdateHealthDataForDateResponse](#kic.health.UpdateHealthDataForDateResponse)
  
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
    - [UpdateFilesWithMetadataRequest](#kic.media.UpdateFilesWithMetadataRequest)
    - [UpdateFilesWithMetadataRequest.DesiredMetadataEntry](#kic.media.UpdateFilesWithMetadataRequest.DesiredMetadataEntry)
    - [UpdateFilesWithMetadataRequest.FilterMetadataEntry](#kic.media.UpdateFilesWithMetadataRequest.FilterMetadataEntry)
    - [UpdateFilesWithMetadataResponse](#kic.media.UpdateFilesWithMetadataResponse)
    - [UploadFileRequest](#kic.media.UploadFileRequest)
    - [UploadFileResponse](#kic.media.UploadFileResponse)
  
    - [MetadataStrictness](#kic.media.MetadataStrictness)
    - [UpdateFlag](#kic.media.UpdateFlag)
  
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
  
    - [Users](#kic.users.Users)
  
- [Scalar Value Types](#scalar-value-types)



<a name="proto/common.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/common.proto
These are messages used commonly throughout the rest of the proto files within the project.


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
| fileName | [string](#string) |  | Simply the file name with an extension. |
| fileLocation | [string](#string) |  | This is a client specific file location, for example a google cloud bucket name. |
| metadata | [File.MetadataEntry](#kic.common.File.MetadataEntry) | repeated | Allows for arbitrary key/value metadata which can be client specific, for example the ID of the user of interest can be stored here . |
| dateStored | [Date](#kic.common.Date) |  | The date of storage of the file, used in particular for feed generation. |






<a name="kic.common.File.MetadataEntry"></a>

### File.MetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.common.User"></a>

### User
A representation of a User that will be used to identify them between services and when being displayed
on the frontend.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| userName | [string](#string) |  | User&#39;s account username. |
| email | [string](#string) |  | The email registered by this user. |
| birthday | [Date](#kic.common.Date) |  | The birthday of the user. |
| city | [string](#string) |  | The city that the user is from. |
| bio | [string](#string) |  | The bio the user would like to be displayed about them. |





 

 

 

 



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





 

 

 


<a name="kic.feed.Feed"></a>

### Feed
Interface provided by a service handling generating data for user feed

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GenerateFeedForUser | [GenerateFeedForUserRequest](#kic.feed.GenerateFeedForUserRequest) | [GenerateFeedForUserResponse](#kic.feed.GenerateFeedForUserResponse) stream | Generate a stream of posts until either exhausted or the client requests an end. |

 



<a name="proto/friends.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/friends.proto
These are messages and services relating to a friend services, such as viewing, adding,
and removing friends, as well as generating friend recommendations for a user.


<a name="kic.friends.AddAwaitingFriendRequest"></a>

### AddAwaitingFriendRequest
Request representing the case where the first user sends a friend request to the second user, so that they will
be displayed in the second user&#39;s pending friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |






<a name="kic.friends.AddAwaitingFriendResponse"></a>

### AddAwaitingFriendResponse
Request denoting whether the friend request was properly sent to the second user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Was the friend request created successfully |






<a name="kic.friends.ConnectionBetweenUsersResponse"></a>

### ConnectionBetweenUsersResponse
Response to a request for fetching the connection between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
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
Request denoting whether the connection was successfully created between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Was the connection created successfully |






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






<a name="kic.friends.GetConnectionBetweenUsersRequest"></a>

### GetConnectionBetweenUsersRequest
Retrieve the connection between two users.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| firstUserID | [uint64](#uint64) |  | ID of the first user. |
| secondUserID | [uint64](#uint64) |  | ID of the second user. |






<a name="kic.friends.GetFriendsForUserRequest"></a>

### GetFriendsForUserRequest
Request to get the provided user&#39;s friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user | [kic.common.User](#kic.common.User) |  | Inform the backend of information regarding the user you would like the friends of. |






<a name="kic.friends.GetFriendsForUserResponse"></a>

### GetFriendsForUserResponse
Response to a request for getting the user&#39;s friends, returning the user IDs of all the user&#39;s friends.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| friends | [uint64](#uint64) | repeated | An array of all other users that the user is currently friends with. |






<a name="kic.friends.GetFriendsUsernamesForUserResponse"></a>

### GetFriendsUsernamesForUserResponse
Response to a request for getting the the usernames of all the friends of a given user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| friends | [string](#string) | repeated | An array of all other users that the user is currently friends with. |






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





 

 

 


<a name="kic.friends.Friends"></a>

### Friends
Interface provided by a service handling fetching and storing data about friends.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetFriendsUsernamesForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsUsernamesForUserResponse](#kic.friends.GetFriendsUsernamesForUserResponse) | Request a list of the usernames of all friends of a particular user. |
| GetAwaitingFriendsUsernamesForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsUsernamesForUserResponse](#kic.friends.GetFriendsUsernamesForUserResponse) | Request a list of the usernames of all awaiting friends of a particular user. |
| GetFriendsForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse) | Request a list of the IDs of all friends of a particular user. |
| GetAwaitingFriendsForUser | [GetFriendsForUserRequest](#kic.friends.GetFriendsForUserRequest) | [GetFriendsForUserResponse](#kic.friends.GetFriendsForUserResponse) | Request a list of the IDs of all pending friends of a particular user. |
| GetConnectionBetweenUsers | [GetConnectionBetweenUsersRequest](#kic.friends.GetConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) | Request information about the connection between two users, checking for existence and strength. |
| GetRecommendationsForUser | [GetRecommendationsForUserRequest](#kic.friends.GetRecommendationsForUserRequest) | [GetRecommendationsForUserResponse](#kic.friends.GetRecommendationsForUserResponse) | Request a list of given size of users who might be friends of the requesting user. |
| CreateConnectionForUsers | [CreateConnectionForUsersRequest](#kic.friends.CreateConnectionForUsersRequest) | [CreateConnectionForUsersResponse](#kic.friends.CreateConnectionForUsersResponse) | Add two users as friends and create a connection between them. |
| AddAwaitingFriend | [AddAwaitingFriendRequest](#kic.friends.AddAwaitingFriendRequest) | [AddAwaitingFriendResponse](#kic.friends.AddAwaitingFriendResponse) | Create a friend request between two users. |
| UpdateConnectionBetweenUsers | [UpdateConnectionBetweenUsersRequest](#kic.friends.UpdateConnectionBetweenUsersRequest) | [ConnectionBetweenUsersResponse](#kic.friends.ConnectionBetweenUsersResponse) | Update a connection strength between two users. |
| DeleteConnectionBetweenUsers | [DeleteConnectionBetweenUsersRequest](#kic.friends.DeleteConnectionBetweenUsersRequest) | [DeleteConnectionBetweenUsersResponse](#kic.friends.DeleteConnectionBetweenUsersResponse) | Delete the connection between two users. |
| DeleteAwaitingFriendBetweenUsers | [DeleteConnectionBetweenUsersRequest](#kic.friends.DeleteConnectionBetweenUsersRequest) | [DeleteConnectionBetweenUsersResponse](#kic.friends.DeleteConnectionBetweenUsersResponse) | Delete the pending friend request between two users. |

 



<a name="proto/health.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/health.proto
These are messages and services relating to mental health tracking data, allowing for
the logging of user mental health data and tracking the quality of their mental health state
from day to day.


<a name="kic.health.AddHealthDataForUserRequest"></a>

### AddHealthDataForUserRequest
Request from a user to add their mental health data to the Mental Health Log.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| newEntry | [MentalHealthLog](#kic.health.MentalHealthLog) |  | The MentalHealthLog being submitted for storage in the backend. |






<a name="kic.health.AddHealthDataForUserResponse"></a>

### AddHealthDataForUserResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  |  |






<a name="kic.health.DeleteHealthDataForUserRequest"></a>

### DeleteHealthDataForUserRequest
Request from a user to delete their mental health data from MentalHealthLog.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| all | [bool](#bool) |  | Denotes that all of the health data should be removed. |
| dateToRemove | [kic.common.Date](#kic.common.Date) |  | Denotes the date of the mental health log data to remove. |






<a name="kic.health.DeleteHealthDataForUserResponse"></a>

### DeleteHealthDataForUserResponse
Response to a request to delete health data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| entriesDeleted | [uint32](#uint32) |  | Denotes the number of Mental Health Log entries that was successfully deleted for the user |






<a name="kic.health.GetHealthDataByDateRequest"></a>

### GetHealthDataByDateRequest
Request for the Mental Health Log for a particular date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| logDate | [kic.common.Date](#kic.common.Date) |  | Date of Mental Health Log Entry |






<a name="kic.health.GetHealthDataByDateResponse"></a>

### GetHealthDataByDateResponse
Response containing the Mental Health Logs for a given date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| healthData | [MentalHealthLog](#kic.health.MentalHealthLog) | repeated | List of all the Mental Health Log entries for the date requested. |






<a name="kic.health.GetHealthDataForUserRequest"></a>

### GetHealthDataForUserRequest
Request from a user to get their mental health tracking data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |






<a name="kic.health.GetHealthDataForUserResponse"></a>

### GetHealthDataForUserResponse
Response when Mental Health Logs are requested for a given user, providing all applicable logs.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| healthData | [MentalHealthLog](#kic.health.MentalHealthLog) | repeated | Denotes the data that was requested by user from the Mental Health Log. |






<a name="kic.health.GetMentalHealthScoreForUserRequest"></a>

### GetMentalHealthScoreForUserRequest
Request form a user to get a mental health score


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |






<a name="kic.health.GetMentalHealthScoreForUserResponse"></a>

### GetMentalHealthScoreForUserResponse
Response to return a mental health score given a user ID


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| score | [int32](#int32) |  | The overall mental health score for the requested user. |






<a name="kic.health.MentalHealthLog"></a>

### MentalHealthLog
A message representing a single Mental Health Log entry.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| logDate | [kic.common.Date](#kic.common.Date) |  | Date of Mental Health Log Entry. |
| score | [int32](#int32) |  | The score the user gave their current mood at the time of the log submittal. |
| journalName | [string](#string) |  | Contains a journal entry from the user, allowing them to write about how they currently are feeling. |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |






<a name="kic.health.UpdateHealthDataForDateRequest"></a>

### UpdateHealthDataForDateRequest
Request from a user to update their mental health tracking data for a particular date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | The ID of the user in the user database, used globally for identification. |
| desiredLogInfo | [MentalHealthLog](#kic.health.MentalHealthLog) |  | Denotes the log info that the user would like to update. |






<a name="kic.health.UpdateHealthDataForDateResponse"></a>

### UpdateHealthDataForDateResponse
Request from a user to update their mental health tracking data for a particular date.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the log entry was successfully updated |





 

 

 


<a name="kic.health.HealthTracking"></a>

### HealthTracking
Interface provided by a service handling fetching and storing mental health tracking data about users.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetHealthDataForUser | [GetHealthDataForUserRequest](#kic.health.GetHealthDataForUserRequest) | [GetHealthDataForUserResponse](#kic.health.GetHealthDataForUserResponse) | Given health data obtained upon user request, said health data is returned to user. |
| AddHealthDataForUser | [AddHealthDataForUserRequest](#kic.health.AddHealthDataForUserRequest) | [AddHealthDataForUserResponse](#kic.health.AddHealthDataForUserResponse) | Health data requested to be added by user is added, and error is returned if appropriate. |
| DeleteHealthDataForUser | [DeleteHealthDataForUserRequest](#kic.health.DeleteHealthDataForUserRequest) | [DeleteHealthDataForUserResponse](#kic.health.DeleteHealthDataForUserResponse) | Health data requested by user to be deleted is deleted and said deleted entries are returned to user. |
| UpdateHealthDataForDate | [UpdateHealthDataForDateRequest](#kic.health.UpdateHealthDataForDateRequest) | [UpdateHealthDataForDateResponse](#kic.health.UpdateHealthDataForDateResponse) | Health data requested to be updated by user is updated, and error is returned if appropriate. |
| GetMentalHealthScoreForUser | [GetMentalHealthScoreForUserRequest](#kic.health.GetMentalHealthScoreForUserRequest) | [GetMentalHealthScoreForUserResponse](#kic.health.GetMentalHealthScoreForUserResponse) | Given user ID, returns a mental health score for a user |
| GetHealthDataByDate | [GetHealthDataByDateRequest](#kic.health.GetHealthDataByDateRequest) | [GetHealthDataByDateResponse](#kic.health.GetHealthDataByDateResponse) | Given a date and user ID, return health data log for a specific date |

 



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
Response to delete file for user with metadata request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Whether the delete operation was successful |






<a name="kic.media.DownloadFileRequest"></a>

### DownloadFileRequest
Request to download file for user


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  | Information of file to be downloaded |






<a name="kic.media.DownloadFileResponse"></a>

### DownloadFileResponse
Response to download file for user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chunk | [string](#string) |  |  |






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






<a name="kic.media.UpdateFilesWithMetadataRequest"></a>

### UpdateFilesWithMetadataRequest
Request to update files that contain matching metadata.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| desiredMetadata | [UpdateFilesWithMetadataRequest.DesiredMetadataEntry](#kic.media.UpdateFilesWithMetadataRequest.DesiredMetadataEntry) | repeated | Map of the field that should be updated in the stored map, or created if they do not exist. |
| filterMetadata | [UpdateFilesWithMetadataRequest.FilterMetadataEntry](#kic.media.UpdateFilesWithMetadataRequest.FilterMetadataEntry) | repeated | The metadata used as a selector for what files to update. |
| strictness | [MetadataStrictness](#kic.media.MetadataStrictness) |  | Flags sent to tell the server how seriously it wants the metadata request to be conformed to. |
| updateFlag | [UpdateFlag](#kic.media.UpdateFlag) |  | Indicates if the metadata should be overwritten or appended to. |






<a name="kic.media.UpdateFilesWithMetadataRequest.DesiredMetadataEntry"></a>

### UpdateFilesWithMetadataRequest.DesiredMetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.media.UpdateFilesWithMetadataRequest.FilterMetadataEntry"></a>

### UpdateFilesWithMetadataRequest.FilterMetadataEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="kic.media.UpdateFilesWithMetadataResponse"></a>

### UpdateFilesWithMetadataResponse
Response to a request to update the metadata for a set of files.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| numFilesUpdated | [int64](#int64) |  | The number of files updated by the operation |






<a name="kic.media.UploadFileRequest"></a>

### UploadFileRequest
Request to upload file for user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileInfo | [kic.common.File](#kic.common.File) |  | File information that should be stored with the file. |
| fileURI | [string](#string) |  | Base64 encoding of the file which will be stored. |






<a name="kic.media.UploadFileResponse"></a>

### UploadFileResponse
Response to user requesting file upload.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| fileID | [string](#string) |  | Id of file being uploaded |
| bytesRead | [uint64](#uint64) |  | Size of file in bytes |





 


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



<a name="kic.media.UpdateFlag"></a>

### UpdateFlag
Enum for Update Operation update flag.

| Name | Number | Description |
| ---- | ------ | ----------- |
| OVERWRITE | 0 | Should the operation overwrite existing metadata. |
| APPEND | 1 | Should the operation append to existing metadata values, when it makes sense to. |


 

 


<a name="kic.media.MediaStorage"></a>

### MediaStorage
Interface provided by a service handling fetching and storing data about files.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| UploadFile | [UploadFileRequest](#kic.media.UploadFileRequest) | [UploadFileResponse](#kic.media.UploadFileResponse) | Upload a file as a single base64 encoded string. |
| DownloadFileByName | [DownloadFileRequest](#kic.media.DownloadFileRequest) | [DownloadFileResponse](#kic.media.DownloadFileResponse) stream | Send a file as a stream of messages containing a base64 encoding representing the file. |
| CheckForFileByName | [CheckForFileRequest](#kic.media.CheckForFileRequest) | [CheckForFileResponse](#kic.media.CheckForFileResponse) | Check for the existence of a file by filename. |
| UpdateFilesWithMetadata | [UpdateFilesWithMetadataRequest](#kic.media.UpdateFilesWithMetadataRequest) | [UpdateFilesWithMetadataResponse](#kic.media.UpdateFilesWithMetadataResponse) | Update a set of files with new metadata values. |
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
| email | [string](#string) |  | The email of the user, must be unique. |
| desiredUsername | [string](#string) |  | The username of the user, must also be unique. |
| desiredPassword | [string](#string) |  | The password the user would like stored |
| birthday | [kic.common.Date](#kic.common.Date) |  | User&#39;s birthday in MM/DD/YYYY format. |
| city | [string](#string) |  | User&#39;s city location. |






<a name="kic.users.AddUserResponse"></a>

### AddUserResponse
Response to a request for adding a user to the database.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was properly created. |
| createdUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user should they be accepted. |






<a name="kic.users.DeleteUserByIDRequest"></a>

### DeleteUserByIDRequest
Request to delete a user with a given user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | User ID sent in request |






<a name="kic.users.DeleteUserByIDResponse"></a>

### DeleteUserByIDResponse
Response to a request to delete a user with a given user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was successfully deleted. |






<a name="kic.users.GetJWTTokenRequest"></a>

### GetJWTTokenRequest
A Request to the server to return a JWT token to authenticate the remainder of the session with the given user.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  | Requesting user&#39;s username |
| password | [string](#string) |  | Requesting user&#39;s password |






<a name="kic.users.GetJWTTokenResponse"></a>

### GetJWTTokenResponse
The server response to a client request for a JWT, providing the token.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [string](#string) |  | Return the token as a string should the client send proper credentials |






<a name="kic.users.GetUserByIDRequest"></a>

### GetUserByIDRequest
Request for obtaining userdata from id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | User ID sent in request |






<a name="kic.users.GetUserByIDResponse"></a>

### GetUserByIDResponse
Response to a request for obtaining user data from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | denotes if the user was successfully found |
| user | [kic.common.User](#kic.common.User) |  | User returned in response |






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






<a name="kic.users.GetUserNameByIDRequest"></a>

### GetUserNameByIDRequest
Request for obtaining username from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | User ID sent in request |






<a name="kic.users.GetUserNameByIDResponse"></a>

### GetUserNameByIDResponse
Response to a request for obtaining username from user id


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| username | [string](#string) |  | Username associated with the given user id |






<a name="kic.users.UpdateUserInfoRequest"></a>

### UpdateUserInfoRequest
Request to update a user&#39;s information with the information provided. Only non-null fields will be updated,
and the userID is not mutable.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| userID | [int64](#int64) |  | Only required item is the UserID which is used to identify what entry to update, all other non null fields will be used to update the proper column in the database |
| email | [string](#string) |  | The email of the user, must be unique. |
| desiredUsername | [string](#string) |  | The username of the user, must also be unique. |
| desiredPassword | [string](#string) |  | The password the user would like stored. |
| birthday | [kic.common.Date](#kic.common.Date) |  | User&#39;s birthday in MM/DD/YYYY format. |
| city | [string](#string) |  | User&#39;s city location. |
| bio | [string](#string) |  | The new bio that the user would like displayed. |






<a name="kic.users.UpdateUserInfoResponse"></a>

### UpdateUserInfoResponse
Response to a request to update a user&#39;s information with the information provided


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| success | [bool](#bool) |  | Denotes if the user was properly updated. |
| updatedUser | [kic.common.User](#kic.common.User) |  | Inform the client of the information assigned to the user. |





 

 

 


<a name="kic.users.Users"></a>

### Users
Interface provided by a service handling fetching and storing data about users.

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

