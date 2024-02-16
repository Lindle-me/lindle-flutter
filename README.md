# Lindle Flutter
Lindle is your ultimate solution for managing and organizing your web links with ease. This versatile Chrome extension empowers you to save, categorize, and access your online resources like never before.

<a href="https://www.buymeacoffee.com/m2kdevelopments" target="_blank">
<img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" />
</a>

<a href="https://play.google.com/store/apps/details?id=com.m2kdevelopments.lindle" target="_blank">
    <img src="./googleplay.png" alt="Google Play" style="height: 85px !important" />
</a>
<a href="https://chrome.google.com/webstore/detail/igkkojjaikfmiibedalhgmfnjohlhmaj" target="_blank">
    <img src="./chromestore.png" alt="Chrome Store" style="height: 85px !important" />
</a>


## API Documentation
The <a href="https://lindle.me/api-docs">API</a> Documentation for Lindle.


## Installation
```
flutter pub add lindle
```
 

## Getting Started
Get your Lindle API key from <a href="https://chrome.google.com/webstore/detail/igkkojjaikfmiibedalhgmfnjohlhmaj">Chrome Extension</a>.
<br/>
<img src="./api.png" alt="Chrome Extension" style="height: 400px !important" />

```
const apiKey = "Your key here...";
const lindle = Lindle(apiKey:apiKey);
```

## Get Links
```
lindle.getLinks().then((links) => {
    console.log(links);
});
```


## Get Folders
```
lindle.getFolders().then((folders) => {
    console.log(folders);
});
```

## Get Synced Bookmarks
```
lindle.getSyncedBookmarks().then((data) => {
    console.log(data.folders);
    console.log(data.links);
});
```